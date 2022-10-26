#!/usr/bin/env python3

import click
import json
import pandas as pd
import pathlib

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

dtype_to_python = {
    'Int8': int,
    'Int32': int,
    'Int64': int,
    'bytes': lambda x: bytes(x, 'utf-8'),
    'float64': float,
    'category': str
}


@click.group()
def cli():
    pass


@cli.command('csv')
@click.option('--source-excel-path', required=True, default=None, help='Path to MS excel sheet' )
@click.option('--output-csv-path', default='OpenExposureData_Spec.csv', help='Path to write csv file' )
@click.option('--excel-sheet-name', default="OED Input Fields", help='Sheet label to extract' )
def extract_spec_to_csv(source_excel_path, output_csv_path, excel_sheet_name):
    """
    convert an Excel sheet to a csv file
    Args:
        source_excel_path: path to the Excel ods_schema
        output_csv_path: output path
        excel_sheet_name: name of the sheet to extract

    """
    df_spec = pd.read_excel(
        source_excel_path,
        sheet_name=excel_sheet_name,
        dtype={'Default': str},
        keep_default_na=False,
        na_values=[])
    df_spec.to_csv(
        path_or_buf=output_csv_path,
        encoding='utf-8',
        mode='w',
        index=False)
    print(f'Written CSV spec: "{output_csv_path}"  \noutput based on file: "{source_excel_path}", sheet: "{excel_sheet_name}"')


@cli.command('json')
@click.option('--source-excel-path', required=True, default=None, help='Path to MS excel sheet')
@click.option('--output-json-path', default='oed.json', help='Path to write json oed file')
def extract_spec_to_json(source_excel_path, output_json_path):
    """
    read an Excel ods_schema (OpenExposureData_Spec.xlsx) and write relevant information from each sheet to a json file

    Args:
        source_excel_path: path to the Excel ods_schema
        output_json_path: path to the json output
    """
    def _read_excel(excel_sheet_name):
        return pd.read_excel(source_excel_path,
                             sheet_name=excel_sheet_name,
                             dtype={'Default': str},
                             keep_default_na=False,
                             na_values=[])

    ods_schema = {}
    ods_schema['input_fields']  = get_ods_input_fields(_read_excel('OED Input Fields'))
    ods_schema['perils']        = get_ods_perils(_read_excel('Peril Values'))
    ods_schema['occupancy']     = get_occupancy(_read_excel('Occupancy Values'))
    ods_schema['construction']  = get_construction(_read_excel('Construction Values'))
    ods_schema['country']       = get_country(_read_excel('Country Values'))
    ods_schema['area']          = get_area(_read_excel('AreaCode Values'))
    ods_schema['cr_field']      = get_cr_field(_read_excel('OED CR Field Appendix'))

    pathlib.Path(output_json_path).parent.mkdir(parents=True, exist_ok=True)
    with open(output_json_path, 'w') as fp:
        json.dump(ods_schema, fp, indent='    ')


def get_ods_input_fields(ods_fields_df: pd.DataFrame):
    """
    Read OED Input Fields information, provide detailed  field information per file type as a dict

    Args:
        ods_fields_df: OED Input Fields sheet as a Dataframe

    Returns:
        {file_type['loc', 'acc', ...]: {field_name: field_info_dict}}

    """
    # convert Data Type to pandas DataType
    ods_fields_df = (
        ods_fields_df
        .assign(pd_dtype=ods_fields_df['Data Type'].str.split('(', n=1, expand=True)[0].map(pd_converter))
        .rename(columns={'File Name': 'File Names'})
    )
    ods_fields_df["Case Insensitive Field Name"] = ods_fields_df["Input Field Name"].str.lower()

    # check that to Data Type is missing from our converter
    if ods_fields_df['pd_dtype'].isna().any():
        raise ValueError(f"missing pd_dtype for:\n"
                         f"""{ods_fields_df.loc[ods_fields_df['pd_dtype'].isna(),
                                           ['File Name', 'Input Field Name', 'Type & Description', 'Data Type']]}""")

    # split ods_fields per File Name
    split_df = ods_fields_df['File Names'].str.split(';').apply(pd.Series, 1).stack()
    split_df = (
        split_df
        .set_axis(split_df.index.droplevel(-1))
        .rename('File Name')
        .str.strip()
    )
    ods_fields_df = ods_fields_df.join(split_df).drop(columns='File Names')

    ods_fields_df['Valid value range'] = ods_fields_df.apply(lambda row: extract_valid_value_range(row['Valid value range'],
                                                                                                   dtype_to_python[row['pd_dtype']]),
                                                             axis=1)

    # create a field dict for each File Name available and None
    __ods_fields = {}
    for file_name in ods_fields_df['File Name'].unique():
        __ods_fields[file_name] = (ods_fields_df[ods_fields_df['File Name']==file_name]
                                   .set_index(['Case Insensitive Field Name'])
                                   .to_dict(orient='index'))

    __ods_fields[None] = (
        ods_fields_df
        .drop(columns=['File Name'])
        .drop_duplicates(subset=['Input Field Name'])
        .to_dict(orient='index')
    )

    return __ods_fields


def get_ods_perils(perils_df: pd.DataFrame):
    """
    information on ods perils
    Args:
        perils_df: Peril Values DataFrame

    Returns:
        dict with info on perils and mapping between peril and list of sub perils
    """
    return {
        'info': (
            perils_df
            [['DB table PerilCode', 'Peril Description', 'Input format abbreviation', 'Grouped PerilCode']]
            [:perils_df[perils_df['Input format abbreviation'] == ''].index[0]]  # select rows until 1st empty cell
            .set_index(['Input format abbreviation'])
            .to_dict(orient='index')
        ),
        'covered': (  # create a dict of peril => list of sub perils
            perils_df
            [['Peril', 'PerilsCovered']]
            [:perils_df[perils_df['Peril'] == ''].index[0]]  # select rows until 1st empty cell
            .groupby('PerilsCovered')['Peril'].apply(list)
            .to_dict()
        )
    }


def get_occupancy(occupency_df: pd.DataFrame):
    """
    get information on occupancy codes
    Args:
        occupency_df: occupancy Dataframe

    Returns:
        dict of information on occupancies
    """
    return (
        occupency_df
        [['Category', 'OED Code', 'AIR code', 'Name', 'Description', 'Code Range', 'Broad Category']]
        .set_index('OED Code')
        .to_dict(orient='index')
    )


def get_construction(construction_df):
    """
    get information on construction codes
    Args:
        construction_df: construction Dataframe

    Returns:
        dict of information on construction codes
    """
    return (
        construction_df
        [['Category', 'OED Code', 'AIR code', 'Name', 'Description', 'Code Range', 'Broad Category']]
        .set_index('OED Code')
        .to_dict(orient='index')
    )


def get_country(country_df):
    """
    get information on country codes
    Args:
        country_df: country Dataframe

    Returns:
        dict of information on country codes
    """
    return (
        country_df
        .set_index('Code')
        .to_dict(orient='index')
    )


def get_area(area_df):
    """
    get information on country and area codes
    Args:
        area_df: area Dataframe

    Returns:
        dict of information on area codes
    """
    return (
        area_df
        .groupby('CountryCode')['AreaCode'].apply(list)
        .to_dict()
    )


def get_cr_field(cr_field_df):
    """
    For the moment we just store the sheet as is,
    but we will probably need to build the CR tree to then check on the presence of Data
    Args:
        cr_field_df:

    Returns:
        conditional requirement dict
    """

    return cr_field_df.to_dict(orient='records')


def extract_valid_value_range(valid_value_range, dtype):
    """
    translate a list of valid values from the string input writen in ods schema
    Args:
        valid_value_range: string input
        dtype: data type to convert the string value to

    Returns:
        list of dict diffining valid values

    note that we return a dict for single valid values because set is not directly json serialisable
    >>> extract_valid_value_range('[-999,-999], [0,5], [10,), (,-5)', int)
    [{'min': 0, 'max': 5}, {'min': 10}, {'max': -5}, {'enum': [-999]}]
    """
    def get_next_bracket(_str: str, opening):
        if opening:
            bracket = ['[', '(']
        else:
            bracket = [']', ')']

        ind = (_str.find(s) for s in bracket)
        found_ind = [i for i in ind if i >= 0]
        if found_ind:
            return min(found_ind)
        else:
            return -1

    valid_values = []
    valid_single_values = {}
    valid_value_range_left = valid_value_range.strip()
    i = 0
    while valid_value_range_left:
        o_index = get_next_bracket(valid_value_range_left, opening=True)
        c_index = get_next_bracket(valid_value_range_left, opening=False)
        if o_index == -1:
            break
        min_val, max_val = [x.strip() for x in valid_value_range_left[o_index+1: c_index].split(',')]

        if min_val == max_val:
            valid_single_values.setdefault('enum', []).append(dtype(min_val))
        elif max_val and min_val:
            valid_values.append({'min':dtype(min_val), 'max': dtype(max_val)})
        elif min_val:
            valid_values.append({'min':dtype(min_val)})
        else:
            valid_values.append({'max': dtype(max_val)})
        valid_value_range_left = valid_value_range_left[c_index + 1:]
    if valid_single_values:
        valid_values.append(valid_single_values)
    if valid_values:
        return valid_values
    else:
        return 'n/a'


if __name__ == '__main__':
    cli()

