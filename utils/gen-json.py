#!/usr/bin/env python3

import json
import pandas as pd
import pathlib
import os
import click

# convertion map between OED, numpy_nullable, pyarrow, python
_converter_header = ["OED Data Type", "numpy_nullable", "pyarrow", "python"]
_converter_list = [
    ["0 or 1", "Int8", "int8[pyarrow]", int],
    ["bigint", "Int64", "int64[pyarrow]", int],
    ["binary", "Int8", "int8[pyarrow]", int],
    ["bit",  "Int8", "int8[pyarrow]", int],
    ["char",  "category", "string[pyarrow]", str],
    ["date",  "category", "string[pyarrow]", str],
    ["datetime",  "category", "string[pyarrow]", str],
    ["decimal",  "float64", "float64[pyarrow]", float],
    ["float",  "float64", "float64[pyarrow]", float],
    ["int",  "Int64", "int64[pyarrow]", int],
    ["nchar",  "category", "string[pyarrow]", str],
    ["nvarchar",  "category", "string[pyarrow]", str],
    ["real",  "float64", "float64[pyarrow]", float],
    ["smalldatetime",  "category", "string[pyarrow]", str],
    ["smallint",  "Int32", "int32[pyarrow]", int],
    ["tinyint",  "Int32", "int32[pyarrow]", int],
    ["uniqueidentifier",  "category", "string[pyarrow]", str],
    ["varbinary",  "bytes", "string[pyarrow]", lambda x: bytes(x, "utf-8")],
    ["varchar",  "category", "string[pyarrow]", str],
]
converter_df = pd.DataFrame(_converter_list, columns=_converter_header)
pd_converter = converter_df[["OED Data Type", "numpy_nullable"]].set_index("OED Data Type")["numpy_nullable"].to_dict()
pa_converter = converter_df[["OED Data Type", "pyarrow"]].set_index("OED Data Type")["pyarrow"].to_dict()
dtype_to_python = converter_df[["OED Data Type", "python"]].set_index("OED Data Type")["python"].to_dict()

# Directory containing the CSV files
source_csv_default = pathlib.Path(os.path.dirname(os.path.realpath(__file__))).parent.joinpath('OpenExposureData')


@click.command()
@click.option( "--source-csv-dir", required=True, default=source_csv_default, help="Path to dir with OED csv files")
@click.option( "--output-path", default="oed.json", help="Path to write json oed file")
def oed_spec_to_json(output_path, source_csv_dir):
    """
    read an Excel ods_schema (OpenExposureData_Spec.xlsx) and write relevant information from each sheet to a json file

    Args:
        source_csv_dir (str): path to ''
        output_path (str): path to the json output
    """

    def _read_oed_data(sheet_name, basepath=source_csv_dir):
        return pd.read_csv(
            os.path.join(basepath, f"{sheet_name}.csv"),
            dtype={"Default": str},
            keep_default_na=False,
            na_values=[],
        )


    ods_schema = {}
    ods_schema["input_fields"] = get_ods_input_fields(_read_oed_data("OEDInputFields"))
    ods_schema["perils"] = get_ods_perils(_read_oed_data("PerilValues"), _read_oed_data("PerilsCovered"))
    ods_schema["occupancy"] = get_occupancy(_read_oed_data("OccupancyValues"))
    ods_schema["construction"] = get_construction(_read_oed_data("ConstructionValues"))
    ods_schema["country"] = get_country(_read_oed_data("CountryValues"))
    ods_schema["area"] = get_area(_read_oed_data("AreaCodeValues"))
    ods_schema["cr_field"] = get_cr_field(_read_oed_data("OEDCRFieldAppendix"))
    try:
        ods_schema["versioning"] = get_versioning(_read_oed_data("Versioning"))
    except ValueError:
        ods_schema["versioning"] = {}
    try:
        ods_schema["CoverageValues"] = get_coverage_values(_read_oed_data("CoverageValues"))
    except ValueError:
        print("no CoverageValues file found for this OED version")

    pathlib.Path(output_path).parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w") as fp:
        json.dump(ods_schema, fp, indent="    ")

    print(f"JSON OED specification has been created from dir '{source_csv_dir}'. Output saved to '{output_path}'")


def get_ods_input_fields(ods_fields_df):
    """
    Read OED Input Fields information, provide detailed  field information per file type as a dict

    Args:
        ods_fields_df (pd.DataFrame): OED Input Fields

    Returns:
        {file_type['loc', 'acc', ...]: {field_name: field_info_dict}}

    """
    # convert Data Type to pandas DataType
    ods_fields_df = ods_fields_df.assign(
        pd_dtype=ods_fields_df["Data Type"]
        .str.split("(", n=1, expand=True)[0]
        .map(pd_converter),
        pa_dtype=ods_fields_df["Data Type"]
        .str.split("(", n=1, expand=True)[0]
        .map(pa_converter)
    ).rename(columns={"File Name": "File Names"})
    ods_fields_df["Case Insensitive Field Name"] = ods_fields_df[
        "Input Field Name"
    ].str.lower()

    # check that to Data Type is missing from our converter
    if ods_fields_df["pd_dtype"].isna().any() or ods_fields_df["pa_dtype"].isna().any():
        raise ValueError(
            f"missing dtype for:\n"
            f"""{ods_fields_df.loc[(ods_fields_df['pd_dtype'].isna()) | (ods_fields_df["pa_dtype"].isna()),
                                           ['File Name', 'Input Field Name', 'Type & Description', 'Data Type']]}"""
        )
    # split ods_fields per File Name
    split_df = ods_fields_df["File Names"].str.split(";").apply(pd.Series).stack()
    split_df = (
        split_df.set_axis(split_df.index.droplevel(-1)).rename("File Name").str.strip()
    )
    ods_fields_df = ods_fields_df.join(split_df).drop(columns="File Names")

    ods_fields_df["Valid value range"] = ods_fields_df.apply(
        lambda row: extract_valid_value_range(
            row["Valid value range"], dtype_to_python[row["Data Type"].split("(", 1)[0]]
        ),
        axis=1,
    )

    # create a field dict for each File Name available and None
    __ods_fields = {}
    for file_name in ods_fields_df["File Name"].unique():
        __ods_fields[file_name] = (
            ods_fields_df[ods_fields_df["File Name"] == file_name]
            .set_index(["Case Insensitive Field Name"])
            .to_dict(orient="index")
        )

    __ods_fields[None] = (
        ods_fields_df.drop(columns=["File Name"])
        .drop_duplicates(subset=["Input Field Name"])
        .set_index(["Case Insensitive Field Name"])
        .to_dict(orient="index")
    )

    return __ods_fields


def get_ods_perils(perils_df, perils_cov_df):
    """
    information on ods perils
    Args:
        perils_df (pd.DataFrame): Peril Values

    Returns:
        dict with info on perils and mapping between peril and list of sub perils
    """


    return {
        "info": (
            perils_df[
                [
                    "DB table PerilCode",
                    "Peril Description",
                    "Input format abbreviation",
                    "Grouped PerilCode",
                ]
            ].set_index(["Input format abbreviation"]).to_dict(orient="index")
        ),
        "covered": (  # create a dict of peril => list of sub perils
            perils_cov_df[["Peril", "PerilsCovered"]]
            .replace("", float("NaN"))
            .dropna()
            .groupby("PerilsCovered")["Peril"]
            .apply(list)
            .to_dict()
        ),
    }


def get_occupancy(occupancy_df):
    """
    get information on occupancy codes
    Args:
        occupancy_df (pd.DataFrame): occupancy

    Returns:
        dict of information on occupancies
    """
    return (
        occupancy_df[
            [
                "Category",
                "OED Code",
                "CEDE code",
                "Name",
                "Description",
                "Code Range",
                "Broad Category",
            ]
        ]
        .set_index("OED Code")
        .to_dict(orient="index")
    )


def get_construction(construction_df):
    """
    get information on construction codes
    Args:
        construction_df (pd.DataFrame): construction

    Returns:
        dict of information on construction codes
    """
    return (
        construction_df[
            [
                "Category",
                "OED Code",
                "CEDE code",
                "Name",
                "Description",
                "Code Range",
                "Broad Category",
            ]
        ]
        .set_index("OED Code")
        .to_dict(orient="index")
    )


def get_country(country_df):
    """
    get information on country codes
    Args:
        country_df (pd.DataFrame): country

    Returns:
        dict of information on country codes
    """
    return country_df.set_index("Code").to_dict(orient="index")


def get_area(area_df):
    """
    get information on country and area codes
    Args:
        area_df (pd.DataFrame): area

    Returns:
        dict of information on area codes
    """
    return area_df.groupby("CountryCode")["AreaCode"].apply(list).to_dict()


def get_cr_field(cr_field_df):
    """
    For the moment we just store the sheet as is,
    but we will probably need to build the Conditional Requirement (CR) tree to then check on the presence of Data
    Args:
        cr_field_df (pd.DataFrame): Conditional Requirement

    Returns:
        conditional requirement dict
    """
    cr_field_df = cr_field_df.assign(
        pd_dtype=cr_field_df["Data Type"]
        .str.split("(", n=1, expand=True)[0]
        .map(pd_converter),
        pa_dtype=cr_field_df["Data Type"]
        .str.split("(", n=1, expand=True)[0]
        .map(pa_converter)
    ).rename(columns={"File Name": "File Names"})

    # split ods_fields per File Name
    split_df = cr_field_df["File Names"].str.split(";").apply(pd.Series).stack()
    split_df = (
        split_df.set_axis(split_df.index.droplevel(-1)).rename("File Name").str.strip()
    )
    cr_field_df = cr_field_df.join(split_df).drop(columns="File Names")

    cr_fields_by_file = {}
    for file_name in cr_field_df["File Name"].unique():
        cr_to_field = (
            cr_field_df[cr_field_df["File Name"] == file_name]
            .groupby("Required Field")["Input Field Name"]
            .apply(list)
            .to_dict()
        )
        cr_field = {}
        for cr, fields in cr_to_field.items():
            if "-" not in cr:
                continue
            for field in fields:
                cur_cr_field = set(fields)
                for i in range(cr.count("-") + 1):
                    cur_cr_field |= set(cr_to_field.get(cr.rsplit("-", i)[0], []))
                if (
                    len(cur_cr_field) > 1
                ):  # we remove field that provide no extra requirement
                    cr_field[field] = list(cur_cr_field)
        cr_fields_by_file[file_name] = cr_field

    return cr_fields_by_file


def get_versioning(version_values_df):
    """
    Gets information on versioning. The sheet should be structured as follow:
    Version: the version to which the change will lead
    Category: the category to which the change applies (e.g. "Occupancy")
    New code: the code that should be reverted
    Fallback: the code to which we should revert

    Args:
        version_values_df (pd.DataFrame): Versioning

    Returns:
        dict of information on versioning
    """
    # Group by the version
    grouped = version_values_df.groupby("Version")
    version_dict = {
        version: group[["Category", "New code", "Fallback"]].to_dict(orient="records")
        for version, group in grouped
    }
    return version_dict

def get_coverage_values(coverage_value_df):
    """
    get information on coverages
    Args:
        coverage_value_df (pd.DataFrame): coverages

    Returns:
        dict of information on coverages
    """
    return coverage_value_df.set_index("CoverageCode").to_dict(orient="index")

def extract_valid_value_range(valid_value_range, dtype):
    """
    translate a list of valid values from the string input writen in ods schema

    Args:
        valid_value_range (str): string input
        dtype (dtype): data type to convert the string value to

    Returns:
        list of dict diffining valid values

    note that we return a dict for single valid values because set is not directly json serialisable
    >>> extract_valid_value_range('[-999,-999], [0,5], [10,), (,-5)', int)
    [{'min': 0, 'max': 5}, {'min': 10}, {'max': -5}, {'enum': [-999]}]
    """

    def get_next_bracket(_str: str, opening):
        if opening:
            bracket = ["[", "("]
        else:
            bracket = ["]", ")"]

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
        min_val, max_val = [
            x.strip() for x in valid_value_range_left[o_index + 1 : c_index].split(",")
        ]

        if min_val == max_val:
            valid_single_values.setdefault("enum", []).append(dtype(min_val))
        elif max_val and min_val:
            valid_values.append({"min": dtype(min_val), "max": dtype(max_val)})
        elif min_val:
            valid_values.append({"min": dtype(min_val)})
        else:
            valid_values.append({"max": dtype(max_val)})
        valid_value_range_left = valid_value_range_left[c_index + 1 :]
    if valid_single_values:
        valid_values.append(valid_single_values)
    if valid_values:
        return valid_values
    else:
        return "n/a"


if __name__ == "__main__":
    oed_spec_to_json()
