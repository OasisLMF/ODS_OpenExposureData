"""
This file defines the class that holds the data around a data field in a file.
"""
from dataclasses import dataclass
from typing import List, Optional, Union
from itertools import zip_longest

import numpy as np

from opends.enums import AllowBlank, PythonValueTypes, Required, PandasValue
from opends.enums import FieldRangeType
from opends.components.template_meta_loader import get_template_meta_data

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
        if self.check_min_value_only is True:
            return list(np.where(array < float(self.min_val))[0])

        if self.check_max_value_only is True:
            return list(np.where(array > float(self.max_val))[0])

        if self.check_min_and_max_value is True:
            outcome = list(np.where(array > float(self.max_val))[0]) + list(np.where(array < float(self.min_val))[0])
            outcome.sort()
            return outcome

        if self.valid_values is not None:
            bool_result = np.isin(np.array(array), np.array(self.valid_values))
            return list(np.where(bool_result == False)[0])

        if self.is_peril is True:
            clean_array = self.clean_peril_array(input_array=array)
            bool_results = self.check_against_two_d_array(input_array=clean_array, categories=self.valid_perils)
            return list(np.where(bool_results == False)[0])

        raise ValueError(
            f"data field does not have the right attributes to perform a check range function "
            f"min_val: {self.min_val} max_val: {self.max_val} valid_values: {self.valid_values} "
            f"name: {self.name} field desc: {self.field_desc}"
        )

    def check_unsafe_range(self, array: np.array) -> List[int]:
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

    def check_individual_rage(self, value: Union[str, int, float]) -> bool:
        """
        Checks the range of an individual value.

        Args:
            value: (Union[str, int, float]) value to be checked

        Returns: (bool) False if not in range, True if in range
        """
        try:
            if self.check_min_value_only is True:
                value = float(value)
                if value >= float(self.min_val):
                    return True
                return False

            if self.check_max_value_only is True:
                value = float(value)
                if value <= float(self.max_val):
                    return True
                return False

            if self.check_min_and_max_value is True:
                value = float(value)
                if float(self.max_val) >= value >= float(self.min_val):
                    return True
                return False

            if self.valid_values is not None:
                if str(value) in self.valid_values:
                    return True
                return False

            if self.is_peril is True:
                cleaned_peril_buffer = list(filter(None, str(value).replace(" ", "").split(";")))
                for peril_value in cleaned_peril_buffer:
                    if peril_value not in self.valid_perils:
                        return False
                return True

        except ValueError:
            return False
        return False

    @staticmethod
    def check_against_two_d_array(input_array: np.array, categories: List) -> List[bool]:
        """
        Checks a 2D array of categories and works out if all the categories in each row of the 2D array are in the
        categories.

        Args:
            input_array: (np.array) the 2D array that is going to be checked.
            categories: (List) the list of categories that

        Returns: (List[bool]) result for each row that is checked. False if the row fails the check, True if the row
                              passes the check
        """
        padded_array = np.array(list(zip_longest(*input_array, fillvalue=categories[0]))).T
        two_d_bool_result = np.isin(padded_array, categories)
        flat_result = two_d_bool_result[:, 0]

        for i in range(1, len(two_d_bool_result[0])):
            flat_result = flat_result * two_d_bool_result[:, i]
        return flat_result

    @staticmethod
    def clean_peril_array(input_array: np.array) -> List[List[str]]:
        """
        Takes a range of peril strings in an array and cleans them into structured data.

        Args:
            input_array: (np.array) the data to be cleaned

        Returns: (List[List[str]]) clean peril data that can be used
        """
        buffer = []
        for i in input_array:
            buffer.append(list(filter(None, str(i).replace(" ", "").split(";"))))
        return buffer

    @property
    def check_min_value_only(self) -> bool:
        if self.min_val is not None and self.max_val is None:
            return True
        return False

    @property
    def check_max_value_only(self) -> bool:
        if self.max_val is not None and self.min_val is None:
            return True
        return False

    @property
    def check_min_and_max_value(self) -> bool:
        if self.max_val is not None and self.min_val is not None:
            return True
        return False

    @property
    def should_check(self) -> bool:
        if self.max_val is None and self.min_val is None and self.valid_values is None and self.is_peril is False:
            return False
        return True

    @property
    def field_range_type(self) -> FieldRangeType:
        if self.should_check is False:
            return FieldRangeType.NONE
        if self.valid_values is not None:
            return FieldRangeType.CATEGORY
        return FieldRangeType.RANGE

    @property
    def is_peril(self) -> bool:
        if "peril" in self.name.lower():
            return True
        return False

    @property
    def valid_perils(self) -> List[str]:
        meta_data = get_template_meta_data(name=f"valid perils for '{self.name}' DataField")
        return meta_data.supported_perils
