"""
This file defines the enums for the data standards.
"""
from enum import Enum

from opends.custom_exceptions import PandasValueException


class PythonValueTypes(Enum):
    """
    Python Value types supported by data fields in the data standards.
    """
    INT = "int"
    FLOAT = "float"
    STRING = "string"

    @property
    def native_type(self) -> type:
        if self == PythonValueTypes.INT:
            return int
        if self == PythonValueTypes.FLOAT:
            return float
        if self == PythonValueTypes.STRING:
            return str


class PandasValue(Enum):
    """
    This class is responsible for converting data from the sql_data_type to a pandas data type.
    """
    FLOAT = "float"
    INT = "int"
    TINY_INT = "tinyint"
    STRING = "char"
    DATETIME = "smalldatetime"

    @staticmethod
    def from_str(input_str: str) -> "PandasValue":
        """
        Creates a PandasValue enum from an input string. Considering that there are checks in this method it is
        preferred to the __init__ method.
        
        Args:
            input_str: (str) the data type to be converted to a Pandas data type

        Returns: (PandasValue) the constructed enum
        """
        processed_str: str = input_str.lower()
        if "char" in processed_str:
            return PandasValue(PandasValue.STRING)
        if input_str == "decimal":
            return PandasValue(PandasValue.FLOAT)
        if input_str == "date":
            return PandasValue(PandasValue.DATETIME)
        if input_str == "smallint":
            return PandasValue(PandasValue.TINY_INT)
        return PandasValue(input_str)
    
    @property
    def pandas_value(self) -> str:
        if self == PandasValue.FLOAT:
            return "float64"
        if self == PandasValue.INT:
            return "int64"
        if self == PandasValue.TINY_INT:
            return "int32"
        if self == PandasValue.STRING:
            return "category"
        if self == PandasValue.DATETIME:
            return "category"
        raise PandasValueException(f"{self.value} is not supported in the pandas value conversion")


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
    REINSSCOPE = "ReinScope"
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


class FieldRangeType(Enum):
    """
    The types of limits that can be checked in data.

    Attributes:
        CATEGORY: the data value has to be one of a number of categories
        RANGE: the data value has to be within a range of values
        NONE: no range to be checked
    """
    CATEGORY = "category"
    RANGE = "range"
    NONE = None


class PerilFieldsValidation(Enum):
    """
    The field names that have to be validated against the Perils covered.
    """
    LOC_PERILS_COVERED = "LocPerilsCovered"
    LOC_PERIL = "LocPeril"
