import json
import pandas as pd
import numpy as np
import argparse
import os
from typing import List


### Notes
# 1) AreaCode should be validated against Country Code
# 2) Peril Codes to be implemented
# 3) Financial Codes/Types to implemented
# 4) Conditional Requirements not implemented
###

DIR_PATH = str(os.path.dirname(os.path.realpath(__file__)))

def getFileNameList(file_name):
    file_name = str.replace(file_name, " ", "")
    file_name_list = list(file_name.split(";"))
    return file_name_list


def getPythonDataType(data_type):
    if "char" in data_type:
        python_data_type = "string"
    elif "int" in data_type or "0 or 1" in data_type:
        python_data_type = "int"
    elif "date" in data_type:
        python_data_type = "string"
    elif "float" in data_type:
        python_data_type = "float"
    elif "decimal" in data_type:
        python_data_type = "float"
    else:
        raise ValueError(f"here is the value type: '{data_type}'")

    return (python_data_type)


def getValidValues(specification_file):
    # initiate dict
    dict_valid_values = {}

    # fileds with single tab definitions
    single_tab_fields = {
        'OccupancyCode': {'tab': 'Occupancy Values', 'column': 'OED Code'},
        'ConstructionCode': {'tab': 'Construction Values', 'column': 'OED Code'},
        'LocCurrency': {'tab': 'Currency Values', 'column': 'Code'},
        'CountryCode': {'tab': 'Country Values', 'column': 'Code'},
        'AreaCode': {'tab': 'AreaCode Values', 'column': 'AreaCode'}
    }

    for field in single_tab_fields:
        df_fieldvalues = pd.read_excel(specification_file, sheet_name=single_tab_fields[field]['tab'])
        lst_fieldvalues = []
        for i, row in df_fieldvalues.iterrows():
            lst_fieldvalues.append(row[single_tab_fields[field]['column']])
        dict_valid_values[field] = lst_fieldvalues

    # other values tab
    df_otherfieldvalues = pd.read_excel(specification_file, sheet_name='Other Values')

    for i, row in df_otherfieldvalues.iterrows():
        field = row['Category']
        code = row['Code']
        if field not in dict_valid_values.keys():
            lst_fieldvalues = [code]
            dict_valid_values[field] = lst_fieldvalues
        else:
            lst_fieldvalues.append(code)
            dict_valid_values[field] = lst_fieldvalues

    return dict_valid_values


def get_supported_perils(file_path: str) -> List[str]:
    """
    Gets the supported perils from the excel schema file.

    Args:
        file_path: (str) the path pointing to the excel schema file

    Returns: (List[str]) the list of supported perils
    """
    df_perils = pd.read_excel(file_path, sheet_name='Peril Values', engine='openpyxl')
    raw_column = df_perils["Input format abbreviation"].drop_duplicates().to_numpy()
    end_index = np.argwhere(raw_column != raw_column)[0][0]
    return list(raw_column[:end_index])


def get_occupancy_codes(file_path: str) -> List[str]:
    """
    Gets the OED codes from the excel schema file.

    Args:
        file_path: (str) the path pointing to the excel schema file

    Returns: (List[str]) the list of supported OED codes
    """
    df_occupancy_codes = pd.read_excel(file_path, sheet_name='OED Input Fields', engine='openpyxl')
    return df_occupancy_codes["OED Code"].drop_duplicates().to_numpy()


def main() -> None:
    args_parser = argparse.ArgumentParser()
    args_parser.add_argument('--version', action='store', type=str, required=True,
                             help="the name of the file being converted to")
    args = args_parser.parse_args()
    file_version = args.version.replace(".", "_")
    # get oed field list
    specification_file = f'{DIR_PATH}/schema_versions/exposure_data{file_version}.xlsx'
    df_fields = pd.read_excel(specification_file, sheet_name='OED Input Fields', engine='openpyxl')

    # get valid values
    dict_valid_values = getValidValues(specification_file)

    # initiate dict of fields
    dict = {}

    # declare the meta-data
    meta_data = {
        "supported perils": get_supported_perils(file_path=specification_file),
        "supported OED codes": get_occupancy_codes(file_path=specification_file)
    }

    # iterate through filed list
    for i, field in df_fields.iterrows():
        field_name = field['Input Field Name']
        file_name = field['File Name']
        field_desc = field['Type & Description']
        required = field['Required Field']
        data_type = field['Data Type']
        allow_blank = field['Allow blanks?']
        default = field['Default']
        valid_value_range = str(field['Valid value range'])
        sec_mod = field['SecMod?']

        file_name_list = getFileNameList(file_name)
        python_data_type = getPythonDataType(data_type)

        key_str = field_name + ":" + str(file_name_list)

        dict[key_str] = {
            'field_desc': field_desc,
            'file_names': file_name_list,
            'required': required,
            'sql_data_type': data_type,
            'python_data_type': python_data_type,
            'allow_blank': allow_blank,
            'default': default,
            'valid_value_range': valid_value_range,
            'sec_mod': sec_mod,
            'name': field_name
        }

        if valid_value_range == 'nan':
            pass
        elif valid_value_range == '[-999,-999], [0,1]':
            dict[key_str]['minval'] = 0.0
            dict[key_str]['maxval'] = 1.0
            dict[key_str]['otherval'] = -999.0

        elif valid_value_range[:1] == '[' and valid_value_range[-1:] == ']':
            lst = valid_value_range.replace('[', '').replace(']', '').replace(')', '').split(',')
            dict[key_str]['minval'] = lst[0]
            dict[key_str]['maxval'] = lst[1]

        elif valid_value_range[:1] == '[' and valid_value_range[-1:] == ')':
            lst = valid_value_range.replace('[', '').replace(']', '').replace(')', '').split(',')
            dict[key_str]['minval'] = lst[0]

        if field_name in dict_valid_values.keys():
            valid_values = dict_valid_values[field_name]
            dict[key_str]['valid_values'] = valid_values

    with open(f'{DIR_PATH}/src/opends/version_control/oed_schema_{file_version}.json', 'w') as jsonout:
        json.dump(dict, jsonout)
    with open(f'{DIR_PATH}/src/opends/version_control/meta_data_{file_version}.json', 'w') as jsonout:
        json.dump(meta_data, jsonout)


if __name__ == "__main__":
    main()
