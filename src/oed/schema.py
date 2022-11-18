import json
import os
from pathlib import Path
import pandas as pd

from .common import OdsException


class OedSchema:
    """
    Object managing information about a certain oed schema
    """
    DEFAULT_ODS_SCHEMA_FILE = 'OpenExposureData_Spec.json'
    DEFAULT_ODS_SCHEMA_PATH = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
                                           'data', DEFAULT_ODS_SCHEMA_FILE)

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
            return cls.from_json(cls.DEFAULT_ODS_SCHEMA_PATH)
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
    def column_to_field(columns: list, oed_fields: dict, use_generic_flexi=True):
        """
        Args:
            columns: name of the columns in oed file
            oed_fields: dict of all the field in ods_schema
            use_generic_flexi: if true flexi column return the oed_schema name
                                      if false flexi column are just lower cased
        Return:
            dict mapping between exact oed column name and field name in oed_schema
        """
        # support for name different from standard oed column name
        aliases = {field_info.get('alias').lower(): field_name for field_name, field_info in oed_fields.items() if field_info.get('alias')}
        result = {}
        for column in columns:
            if column.lower() in oed_fields:
                result[column] = column.lower()
            elif column.lower() in aliases:
                result[column] = aliases[column.lower()]
            else:
                for field_suffix in ['xx', 'zzz']:
                    for i in range(1, len(column)):
                        field_name = column.lower()[:-i] + field_suffix
                        if field_name in oed_fields:
                            if use_generic_flexi:
                                result[column] = field_name
                            else:
                                result[column] = column.lower()
                            break
                    else:
                        continue
                    break
                else:
                    pass # unrecognized/unknown columns are not added
        return result

    @staticmethod
    def use_field(dataframe, ods_fields: dict):
        """rename the column in the dataframe to their oed field name"""
        return dataframe.rename(columns=OedSchema.column_to_field(dataframe.columns, ods_fields, use_generic_flexi=False))

    @staticmethod
    def is_valid_value(value, valid_ranges, allow_blanks):
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
        :param valid_ranges: list of valid range
        :param allow_blanks: if True blank value (ie pd.nan) will be considered valid
        :return: True if value is in one of the range
        """

        if pd.isna(value):
            return allow_blanks
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
