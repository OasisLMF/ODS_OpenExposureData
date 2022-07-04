"""
This file defines the entrypoint for extracting data standards raw-data.
"""
import json
import os
from typing import Optional

DIR_PATH = str(os.path.dirname(os.path.realpath(__file__)))


def get_oed_schema() -> dict:
    """
    Gets the raw data for the data standards for all files.

    Returns: (dict) data standards for all files
    """
    with open(DIR_PATH, 'r') as json_file:
        return json.load(json_file)


class SchemaPath(str):

    def __new__(cls, version_string: Optional[str]) -> str:
        return f"{DIR_PATH}/oed_schema_{version_string.replace('.', '_')}.json"
