from pathlib import Path

import pandas as pd
from chardet.universaldetector import UniversalDetector

from .common import OED_TYPE_TO_NAME, OdsException, PANDAS_COMPRESSION_MAP, PANDAS_DEFAULT_NULL_VALUES, is_relative
from .forex import convert_currency
from .schema import OedSchema

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


class OedSource:
    """
    Class to represent and manage oed source (location, account, ...)
    """

    def __init__(self, exposure, oed_type, cur_version_name, sources):
        """

        Args:
            exposure (OedExposure): exposure the OED source is part of
            oed_type (str): OED type of the source
            cur_version_name (str): name of the current version
            sources (dict): all the version/source of the OED source
        """
        self.exposure = exposure
        self.oed_type = oed_type
        self.oed_name = OED_TYPE_TO_NAME[oed_type]
        self.cur_version_name = cur_version_name
        self.sources = sources
        self.loaded = False

    def __str__(self):
        """
        Returns:
            string of the current version source
        """
        return str(self.sources[self.cur_version_name])

    @property
    def info(self):
        """
        information of source to be able to trace its different version and reload it if necessary
        Returns:
            info dict
        """
        return {'cur_version_name': self.cur_version_name, 'sources': self.sources}

    @classmethod
    def from_oed_info(cls, exposure, oed_type: str, oed_info):
        """
        Convert data in oed_info to an OedSource

        Args:
            exposure (OedExposure): Exposure the source is part of
            oed_type (str): type of oed file (Loc, Acc, ...)
            oed_info: info to create OedSource, can be:
                - str for filepath
                - dict for more complex config,
                - OedSource same object is returned
                - DataFrame no source file just oed data is path and can be saved after

        Returns:
            OedSource (or None if  oed_info is None)
        """
        if isinstance(oed_info, (str, Path)):
            return OedSource.from_filepath(exposure, oed_type, filepath=oed_info)
        elif isinstance(oed_info, dict):
            return OedSource(exposure, oed_type, **oed_info)
        elif isinstance(oed_info, OedSource):
            return oed_info
        elif isinstance(oed_info, pd.DataFrame):
            return OedSource.from_dataframe(exposure, oed_type, oed_info)
        elif oed_info is None:
            return None
        else:
            raise OdsException(f'{oed_info} is not a supported format to convert to OedSource')

    @classmethod
    def from_filepath(cls, exposure, oed_type, filepath):
        """
        OedSource Constructor from a filepath
        Args:
            exposure (OedExposure): Exposure the oed source is part of
            oed_type (str): type of file (Loc, Acc, ..)
            filepath (str): path to the oed source file

        Returns:
            OedSource
        """
        return cls(exposure, oed_type, 'orig', {'orig': {'source_type': 'filepath', 'filepath': filepath}})

    @classmethod
    def from_dataframe(cls, exposure, oed_type, oed_df: pd.DataFrame):
        """
        OedSource Constructor from a filepath
        Args:
            exposure (OedExposure): Exposure the oed source is part of
            oed_type (str): type of file (Loc, Acc, ..)
            oed_df (pd.DataFrame): DataFrame that represent the Oed Source

        Returns:
            OedSource
        """
        oed_source = cls(exposure, oed_type, 'orig', {'orig': {'source_type': 'DataFrame'}})
        ods_fields = exposure.get_input_fields(oed_type)
        pd_dtype = {}
        to_tmp_dtype = {}
        column_to_field = OedSchema.column_to_field(oed_df.columns, ods_fields)
        for column in oed_df.columns:
            if column in column_to_field:
                pd_dtype[column] = column_to_field[column]['pd_dtype']
            else:
                pd_dtype[column] = 'category'
            if pd_dtype[column] == 'category':  # we need to convert to str first
                to_tmp_dtype[column] = 'str'
            elif pd_dtype[column].startswith('Int'):
                to_tmp_dtype[column] = 'float'

        oed_df = oed_df.astype(to_tmp_dtype).astype(pd_dtype)
        if exposure.use_field:
            oed_df = OedSchema.use_field(oed_df, ods_fields)
        oed_source.dataframe = oed_df
        oed_source.loaded = True
        return oed_source

    @cached_property
    def dataframe(self):
        """Dataframe view of the OedSource, loaded once"""
        self.loaded = True
        df = self.load_dataframe()
        if self.exposure.use_field:
            df = OedSchema.use_field(df, self.exposure.get_input_fields(self.oed_type))
        return df

    @property
    def current_source(self):
        """
        current version of the oed source
        Returns:
            source dict of the current version
        """
        return self.sources[self.cur_version_name]

    def get_input_fields(self):
        """
        Returns:
            OED schema input field definition
        """
        return self.exposure.get_input_fields(self.oed_type)

    def get_column_to_field(self):
        """
        Returns:
            mapping between column in dataframe and field definition
        """
        return OedSchema.column_to_field(
            self.dataframe.columns,
            self.get_input_fields()
        )

    def load_dataframe(self, version_name=None):
        """
        load the dataframe from a version of oed source

        Args:
            version_name (str): name of the version in sources

        Returns:
            Dataframe representing the oed source (pd.DataFrame)
        """
        if version_name is None:
            version_name = self.cur_version_name
        source = self.sources[version_name]
        if source['source_type'] == 'filepath':
            filepath = source['filepath']
            if is_relative(filepath):
                filepath = Path(self.exposure.working_dir, filepath)
            extension = PANDAS_COMPRESSION_MAP.get(source.get('extention')) or Path(filepath).suffix
            if extension == '.parquet':
                oed_df = pd.read_parquet(filepath, **source.get('read_param', {}))
            else:  # default we assume it is csv like
                read_params = {'keep_default_na': False,
                               'na_values': PANDAS_DEFAULT_NULL_VALUES.difference('NA')}
                read_params.update(source.get('read_param', {}))
                oed_df = self.read_csv(filepath, self.exposure.get_input_fields(self.oed_type), **read_params)
        else:
            raise Exception(f"Source type {source['source_type']} is not supported")

        if self.exposure.reporting_currency:
            convert_currency(oed_df,
                             self.oed_type,
                             self.exposure.reporting_currency,
                             self.exposure.currency_conversion,
                             self.exposure.oed_schema)
        return oed_df

    def convert_currency(self):
        """
        convert currency values current of the oed source to exposure.reporting_currency
        """
        if self.loaded:
            convert_currency(self.dataframe,
                             self.oed_type,
                             self.exposure.reporting_currency,
                             self.exposure.currency_conversion,
                             self.exposure.oed_schema)

    def save(self, version_name, source):
        """
        save dataframe as version_name in source
        Args:
            version_name (str): name of the version
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
            filepath = source['filepath']
            if is_relative(filepath):
                filepath = Path(self.exposure.working_dir, filepath)
            Path(filepath).parents[0].mkdir(parents=True, exist_ok=True)
            extension = source.get('extension') or ''.join(Path(filepath).suffixes)
            if extension == 'parquet':
                self.dataframe.to_parquet(filepath, **source.get('write_param', {}))
            else:
                write_param = {'index': False}
                write_param.update(source.get('write_param', {}))
                self.dataframe.to_csv(filepath, **write_param)
        else:
            raise Exception(f"Source type {source['source_type']} is not supported")
        self.cur_version_name = version_name
        self.sources[version_name] = source

    @staticmethod
    def read_csv(filepath, ods_fields, df_engine=pd, **kwargs):
        """
        the function read_csv will load a csv file as a DataFrame
        with all the columns converted to the correct dtype and having the correct default.
        it will also try to save space by converting string dtype into categories

        By default, it uses pandas to create the DataFrame. In that case you will need to have pandas installed.
        You can use other options such as Dask or modin using the parameter df_engine.

        Args:
            filepath (str): path to the csv file
            df_engine: engine that will convert csv to a dataframe object (default to pandas if installed)
            kwargs: extra argument that will be passed to the df_engine
        Returns:
            df_engine dataframe of the file with correct dtype and default

        Raises:


        """

        def read_or_try_encoding_read(df_engine, filepath, **read_kwargs):
            #  try to read, if fail try to detect the encoding and update the top function kwargs for future read
            try:
                return df_engine.read_csv(filepath, **kwargs)
            except UnicodeDecodeError as e:
                detected_encoding = detect_encoding(filepath)['encoding']
                if not read_kwargs.get('encoding') and detected_encoding:
                    kwargs['encoding'] = detected_encoding
                    read_kwargs.pop('encoding')
                    return df_engine.read_csv(filepath, encoding=detected_encoding, **read_kwargs)
                else:
                    raise

        if df_engine is None:
            raise Exception("df_engine parameter not specified, you must install pandas"
                            " or pass your DataFrame engine (modin, dask,...)")

        if Path(filepath).suffix == '.gzip' or kwargs.get('compression') == 'gzip':
            # support for gzip  https://stackoverflow.com/questions/60460814/pandas-read-csv-failing-on-gzipped-file-with-unicodedecodeerror-utf-8-codec-c
            with open(filepath, 'rb') as f:
                header = df_engine.read(f, compression='gzip', nrows=0, index_col=False,
                                        encoding=kwargs.get('encoding')).columns
            kwargs['compression'] = 'gzip'
        else:
            header = read_or_try_encoding_read(df_engine, filepath, nrows=0, index_col=False,
                                               encoding=kwargs.get('encoding')).columns

        # match header column name to oed field name and prepare pd_dtype used to read the data
        pd_dtype = {}
        column_to_fieldinfo = {}
        column_to_field = OedSchema.column_to_field(header, ods_fields)
        for col in header:
            if col in column_to_field:
                field_info = column_to_field[col]
                pd_dtype[col] = field_info['pd_dtype']
                column_to_fieldinfo[col] = field_info
            else:
                pd_dtype[col] = 'category'

        # read the oed file
        if kwargs.get('compression') == 'gzip':
            with open(filepath, 'rb') as f:
                df = df_engine.read_csv(f, dtype=pd_dtype, **kwargs)
        else:
            df = df_engine.read_csv(filepath, dtype=pd_dtype, **kwargs)

        # set default values
        for col in header:
            field_info = column_to_fieldinfo.get(col)
            if (field_info
                    and field_info['Default'] != 'n/a'
                    and (df[col].isna().any() or (field_info['pd_dtype'] == 'category' and df[col].isnull().any()))):
                if field_info['pd_dtype'] == 'category':
                    df[col] = df[col].cat.add_categories(field_info['Default']).fillna(field_info['Default'])
                else:
                    df[col].fillna(df[col].dtype.type(field_info['Default']), inplace=True)

        return df
