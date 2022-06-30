"""
This file defines the enums for the data standards.
"""
from enum import Enum


class PythonValueTypes(Enum):
    """
    Python Value types supported by data fields in the data standards.
    """
    INT = "int"
    FLOAT = "float"
    STRING = "string"


class AllowBlank(Enum):
    """
    If the data field is allowed to be blank or not.
    """
    YES = "YES"
    NO = "NO"


class FileNames(Enum):
    """
    The filenames in the open data standards raw data.
    """
    REINSSCOPE = "ReinsScope"
    ACC = "Acc"
    LOC = "Loc"
    REINSINFO = "ReinsInfo"


class Required(Enum):
    """
    The required variations in the open standards raw data.

    Attributes:
         O: not required
         CR: required based on circumstances
         R: required
    """
    O = "O"
    CR = "CR"
    R = "R"
