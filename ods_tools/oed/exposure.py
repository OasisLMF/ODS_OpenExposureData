"""
This package manage:
    loading an OED schema
    the loading, checking and saving of OED files
    support conversion of OED to other currencies
"""

import json
from pathlib import Path

from .common import (PANDAS_COMPRESSION_MAP,
                     USUAL_FILE_NAME, OED_TYPE_TO_NAME)
from .schema import OedSchema
from .source import OedSource
from .validator import Validator
from .forex import create_currency_rates


class OedExposure:
    """
    Object grouping all the OED files related to the exposure Data (location, acoount, ri_info, ri_scope)
    and the OED schema to follow
    """
    DEFAULT_EXPOSURE_CONFIG_NAME = 'exposure_info.json'

    def __init__(self,
                 location,
                 account=None,
                 ri_info=None,
                 ri_scope=None,
                 oed_schema_info=None,
                 currency_conversion=None,
                 reporting_currency=None,
                 check_oed=False,
                 use_field=False,
                 validation_config=None,
                 working_dir=None):
        """
        Create an OED object,
        each input can be the object itself or  information that will be used to create the object

        Args:
            location (path or dict or OedSource or pd.DataFrame): info for location
            account (path or dict or OedSource or pd.DataFrame): info for account
            ri_info (path or dict or OedSource or pd.DataFrame): info for ri_info
            ri_scope (path or dict or OedSource or pd.DataFrame): info for ri_scope
            oed_schema_info (path_to_json, OedSchema, None): info for oed_schema
            currency_conversion (path_to_json or dict or None): info  currency_conversion
            reporting_currency (str): currency to convert
            check_oed (bool): check if OED files are valid or not
            use_field (bool): if true column name are converted to OED field name on load
        """
        self.use_field = use_field
        self.oed_schema = OedSchema.from_oed_schema_info(oed_schema_info)

        self.location = OedSource.from_oed_info(exposure=self, oed_type='Loc', oed_info=location)
        self.account = OedSource.from_oed_info(exposure=self, oed_type='Acc', oed_info=account)
        self.ri_info = OedSource.from_oed_info(exposure=self, oed_type='ReinsInfo', oed_info=ri_info)
        self.ri_scope = OedSource.from_oed_info(exposure=self, oed_type='ReinsScope', oed_info=ri_scope)

        if not self.location:
            raise Exception(f"Exposure needs a Location file, location={location}")

        if ri_info or ri_scope:
            if not account:
                raise Exception(f"Exposure needs account if reinsurance is provided account={account}")
            if not ri_info and ri_scope:
                raise Exception(f"Exposure needs both ri_scope and ri_scope for reinsurance ri_info={ri_info} ri_scope={ri_scope}")

        self.currency_conversion = create_currency_rates(currency_conversion)

        self.reporting_currency = reporting_currency

        self.validation_config = validation_config

        self.working_dir = working_dir

        if check_oed:
            self.check()

    @classmethod
    def from_config(cls, config_fp, **kwargs):
        """
        create an OedExposure from filepath to a config json file
        Args:
            config_fp (str): path
        Returns:
            OedExposure object
        """
        with open(config_fp) as config:
            kwargs['working_dir'] = Path(config_fp).parent
            return cls(**{**json.load(config), **kwargs})

    @classmethod
    def from_dir(cls, oed_dir, **kwargs):
        """
        create an OedExposure from directory path
        Args:
            oed_dir (str): path to the directory
        Returns:
            OedExposure object
        """
        def find_fp(names):
            for name in names:
                for extension in PANDAS_COMPRESSION_MAP.values():
                    if Path(oed_dir, name).with_suffix(extension).is_file():
                        return Path(oed_dir, name).with_suffix(extension)

        if Path(oed_dir, cls.DEFAULT_EXPOSURE_CONFIG_NAME).is_file():
            return cls.from_config(Path(oed_dir, cls.DEFAULT_EXPOSURE_CONFIG_NAME), **kwargs)
        else:
            config = {}
            for attr, filenames in USUAL_FILE_NAME.items():
                config[attr] = find_fp(filenames)

            if Path(oed_dir, OedSchema.DEFAULT_ODS_SCHEMA_FILE).is_file():
                config['oed_schema_info'] = Path(oed_dir, OedSchema.DEFAULT_ODS_SCHEMA_FILE)
            kwargs['working_dir'] = oed_dir
            return cls(**{**config, **kwargs})

    @property
    def info(self):
        """info on exposure Data to be able to reload it"""
        info = {}
        for source in self.get_oed_sources():
            info[source.oed_name] = source.info
        info['oed_schema_info'] = self.oed_schema.info
        return info

    def get_input_fields(self, oed_type):
        """
        helper function to get OED input field info for a particular oed_type
        Args:
            oed_type:

        Returns:
            dict of OED input field info
        """
        return self.oed_schema.schema['input_fields'][oed_type]

    @property
    def reporting_currency(self):
        return self._reporting_currency

    @reporting_currency.setter
    def reporting_currency(self, reporting_currency):
        """setter for reporting_currency that will automatically convert currency in all OED files"""
        self._reporting_currency = reporting_currency
        if reporting_currency:
            for oed_source in self.get_oed_sources():
                oed_source.convert_currency()

    def get_oed_sources(self):
        """
        yield all the non-null oed_sources
        Returns:
            generator of all oed_sources
        """
        for oed_type, oed_name in OED_TYPE_TO_NAME.items():
            oed_source: OedSource = getattr(self, oed_name)
            if oed_source:
                yield oed_source

    def save_config(self, filepath):
        """
        save data to directory, loadable later on
        Args:
            filepath (str): path to save the config file
        """
        Path(filepath).parents[0].mkdir(parents=True, exist_ok=True)
        with open(filepath, 'w') as info_file:
            json.dump(self.info, info_file, indent='  ', default=str)

    def save(self, path, version_name=None, compression=None, save_config=False):
        """
        helper function to save all OED data to a location with specific compression
        Args:
            version_name (str): use as a prefix for the file names, if None name will be taken from the cur_version file name
                          if it's a filepath
            path (str): output folder
            compression (str): type of compression to use
            save_config (bool): if true save the Exposure config as json
        """
        self.working_dir = path

        for oed_source in self.get_oed_sources():
            if version_name is None and oed_source.sources[oed_source.cur_version_name]['source_type'] == 'filepath':
                oed_name = Path(oed_source.sources[oed_source.cur_version_name]['filepath']).name
                if oed_source.cur_version_name.rsplit('_', 1)[-1] in PANDAS_COMPRESSION_MAP:
                    saved_version_name = oed_source.cur_version_name.rsplit('_', 1)[0]
                else:
                    saved_version_name = oed_source.cur_version_name
            elif version_name:
                oed_name = f'{version_name}_{OED_TYPE_TO_NAME[oed_source.oed_type]}'
                saved_version_name = version_name
            else:
                oed_name = f'{OED_TYPE_TO_NAME[oed_source.oed_type]}'
                saved_version_name = ''

            if save_config:  # we store filepath relative to config file
                filepath = Path(oed_name)
            else:
                filepath = Path(path, oed_name)

            if compression is None:
                if oed_source.sources[oed_source.cur_version_name]['source_type'] == 'filepath':
                    compression = oed_source.sources[oed_source.cur_version_name].get('extension')
                if compression is None:
                    compression = 'csv'

            filepath = filepath.with_suffix(PANDAS_COMPRESSION_MAP[compression])

            oed_source.save(saved_version_name + '_' + f'{compression}',
                            {'source_type': 'filepath', 'filepath': filepath, 'extension': compression})
        if save_config:
            self.save_config(Path(path, self.DEFAULT_EXPOSURE_CONFIG_NAME))

    def check(self, validation_config=None):
        """
        check that all OED files respect rules related to an OedSchema

        Args:
            validation_config (list): list of validation to perform, if None the default validation list will be used

        Returns:
            list of invalid data where validation action was 'return'

        Raises:
            OdsException if some invalid data is found

        """
        if validation_config is None:
            validation_config = self.validation_config
        validator = Validator(self)
        return validator(validation_config)
