"""
suite of tools to read and write ODS file in csv of parquet
"""
__all__ = [
    'pd_converter',
    'usual_file_name',
    'get_ods_fields',
    'currency_file',
    'get_currency_col',
    'DictBasedCurrencyRates',
    'convert_currency',
    'read_csv',
    'read_parquet',
    'csv_to_parquet',
    'parquet_to_csv',
    'main',
]

import os

try:
    import pandas as pd
except ImportError:
    pd = None

import argparse

import logging
logger = logging.getLogger(__name__)

pd_converter = {
    "0 or 1": "Int8",
    "bigint": "float64",
    "binary": "Int8",
    "bit": "Int8",
    "char": "category",
    "date": "category",
    "datetime": "category",
    "decimal": "float64",
    "float": "float64",
    "int": "Int64",
    "nchar": "category",
    "nvarchar": "category",
    "real": "float64",
    "smalldatetime": "category",
    "smallint": "Int32",
    "tinyint": "Int32",
    "uniqueidentifier": "category",
    "varbinary": "bytes",
    "varchar": "category"
}

usual_file_name = {'location': 'Loc',
                  'account': 'Acc',
                  'reinsscope': 'ReinsScope',
                  'ri_scope': 'ReinsScope',
                  'reinsinfo': 'ReinsInfo',
                  'ri_info': 'ReinsInfo'}


currency_file = {'loccurrency': 'Loc',
                 'acccurrency': 'Acc',
                 'reinscurrency': 'ReinsInfo'}


ods_field_fp = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'OpenExposureData_Spec.csv')

__ods_fields = None


def get_ods_fields(df_engine=pd):
    """get info on ods field by loading ods schema into global variable __ods_fields"""
    global __ods_fields
    if __ods_fields is None:
        ods_fields_df = df_engine.read_csv(ods_field_fp,
                                skipinitialspace=True,
                                keep_default_na=False,
                                na_values=[])

        # convert Data Type to pandas DataType
        ods_fields_df['pd_dtype'] = ods_fields_df['Data Type'].str.split('(', 1, expand=True)[0].map(pd_converter)

        # check that to Data Type is missing from our converter
        if ods_fields_df['pd_dtype'].isna().any():
            raise ValueError(f"missing pd_dtype for:\n"
                             f"""{ods_fields_df.loc[ods_fields_df['pd_dtype'].isna(),
                                               ['File Name', 'Input Field Name', 'Type & Description', 'Data Type']]}""")

        # split ods_fields per File Name
        ods_fields_df.rename(columns={'File Name':'File Names'}, inplace=True)
        split_df = ods_fields_df['File Names'].str.split(';').apply(df_engine.Series, 1).stack()
        split_df.index = split_df.index.droplevel(-1)
        split_df.name = 'File Name'
        split_df = split_df.str.strip()
        ods_fields_df = ods_fields_df.join(split_df).drop(columns='File Names')

        # create a field dict for each File Name available and None
        __ods_fields = {}
        for file_name in ods_fields_df['File Name'].unique():
            file_name_df = ods_fields_df[ods_fields_df['File Name']==file_name]
            file_name_df.set_index(['Input Field Name'], inplace=True)
            __ods_fields[file_name] = file_name_df.to_dict(orient='index')
        no_file_name_df = ods_fields_df[['Input Field Name', 'pd_dtype', 'Default']].drop_duplicates()
        no_file_name_df.set_index(['Input Field Name'], inplace=True)
        __ods_fields[None] = no_file_name_df.to_dict(orient='index')

    return __ods_fields


def get_currency_col(oed_df):
    insensitive_column_map = {str(col).lower(): col for col in oed_df.columns}
    for currency_col_lower, file_type in currency_file.items():
        if currency_col_lower in insensitive_column_map:
            return insensitive_column_map[currency_col_lower]
    else:
        raise ValueError('No currency column found in oed file')


class DictBasedCurrencyRates:
    def __init__(self, roe_dict):
        self.roe_dict = roe_dict

    @classmethod
    def from_dataframe(cls, df):
        roe_dict = {}
        for row in df.to_dict(orient='records'):
            roe_dict[(row['cur_from'], row['cur_to'])] = row['roe']
        return cls(roe_dict)

    @classmethod
    def from_list(cls, currency_rates):
        return cls({(cur_from, cur_to): roe for cur_from, cur_to, roe in currency_rates})

    @classmethod
    def from_csv(cls, filepath_or_buffer, df_engine=pd, **kwargs):
        if df_engine is None:
            raise Exception(f"df_engine parameter not specified, you must install pandas"
                            " or pass your DataFrame engine (modin, dask,...)")

        return cls.from_dataframe(df_engine.read_csv(filepath_or_buffer, **kwargs))

    @classmethod
    def from_parquet(cls, filepath_or_buffer, df_engine=pd, **kwargs):
        if df_engine is None:
            raise Exception(f"df_engine parameter not specified, you must install pandas"
                            " or pass your DataFrame engine (modin, dask,...)")

        return cls.from_dataframe(df_engine.read_parquet(filepath_or_buffer, **kwargs))

    def get_rate(self, cur_from, cur_to):
        if (cur_from, cur_to) in self.roe_dict:
            return self.roe_dict[(cur_from, cur_to)]
        elif (cur_to, cur_from) in self.roe_dict:
            return 1. / self.roe_dict[(cur_to, cur_from)]
        else:
            raise ValueError(f"currency pair {(cur_from, cur_to)} is missing")


def convert_currency(oed_df, reporting_currency, currency_rate, all_ods_fields=get_ods_fields()):
    """
    Convert inplace the columns in currency unit (BuildingTIV, LocNetPremium, LocDed1Building (depending on type),
    LocMinDed1Building, ...) to the reporting_currency
    store the original currency  in origincurency, and the rate of exchange in rateofexchange

    :param oed_df: OED Dataframe (Loc, Acc, ...)
    :param reporting_currency: currency to convert to
    :param currency_rate: object to get the rate of exchange by calling get_rate(cur_from, cur_to)
    :param all_ods_fields: ods_fields dict
    :return: None
    """

    currency_col = get_currency_col(oed_df)

    if 'originalcurrency' not in oed_df.columns:
        oed_df['originalcurrency'] = oed_df[currency_col]
        oed_df['rateofexchange'] = 1.

    insensitive_column_map = {str(col).lower(): col for col in oed_df.columns}
    insensitive_ods_fields = {key.lower(): value for key, value in all_ods_fields[currency_file[currency_col.lower()]].items()}

    transaction_currencies = oed_df[currency_col].unique()

    for orig_cur in transaction_currencies:
        if orig_cur == reporting_currency:
            continue
        rate = currency_rate.get_rate(orig_cur, reporting_currency)

        orig_cur_rows = (oed_df[currency_col] == orig_cur)
        oed_df.loc[orig_cur_rows, 'rateofexchange'] *= rate
        for column_lower, column in insensitive_column_map.items():
            field_type = insensitive_ods_fields.get(column_lower, {}).get('Back End DB Field Name', '').lower()
            if (field_type in ['tax', 'grosspremium', 'netpremium', 'brokerage', 'extraexpenselimit', 'minded', 'maxded']
                    or column_lower.endswith('tiv')):
                row_filter = orig_cur_rows
            elif field_type == 'ded':
                column_type_name = column_lower.replace('ded', 'dedtype')
                row_filter = orig_cur_rows & (oed_df[insensitive_column_map[column_type_name]] == 0)
            elif field_type == 'limit':
                column_type_name = column_lower.replace('limit', 'limittype')
                row_filter = orig_cur_rows & (oed_df[insensitive_column_map[column_type_name]] == 0)
            elif field_type in ['payoutstart', 'payoutend', 'payoutlimit']:
                column_type_name = 'payouttype'
                row_filter = orig_cur_rows & (oed_df[insensitive_column_map[column_type_name]] == 0)
            elif field_type in ['triggerstart', 'triggerend']:
                column_type_name = 'triggertype'
                row_filter = orig_cur_rows & (oed_df[insensitive_column_map[column_type_name]] == 0)
            else:  # not a currency unit column we go to the next one
                continue
            oed_df.loc[row_filter, column] *= rate

    oed_df[currency_col] = reporting_currency
    oed_df[currency_col] = oed_df[currency_col].astype('category')


def read_csv(filepath_or_buffer, df_engine=pd, file_type=None, dtype=None, default=None, **kwargs):
    """
    the function read_csv will load a csv file as a DataFrame
    with all the columns converted to the correct dtype and having the correct default.
    both dtype and default can be overwritten if needed
    it will also try to save space by converting string dtype into categories

    By default, it uses pandas to create the DataFrame. In that case you will need to have pandas installed.
    You can use other options such as Dask or modin using the parameter df_engine.


    :param filepath_or_buffer: any path or file like object accepted by your  df_engine (for pandas see pandas.read_csv)
    :param df_engine: engine that will convert csv to a dataframe object (default to pandas if installed)
    :param file_type: [Loc, Acc, ReinsScope, ReinsInfo]
    :param dtype: dtype dictionary that will overwrite the default dtype mapping
    :param default: dictionary of default value to apply to overwrite the default Value mapping
    :param kwargs: extra argument that will be passed to the df_engine
    :return: df_engine dataframe

    """
    if df_engine is None:
        raise Exception(f"df_engine parameter not specified, you must install pandas"
                        " or pass your DataFrame engine (modin, dask,...)")

    all_ods_fields = get_ods_fields(df_engine)
    try:
        ods_fields = all_ods_fields[file_type]
    except KeyError as e:
        raise KeyError(f"Unknown file_type {file_type}. Must be in {list(all_ods_fields)}", e)

    if hasattr(filepath_or_buffer, 'read'):
        # no case insensitivity support for buffer
        pd_dtype = {input_field_name: info['pd_dtype'] for input_field_name, info in ods_fields.items()}
        if dtype:
            pd_dtype = {**pd_dtype, **dtype}
        df = df_engine.read_csv(filepath_or_buffer, dtype=pd_dtype, **kwargs)
    else:
        # manage case-insensitive dtype mapping
        pd_dtype = {input_field_name.lower(): info['pd_dtype'] for input_field_name, info in ods_fields.items()}
        if dtype:
            for key, value in dtype.items():
                pd_dtype[key.lower()] = value

        if filepath_or_buffer.endswith('.gzip') or kwargs.get('compression')== 'gzip':
            # support for gzip  https://stackoverflow.com/questions/60460814/pandas-read-csv-failing-on-gzipped-file-with-unicodedecodeerror-utf-8-codec-c
            with open(filepath_or_buffer, 'rb') as f:
                header = df_engine.read_csv(f, compression='gzip', nrows=0, index_col=False).columns
            kwargs['compression'] = 'gzip'
        else:
            header = df_engine.read_csv(filepath_or_buffer, nrows=0, index_col=False).columns

        # check if dtype is specified regardless of the case of the column name
        _dtype = {}
        for col in header:
            if str(col).lower() in pd_dtype:
                _dtype[col] = pd_dtype[str(col).lower()]
            else:
                _dtype[col] = 'category'

        pd_dtype = _dtype

        if kwargs.get('compression')== 'gzip':
            with open(filepath_or_buffer, 'rb') as f:
                df = df_engine.read_csv(f, dtype=pd_dtype, **kwargs)
        else:
            df = df_engine.read_csv(filepath_or_buffer, dtype=pd_dtype, **kwargs)

    for column, info in ods_fields.items():
        if column not in df.columns:
            if info.get('Required Field') == 'R':
                raise Exception(f"required column '{column}' is missing in {file_type} file")
            else:
                continue

        if df[column].isna().any() or (info['pd_dtype'] == 'str' and df[column].isnull().any()):
            if info.get("Allow blanks?") == 'NO':
                raise Exception(f"column '{column}' has missing values in {file_type} file")
            else:
                if default and column in default:
                    col_default = default[column]
                else:
                    col_default = info['Default']
                if col_default != 'n/a':
                    df[column].fillna(df[column].dtype.type(col_default), inplace=True)

    return df


def read_parquet(path, df_engine=pd, **kwargs):
    """
    Read a parquet file using df_engine

    :param path: str, path object or file-like object
    :param df_engine: engine that will convert parquet to a dataframe object (default to pandas if installed)
    :param kwargs: extra argument that will be passed to the df_engine
    :return: df_engine dataframe
    """
    if df_engine is None:
        raise Exception(f"df_engine parameter not specified, you must install pandas"
                        " or pass your DataFrame engine (modin, dask,...)")
    return df_engine.read_parquet(path, **kwargs)


def csv_to_parquet(csv_fp, parquet_fp, file_type=None, **kwargs):
    """
    Convert csv files (plain text or compressed) to parquet

    if csv_fp points to a directory instead of a file,
    it will search and convert any file that match with the global variable usual_file_name

    :param csv_fp: path to a file or a directory to read from
    :param parquet_fp: path to a file or a directory to write to
    :param file_type: type of the file to read (only if csv_fp is a file)
    :param kwargs: extra argument that will be passed to the df_engine when reading csv

    """
    if not os.path.exists(csv_fp):
        raise ValueError(f"{csv_fp} doen't exist")
    if os.path.isfile(csv_fp):
        read_csv(csv_fp, file_type=file_type, **kwargs).to_parquet(parquet_fp)
    else:
        for filename in os.listdir(csv_fp):
            fp = os.path.join(csv_fp, filename)
            if os.path.isfile(fp):
                name = filename.rsplit(".", 1)[0]
                if name.lower() in usual_file_name and '.parquet' not in filename:
                    if file_type and usual_file_name[name.lower] != file_type:
                        continue
                    logger.debug(f"converting {fp} to parquet")
                    fout_path = os.path.join(parquet_fp, name + ".parquet")
                    read_csv(fp, file_type=usual_file_name[name.lower()], **kwargs).to_parquet(fout_path)


def parquet_to_csv(parquet_fp, csv_fp, **kwargs):
    """
    Convert parquet to csv files (plain text or compressed)

    :param parquet_fp: path to a file or a directory to read from
    :param csv_fp: path to a file or a directory to write to
    :param kwargs: extra argument that will be passed to the df_engine when writing csv
    """
    if 'index' not in kwargs: # change default value for to_csv index
        kwargs['index'] = False

    if not os.path.exists(parquet_fp):
        raise ImportError(f"{parquet_fp} doen't exist")
    if os.path.isfile(parquet_fp):
        read_parquet(parquet_fp).to_csv(csv_fp, **kwargs)
    else:
        for filename in os.listdir(parquet_fp):
            fp = os.path.join(parquet_fp, filename)
            if os.path.isfile(fp):
                if filename.endswith('.parquet'):
                    name = filename.rsplit(".", 1)[0]
                    if name.lower() in usual_file_name:
                        logger.debug(f"converting {fp} to csv")
                        compression = kwargs.get('compression') or '.csv'
                        fout_path = os.path.join(csv_fp, f"{name}.{compression}")
                        read_parquet(fp).to_csv(fout_path, **kwargs)


commands = {'parquet_to_csv': parquet_to_csv,
            'csv_to_parquet': csv_to_parquet}

main_parser = argparse.ArgumentParser()

command_parser = main_parser.add_subparsers(help='command [parquet_to_csv or csv_to_parquet]', dest='command', required=True)
to_csv_parsers = command_parser.add_parser('parquet_to_csv')
to_csv_parsers.add_argument('--compression', help='compression type for csv output', default=None)
to_csv_parsers.add_argument('-p', '--parquet-fp', help='path to the parquet file or directory')
to_csv_parsers.add_argument('-c', '--csv-fp', help='path to the csv file or directory')
to_csv_parsers.add_argument('-v', '--logging-level', help='logging level (debug:10, info:20, warning:30, error:40, critical:50)',
                    default=30, type=int)


to_parquet_parser = command_parser.add_parser('csv_to_parquet')
to_parquet_parser.add_argument('-t', '--file-type', help='type of the csv file to convert [Loc, Acc, ReinsScope, ReinsInfo]', default=None)
to_parquet_parser.add_argument('-p', '--parquet-fp', help='path to the parquet file or directory')
to_parquet_parser.add_argument('-c', '--csv-fp', help='path to the csv file or directory')
to_parquet_parser.add_argument('-v', '--logging-level', help='logging level (debug:10, info:20, warning:30, error:40, critical:50)',
                    default=30, type=int)
to_parquet_parser.add_argument('--memory-map', help='use memory map to read csv file', default=False)


def main():
    """command line interface for ODS conversion between csv and parquet"""
    kwargs = vars(main_parser.parse_args())
    ch = logging.StreamHandler()
    formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
    ch.setFormatter(formatter)
    logger.addHandler(ch)
    logging_level = kwargs.pop('logging_level')
    logger.setLevel(logging_level)

    if 'file_type' in kwargs and kwargs['file_type'] in {'None', ''}:
        kwargs['file_type'] = None
    commands[kwargs.pop('command')](**kwargs)


if __name__ == "__main__":
    main()

