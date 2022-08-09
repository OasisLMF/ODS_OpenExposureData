"""
This file defines the entrypoint for extracting data standards raw-data.
"""
import json
import os
from typing import Optional

DIR_PATH = str(os.path.dirname(os.path.realpath(__file__)))


class SchemaPath(str):

    def __new__(cls, version_string: Optional[str]) -> str:
        return f"{DIR_PATH}/oed_schema_{version_string.replace('.', '_')}.json"


class SchemaMetaDataPath(str):

    def __new__(cls, version_string: Optional[str]) -> str:
        return f"{DIR_PATH}/meta_data_{version_string.replace('.', '_')}.json"
