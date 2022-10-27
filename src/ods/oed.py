"""
This package manage:
    loading an oed schema
    the loading, checking and saving of oed files
    support conversion of oed to other currencies
"""

import json
import functools
import os
import pandas as pd
import numpy as np
from chardet.universaldetector import UniversalDetector
from pathlib import Path

from .ods_exception import OdsException
from .forex import create_currency_rates, convert_currency

try:
    from functools import cached_property
except ImportError:  # support for python < 3.8
    _missing = object()

    class cached_property(object):
        """A decorator that converts a function into a lazy property.  The
        function wrapped is called the first time to retrieve the result
        and then that calculated result is used the next time you access
        the value::

            class Foo(object):

                @cached_property
                def foo(self):
                    # calculate something important here
                    return 42

        The class has to have a `__dict__` in order for this property to
        work.
        """

        # implementation detail: this property is implemented as non-data
        # descriptor.  non-data descriptors are only invoked if there is
        # no entry with the same name in the instance's __dict__.
        # this allows us to completely get rid of the access function call
        # overhead.  If one choses to invoke __get__ by hand the property
        # will still work as expected because the lookup logic is replicated
        # in __get__ for manual invocation.

        def __init__(self, func, name=None, doc=None):
            self.__name__ = name or func.__name__
            self.__module__ = func.__module__
            self.__doc__ = doc or func.__doc__
            self.func = func

        def __get__(self, obj, type=None):
            if obj is None:
                return self
            value = obj.__dict__.get(self.__name__, _missing)
            if value is _missing:
                value = self.func(obj)
                obj.__dict__[self.__name__] = value
            return value

PANDAS_COMPRESSION_MAP = {'zip': '.zip',
                          'gzip': '.gz',
                          'bz2': '.bz2',
                          'zstd': '.zst',
                          'parquet': '.parquet'}

PANDAS_DEFAULT_NULL_VALUES = {
    '-1.#IND',
    '1.#QNAN',
    '1.#IND',
    '-1.#QNAN',
    '#N/A N/A',
    '#N/A',
    'N/A',
    'n/a',
    'NA',
    '#NA',
    'NULL',
    'null',
    'NaN',
    '-NaN',
    'nan',
    '-nan',
    '',
}

OED_TYPE_TO_NAME = {
    'Loc': 'location',
    'Acc': 'account',
    'ReinsInfo': 'ri_info',
    'ReinsScope': 'ri_scope'
}

OED_NAME_TO_TYPE = {value: key for key, value in OED_TYPE_TO_NAME.items()}

OED_IDENTIFIER_FIELDS = {
    'Loc': ['PortNumber', 'AccNumber', 'LocNumber'],
    'Acc': ['PortNumber', 'AccNumber', 'PolNumber', 'LayerNumber'],
    'ReinsInfo': ['ReinsNumber', 'ReinsLayerNumber', 'ReinsName', 'ReinsPeril'],
    'ReinsScope': ['ReinsNumber', 'PortNumber', 'AccNumber', 'LocNumber']
}

OED_PERIL_COLUMNS = ['AccPeril', 'PolPerilsCovered', 'PolPeril', 'CondPeril', 'LocPerilsCovered', 'LocPeril', 'ReinsPeril']


DEFAULT_ODS_SCHEMA_PATH = ods_field_fp = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
                                                      'data', 'OpenExposureData_Spec.json')


def detect_encoding(filepath):
    """
    Given a path to a CSV of unknown encoding
    read lines to detect its encoding type

    :param filepath: Filepath to check
    :type  filepath: str

    :return: Example `{'encoding': 'ISO-8859-1', 'confidence': 0.73, 'language': ''}`
    :rtype: dict
    """
    detector = UniversalDetector()
    with open(filepath, 'rb') as f:
        for line in f:
            detector.feed(line)
            if detector.done:
                break
    detector.close()
    return detector.result


class OedSchema:
    """
    Object managing information about a certain oed schema
    """
    def __init__(self, schema, json_path):
        self.schema = schema
        self.json_path = json_path

    @property
    def info(self):
        """
        Information necessary to reload the same OedSchema
        """
        return self.json_path

    @classmethod
    def from_oed_schema_info(cls, oed_schema_info):
        """
        Args:
        oed_schema_info: info to create OedSchema object, can be:
            - str to specify your own OedSchema path
            - OedSchema object will be return directly
            - None to get the current version Oed schema
        :return: OedSchema object
        """
        if isinstance(oed_schema_info, (str, Path)):
            return cls.from_json(oed_schema_info)
        elif isinstance(oed_schema_info, cls):
            return oed_schema_info
        elif oed_schema_info is None:
            return cls.from_json(DEFAULT_ODS_SCHEMA_PATH)
        else:
            raise OdsException(f"{oed_schema_info} is not a supported format to create {cls} object")

    @classmethod
    def from_json(cls, oed_json):
        """
        Create OedSchema from json file
        Args:
            oed_json: oed schema json path

        Returns:
            OedSchema
        """
        with open(oed_json) as f:
            schema = json.load(f)
            # reformat area code for efficient check
            country_area = set()
            for country, areas in schema['area'].items():
                for area in areas:
                    country_area.add((country, area))
            schema["country_area"] = country_area
            return cls(schema, oed_json)

    @staticmethod
    def colname_to_fieldname(colname: str, input_fields: dict):
        """
        Args:
            colname: name of the column in oed file
            input_fields: dict of all the field in ods_schema
        Return:
            name and info of the field in ods_schema
        """
        if colname.lower() in input_fields:
            return colname.lower()
        else:
            for field_suffix in ['xx', 'yyy']:
                for i in range(1, len(colname)):
                    field_name = colname.lower()[:-i] + field_suffix
                    if field_name in input_fields:
                        return field_name
            return None

    @staticmethod
    def is_valid_value(value, valid_ranges):
        """
        >>> OedSchema.is_valid_value(2, [{'min': 0, 'max': 5}, {'min': 10}, {'max': -5}, {'enum': [-999]}])
        True

        >>> OedSchema.is_valid_value(7, [{'min': 0, 'max': 5}, {'min': 10}, {'max': -5}, {'enum': [-999]}])
        False

        >>> OedSchema.is_valid_value(-10, [{'min': 0, 'max': 5}, {'min': 10}, {'max': -5}, {'enum': [-999]}])
        True

        >>> OedSchema.is_valid_value(-999, [{'min': 0, 'max': 5}, {'min': 10}, {'enum': [-999]}])
        True

        :param value: value to test
        :param valid_value_range: list of valid range
        :return: True if value is in one of the range
        """
        for valid_range in valid_ranges:
            if valid_range.get('min') is not None:
                if value < valid_range.get('min'):
                    continue
            if valid_range.get('max') is not None:
                if value > valid_range.get('max'):
                    continue
            if valid_range.get('enum') is not None:
                if value not in valid_range.get('enum'):
                    continue
            return True
        return False


class ExposureData:
    """
    Object grouping all the oed files related to the exposure Data (location, acoount, ri_info, ri_scope)
    and the oed schema to follow
    """
    def __init__(self,
                 location,
                 account=None,
                 ri_info=None,
                 ri_scope=None,
                 oed_schema_info=None,
                 currency_conversion=None,
                 reporting_currency=None,
                 check_oed=False):
        """
        Create an oed object,
        each input can be the object itself or  information that will be used to create the object
        Args:
            location: info for location
            account: info for account
            ri_info: info for ri_info
            ri_scope: info for ri_scope
            oed_schema_info: info for oed_schema
            currency_conversion: info  currency_convertion
            reporting_currency: currency to convert
            check_oed: check if oed files are valid or not
        """

        self.oed_schema = OedSchema.from_oed_schema_info(oed_schema_info)

        self.location = OedSource.from_oed_info(exposure_data=self, oed_type='Loc', oed_info=location)
        self.account = OedSource.from_oed_info(exposure_data=self, oed_type='Acc', oed_info=account)
        self.ri_info = OedSource.from_oed_info(exposure_data=self, oed_type='ReinsInfo', oed_info=ri_info)
        self.ri_scope = OedSource.from_oed_info(exposure_data=self, oed_type='ReinsScope', oed_info=ri_scope)

        if not self.location:
            raise Exception(f"ExposureData needs a Location file, {location=}")

        if ri_info or ri_scope:
            if not account:
                raise Exception(f"ExposureData needs account if reinsurance is provided {account=}")
            if not ri_info and ri_scope:
                raise Exception(f"ExposureData needs both ri_scope and ri_scope for reinsurance {ri_info=} {ri_scope=}")

        self.currency_conversion = create_currency_rates(currency_conversion)

        self.reporting_currency = reporting_currency
        if check_oed:
            self.check()

    @property
    def info(self):
        """info on exposure Data to be able to reload it"""
        info = {}
        for source_name in OED_TYPE_TO_NAME.values():
            info[source_name] = getattr(self, source_name).info
        info['oed_schema_info'] = self.oed_schema.info
        return info

    def get_input_fields(self, oed_type):
        """
        helper function to get oed input field info for a particular oed_type
        Args:
            oed_type:

        Returns:
            dict of oed input field info
        """
        return self.oed_schema.schema['input_fields'][oed_type]

    @property
    def reporting_currency(self):
        return self._reporting_currency

    @reporting_currency.setter
    def reporting_currency(self, reporting_currency):
        """setter for reporting_currency that will automatically convert currency in all oed files"""
        self._reporting_currency = reporting_currency
        if reporting_currency:
            for oed_type, oed_name in OED_TYPE_TO_NAME.items():
                oed_source: OedSource = getattr(self, oed_name)
                if oed_source:
                    oed_source.convert_currency()

    def save_config(self, filepath):
        """
        save data to directory, loadable later on
        Args:
            filepath: path to save the config file
        """
        Path(filepath).parents[0].mkdir(parents=True, exist_ok=True)
        with open(filepath, 'w') as info_file:
            json.dump(self.info, info_file, indent='  ')

    @classmethod
    def convert(cls, *,
                location=None,
                account=None,
                ri_info=None,
                ri_scope=None,
                check_oed=False,
                config_json=None,
                path=None,
                compression=None,
                save_config=False):
        """
        Convert oed files to another format
        Args:
            location: info on location
            account: info on account
            ri_info: info on ri_info
            ri_scope: info on ri_scope
            check_oed: bool to check if oed is valid
            config_json: Exposure data config
            path: path to save the oed files
            compression: compression to use (parquet, csv, zip, ...
            save_config: save the oed info with the files
        """
        if config_json:
            with open(config_json) as config_file:
                config = json.load(config_file)
        else:
            config = {}
        # override config with specific parameters
        if location: config['location'] = location
        if account: config['account'] = account
        if ri_info: config['ri_info'] = ri_info
        if ri_scope: config['ri_scope'] = ri_scope
        if check_oed : config['check_oed'] = check_oed

        oed = cls(**config)
        oed.save(path=path, compression=compression, save_config=save_config)

    def save(self, path, compression, save_config=False):
        """
        helper function to save all oed data to a location with specific compression
        Args:
            path: output folder
            compression: type of compression to use
        """
        for oed_type, oed_name in OED_TYPE_TO_NAME.items():
            oed_source: OedSource = getattr(self, oed_name)
            if oed_source:
                if oed_source.sources[oed_source.cur_version_name]['source_type'] == 'filepath':
                    filepath = Path(path, Path(oed_source.sources[oed_source.cur_version_name]['filepath']).name)
                else:
                    filepath = Path(path, oed_name)

                filepath = filepath.with_suffix(PANDAS_COMPRESSION_MAP[compression])

                oed_source.save(oed_source.cur_version_name+'_'+'compression',
                                {'source_type': 'filepath', 'filepath': filepath, 'extension': compression})
        if save_config:
            self.save_config(Path(path, 'oed_config.json'))

    def check(self):
        """
        check that all oed files respect rules related to an OedSchema
        Raises:
            OdsException if some invalid data is found

        """
        invalid_data = []

        for oed_type, oed_name in OED_TYPE_TO_NAME.items():
            oed_source: OedSource = getattr(self, oed_name)
            if oed_source:
                # check required field
                all_field_info = self.get_input_fields(oed_type)
                colname_to_fieldname = {colname: self.oed_schema.colname_to_fieldname(colname, all_field_info) for colname in oed_source.dataframe.columns}
                identifier_field = [colname for colname, fieldname in colname_to_fieldname.items() if all_field_info[fieldname]['Input Field Name'] in OED_IDENTIFIER_FIELDS[oed_type]]

                fieldname_to_colnames = {} #  fieldname_to_colnames stores a list for values, for most column the length will be 1 except for flexi columns
                for colname, fieldname in colname_to_fieldname.items():
                    fieldname_to_colnames.setdefault(fieldname, []).append(colname)

                for field_name, field_info in all_field_info.items():
                    if field_name not in fieldname_to_colnames:
                        if field_info.get('Required Field') == 'R':
                            invalid_data.append({'name': oed_name, 'source': oed_source.current_source,
                                                 'msg': f"missing required column {field_name}"})
                        else:
                            continue

                    for colname in fieldname_to_colnames[field_name]:
                        if (field_info.get("Allow blanks?") == 'NO'
                                and (oed_source.dataframe[colname].isna().any()
                                     or (field_info['pd_dtype'] == 'str'and oed_source.dataframe[colname].isnull().any()))):
                            invalid_data.append({'name': oed_name, 'source': oed_source.current_source,
                                                 'msg': f"column '{colname}' has missing values in \n"
                                                        f"{oed_source.dataframe[identifier_field+[colname]]}"})

                # check for unknown column:
                for colname in oed_source.dataframe.columns:
                    if colname_to_fieldname[colname] is None:
                        invalid_data.append({'name': oed_name, 'source': oed_source.current_source,
                                             'msg': f"column '{colname}' is not a valid oed field"})

                # check for valid values
                for colname, field_name in colname_to_fieldname.items():
                    if field_name is not None:
                        valid_ranges = all_field_info[field_name]['Valid value range']
                        if valid_ranges != 'n/a':
                            is_valid_value = functools.partial(self.oed_schema.is_valid_value, valid_ranges=valid_ranges)
                            invalid_range_data = oed_source.dataframe[~oed_source.dataframe[colname].apply(is_valid_value)]
                            if not invalid_range_data.empty:
                                invalid_data.append({'name': oed_name, 'source': oed_source.current_source,
                                                     'msg': f"column '{colname}' has values outside range.\n"
                                                            f"{invalid_range_data[identifier_field+[colname]]}"})

                # check perils
                for column in oed_source.dataframe.columns.intersection(set(OED_PERIL_COLUMNS)):
                    peril_values = oed_source.dataframe[column].str.split(';').apply(pd.Series, 1).stack()
                    invalid_perils = oed_source.dataframe.iloc[peril_values[~peril_values.isin(self.oed_schema.schema['perils']['info'])].index.droplevel(-1)]
                    if not invalid_perils.empty:
                        invalid_data.append({'name': oed_name, 'source': oed_source.current_source,
                                             'msg': f"{colname} has invalid perils.\n"
                                                    f"{invalid_perils[identifier_field + [colname]]}"})

                # check OccupancyCode
                if 'occupancycode' in fieldname_to_colnames:
                    occupancy_code_column = fieldname_to_colnames['occupancycode'][0]
                    invalid_occupancy_code = oed_source.dataframe[~oed_source.dataframe[occupancy_code_column].astype(str).isin(self.oed_schema.schema['occupancy'])]
                    if not invalid_occupancy_code.empty:
                        invalid_data.append({'name': oed_name, 'source': oed_source.current_source,
                                             'msg': f"invalid OccupancyCode.\n"
                                                    f"{invalid_occupancy_code[identifier_field + [occupancy_code_column]]}"})

                # check ConstructionCode
                if 'constructioncode' in fieldname_to_colnames:
                    construction_code_column = fieldname_to_colnames['constructioncode'][0]
                    invalid_construction_code = oed_source.dataframe[~oed_source.dataframe[construction_code_column].astype(str).isin(self.oed_schema.schema['construction'])]
                    if not invalid_construction_code.empty:
                        invalid_data.append({'name': oed_name, 'source': oed_source.current_source,
                                             'msg': f"invalid ConstructionCode.\n"
                                                    f"{invalid_construction_code[identifier_field + [construction_code_column]]}"})

                # check country and area code
                if 'countrycode' in fieldname_to_colnames:
                    countrycode = fieldname_to_colnames['countrycode'][0]
                    if 'areacode' in fieldname_to_colnames:
                        areacode = fieldname_to_colnames['areacode'][0]
                        country_only_df = oed_source.dataframe[oed_source.dataframe[areacode].isin([np.nan, ''])]
                        country_area_df = oed_source.dataframe[~oed_source.dataframe[areacode].isin([np.nan, ''])]
                        invalid_country_area = (country_area_df[
                                                        ~(country_area_df[[countrycode, areacode]]
                                                        .apply(tuple, axis=1)
                                                        .isin(self.oed_schema.schema['country_area'])
                                                          )]
                                                )
                        if not invalid_country_area.empty:
                            invalid_data.append({'name': oed_name, 'source': oed_source.current_source,
                                                 'msg': f"invalid countrycode areacode pair.\n"
                                                        f"{invalid_country_area[identifier_field + [countrycode, areacode]]}"})
                    else:
                        country_only_df = oed_source.dataframe
                    invalid_country = (country_only_df[~country_only_df[countrycode]
                                                       .isin(set(self.oed_schema.schema['country']) | {np.nan, ''})])
                    if not invalid_country.empty:
                        invalid_data.append({'name': oed_name, 'source': oed_source.current_source,
                                             'msg': f"invalid countrycode.\n"
                                                    f"{invalid_country[identifier_field + [countrycode]]}"})

        if invalid_data:
            msg = "\n".join((f"in {invalid['name']} {invalid['source']}\n {invalid['msg']}" for invalid in invalid_data))
            raise OdsException(msg)


class OedSource:
    """
    Class to represent and manage oed source (location, account, ...)
    """
    def __init__(self, exposure_data: ExposureData, oed_type, cur_version_name, sources):
        self.exposure_data = exposure_data
        self.oed_type = oed_type
        self.cur_version_name = cur_version_name
        self.sources = sources
        self.loaded = False

    @property
    def info(self):
        """
        information of source to be able to trace its different version and reload it if necessary
        Returns:
            info dict
        """
        return {'cur_version_name': self.cur_version_name, 'sources': self.sources}

    @classmethod
    def from_oed_info(cls, exposure_data: ExposureData, oed_type: str, oed_info):
        """
        Convert data in oed_info to an OedSource
        :param exposure_data: ExposureData the source is part of
        :param oed_type: type of oed file (Loc, Acc, ...)
        :param oed_info: info to create OedSource, can be:
            - str for filepath
            - dict for more complex config,
            - OedSource same object is returned
            - DataFrame no source file just oed data is path and can be saved after
        :return: OedSource (or None if  oed_info is None)
        """
        if isinstance(oed_info, (str, Path)):
            return OedSource.from_filepath(exposure_data, oed_type, filepath=oed_info)
        elif isinstance(oed_info, dict):
            return OedSource(exposure_data, oed_type, **oed_info)
        elif isinstance(oed_info, OedSource):
            return oed_info
        elif isinstance(oed_info, pd.DataFrame):
            return OedSource.from_dataframe(exposure_data, oed_type, oed_info)
        elif oed_info is None:
            return None
        else:
            raise OdsException(f'{oed_info} is not a supported format to convert to OedSource')

    @classmethod
    def from_filepath(cls, exposure_data: ExposureData, oed_type, filepath):
        """
        OedSource Constructor from a filepath
        Args:
            exposure_data: ExposureData the oed source is part of
            oed_type: type of file (Loc, Acc, ..)
            filepath: path to the oed source file

        Returns:
            OedSource
        """
        return cls(exposure_data, oed_type, 'orig', {'orig': {'source_type': 'filepath', 'filepath': filepath}})

    @classmethod
    def from_dataframe(cls, exposure_data: ExposureData, oed_type, oed_df: pd.DataFrame):
        """
        OedSource Constructor from a filepath
        Args:
            exposure_data: ExposureData the oed source is part of
            oed_type: type of file (Loc, Acc, ..)
            oed_df: DataFrame that represent the Oed Source

        Returns:
            OedSource
        """
        oed_source = cls(exposure_data, oed_type, None, {})
        ods_fields = exposure_data.get_input_fields(oed_type)
        pd_dtype = {}
        to_str = {}
        for column in oed_df.columns:
            field_name = OedSchema.colname_to_fieldname(column, ods_fields)
            if field_name:
                pd_dtype[column] = ods_fields[field_name]['pd_dtype']
            else:
                pd_dtype[column] = 'category'
            if pd_dtype[column] == 'category': # we need to convert to str first
                to_str[column] = 'str'

        oed_source.dataframe = oed_df.astype(to_str).astype(pd_dtype)
        oed_source.loaded = True
        return oed_source

    @cached_property
    def dataframe(self):
        """Dataframe view of the OedSource, loaded once"""
        self.loaded = True
        return self.load_dataframe()

    @property
    def current_source(self):
        """current version of the oed source"""
        return self.sources[self.cur_version_name]

    def load_dataframe(self, version_name=None) -> pd.DataFrame:
        """
        load the dataframe from a version of oed source
        Args:
            version_name: name of the version in sources

        Returns:
            Dataframe representing the oed source
        """
        if version_name is None:
            version_name = self.cur_version_name
        source = self.sources[version_name]
        if source['source_type'] == 'filepath':
            extension = source.get('extention') or source['filepath'].rsplit('.', 1)[-1]
            if extension == 'parquet':
                oed_df = pd.read_parquet(source['filepath'], **source.get('read_param', {}))
            else: # default we assume it is csv like
                read_params = {'keep_default_na' : False,
                               'na_values' : PANDAS_DEFAULT_NULL_VALUES.difference('NA')}
                read_params.update(source.get('read_param', {}))
                oed_df = self.read_csv(source['filepath'], self.exposure_data.get_input_fields(self.oed_type), **read_params)
        else:
            raise Exception(f"Source type {source['source_type']} is not supported")

        if self.exposure_data.reporting_currency:
            convert_currency(oed_df,
                             self.oed_type,
                             self.exposure_data.reporting_currency,
                             self.exposure_data.currency_conversion,
                             self.exposure_data.oed_schema)
        return oed_df

    def convert_currency(self):
        """
        convert currency values current of the oed source to exposure_data.reporting_currency
        """
        if self.loaded:
            convert_currency(self.dataframe,
                             self.oed_type,
                             self.exposure_data.reporting_currency,
                             self.exposure_data.currency_conversion,
                             self.exposure_data.oed_schema)

    def save(self, version_name, source):
        """
        save dataframe as version_name in source
        Args:
            version_name: name of the version
            source: str or dict with information to save the dataframe
                str : output path
                dict : {'source_type': 'filepath' # only support for the moment
                        'extension': 'parquet' or all pandas supported extension
                        'write_param' : all args you may want to pass to the pandas writer function (to_parquet, to_csv)

        """
        if isinstance(source, (str, Path)):
            source = {'source_type': 'filepath',
                      'filepath': source,
                      }
        if source['source_type'] == 'filepath':
            Path(source['filepath']).parents[0].mkdir(parents=True, exist_ok=True)
            extension = source.get('extension') or ''.join(Path(source['filepath']).suffixes)
            if extension == 'parquet':
                self.dataframe.to_parquet(source['filepath'], **source.get('write_param', {}))
            else:
                write_param = {'index': False}
                write_param.update(source.get('write_param', {}))
                self.dataframe.to_csv(source['filepath'], **write_param)
        else:
            raise Exception(f"Source type {source['source_type']} is not supported")
        self.cur_version_name = version_name
        self.sources[version_name] = source

    @staticmethod
    def read_csv(filepath_or_buffer, ods_fields, df_engine=pd, **kwargs):
        """
        the function read_csv will load a csv file as a DataFrame
        with all the columns converted to the correct dtype and having the correct default.
        it will also try to save space by converting string dtype into categories

        By default, it uses pandas to create the DataFrame. In that case you will need to have pandas installed.
        You can use other options such as Dask or modin using the parameter df_engine.

        :param filepath_or_buffer: any path or file like object accepted by your  df_engine (for pandas see pandas.read_csv)
        :param df_engine: engine that will convert csv to a dataframe object (default to pandas if installed)
        :param kwargs: extra argument that will be passed to the df_engine
        :return: df_engine dataframe

        """
        def read_or_try_encoding_read(df_engine, filepath, **read_kwargs):
            #  try to read, if fail try to detect the encoding and update the top function kwargs for future read
            try:
                return df_engine.read_csv(filepath, **kwargs)
            except UnicodeDecodeError as e:
                detected_encoding = detect_encoding(filepath_or_buffer)['encoding']
                if not read_kwargs.get('encoding') and detected_encoding:
                    kwargs['encoding'] = detected_encoding
                    read_kwargs.pop('encoding')
                    return df_engine.read_csv(filepath, encoding=detected_encoding, **read_kwargs)
                else:
                    raise

        if df_engine is None:
            raise Exception(f"df_engine parameter not specified, you must install pandas"
                            " or pass your DataFrame engine (modin, dask,...)")

        if filepath_or_buffer.endswith('.gzip') or kwargs.get('compression') == 'gzip':
            # support for gzip  https://stackoverflow.com/questions/60460814/pandas-read-csv-failing-on-gzipped-file-with-unicodedecodeerror-utf-8-codec-c
            with open(filepath_or_buffer, 'rb') as f:
                header = df_engine.read(f, compression='gzip', nrows=0, index_col=False, encoding=kwargs.get('encoding')).columns
            kwargs['compression'] = 'gzip'
        else:
            header = read_or_try_encoding_read(df_engine, filepath_or_buffer, nrows=0, index_col=False, encoding=kwargs.get('encoding')).columns

        # match header column name to oed field name and prepare pd_dtype used to read the data
        pd_dtype = {}
        colname_to_field = {}
        for col in header:
            field_name = OedSchema.colname_to_fieldname(col, ods_fields)
            if field_name:
                field_info = ods_fields[field_name]
                pd_dtype[col] = field_info['pd_dtype']
                colname_to_field[col] = field_info
            else:
                pd_dtype[col] = 'category'

        # read the oed file
        if kwargs.get('compression') == 'gzip':
            with open(filepath_or_buffer, 'rb') as f:
                df = df_engine.read_csv(f, dtype=pd_dtype, **kwargs)
        else:
            df = df_engine.read_csv(filepath_or_buffer, dtype=pd_dtype, **kwargs)

        # set default values
        for col in header:
            field_info = colname_to_field.get(col)
            if (field_info
                    and field_info['Default'] != 'n/a'
                    and (df[col].isna().any() or (field_info['pd_dtype'] == 'str' and df[col].isnull().any()))):
                df[col].fillna(df[col].dtype.type(field_info['Default']), inplace=True)

        return df
