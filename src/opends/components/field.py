"""
This file defines the class that holds the data around a data field in a file.
"""
from dataclasses import dataclass
from typing import List, Optional, Union, Tuple

from opends.enums import AllowBlank, PythonValueTypes, Required, PandasValue
import numpy as np
from opends.enums import FieldRangeType


ValidValuesType = Union[List[str], List[int]]


@dataclass
class DataField:
    name: str
    field_desc: str
    file_names: List[str]
    required: Required
    python_data_type: PythonValueTypes
    allow_blank: AllowBlank
    pandas_value: PandasValue
    valid_values: Optional[ValidValuesType]
    min_val: Optional[int]
    max_val: Optional[int]

    @staticmethod
    def from_dict(input_data: dict) -> "DataField":
        """
        Loads the DataField class from a dictionary.

        Args:
            input_data: (dict) the data to be loaded from

        Returns: (DataField) the loaded data field
        """
        return DataField(
            name=input_data["name"].split(":")[0],
            field_desc=input_data["field_desc"],
            file_names=input_data["file_names"],
            required=Required(input_data["required"]),
            python_data_type=PythonValueTypes(input_data["python_data_type"]),
            allow_blank=AllowBlank(input_data["allow_blank"].upper()),
            pandas_value=PandasValue.from_str(input_str=input_data["sql_data_type"]),
            valid_values=input_data.get("valid_values"),
            min_val=input_data.get("minval"),
            max_val=input_data.get("maxval")
        )

    def check_range(self, array: np.array) -> List[int]:
        """
        Checks to see if the data belonging to a data field is within range.

        This function is faster than the self.check_unsafe_array function because this function uses built-in numpy
        functions. Only use the self.check_unsafe_array function if you are unsure of the data types in the array.

        Args:
            array: (np.array) the data to be checked

        Returns: (List[int]) a list of indexes where the values are out of range
        """
        if self.min_val is not None and self.max_val is None:
            return list(np.where(array < float(self.min_val))[0])

        if self.max_val is not None and self.min_val is None:
            return list(np.where(array > float(self.max_val))[0])

        if self.max_val is not None and self.min_val is not None:
            outcome = list(np.where(array > float(self.max_val))[0]) + list(np.where(array < float(self.min_val))[0])
            outcome.sort()
            return outcome

        if self.valid_values is not None:
            bool_result = np.isin(np.array(array), np.array(self.valid_values))
            return list(np.where(bool_result == False)[0])

        raise ValueError(
            f"data field does not have the right attributes to perform a check range function "
            f"min_val: {self.min_val} max_val: {self.max_val} valid_values: {self.valid_values} "
            f"name: {self.name} field desc: {self.field_desc}"
        )

    def check_individual_rage(self, value: Union[str, int, float]) -> bool:
        """
        Checks the range of an individual value.

        Args:
            value: (Union[str, int, float]) value to be checked

        Returns: (bool) False if not in range, True if in range
        """
        try:
            if self.min_val is not None and self.max_val is None:
                value = float(value)
                if value >= float(self.min_val):
                    return True
                return False

            if self.max_val is not None and self.min_val is None:
                value = float(value)
                if value <= float(self.max_val):
                    return True
                return False

            if self.max_val is not None and self.min_val is not None:
                value = float(value)
                if float(self.max_val) >= value >= float(self.min_val):
                    return True
                return False

            if self.valid_values is not None:
                if str(value) in self.valid_values:
                    return True
                return False

        except ValueError:
            return False
        return False

    def check_unsafe_array(self, array: np.array) -> List[int]:
        """
        Checks to see if the data belonging to a data field is within range.

        This function is slower than the self.check_range function because this function doesn't use built-in numpy
        functions. Only use the self.check_range function if you are sure of the data types in the array.

        Args:
            array: (np.array) the data to be checked

        Returns: (List[int]) a list of indexes where the values are out of range
        """
        buffer: List[bool] = []
        for value in list(array):
            buffer.append(self.check_individual_rage(value=value))
        return list(np.where(np.array(buffer) == False)[0])

    @property
    def should_check(self) -> bool:
        if self.max_val is None and self.min_val is None and self.valid_values is None:
            return False
        return True

    @property
    def field_range_type(self) -> FieldRangeType:
        if self.should_check is False:
            return FieldRangeType.NONE
        if self.valid_values is not None:
            return FieldRangeType.CATEGORY
        return FieldRangeType.RANGE

