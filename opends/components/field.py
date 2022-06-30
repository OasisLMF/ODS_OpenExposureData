"""
This file defines the class that holds the data around a data field in a file.
"""
from dataclasses import dataclass
from typing import List

from opends.enums import AllowBlank, PythonValueTypes, Required


@dataclass
class DataField:
    name: str
    field_desc: str
    file_names: List[str]
    required: Required
    python_data_type: PythonValueTypes
    allow_blank: AllowBlank

    @staticmethod
    def from_dict(input_data: dict) -> "DataField":
        """
        Loads the DataField class from a dictionary.

        Args:
            input_data: (dict) the data to be loaded from

        Returns: (DataField) the loaded data field
        """
        return DataField(
            name=input_data["name"],
            field_desc=input_data["field_desc"],
            file_names=input_data["file_names"],
            required=Required(input_data["required"]),
            python_data_type=PythonValueTypes(input_data["python_data_type"]),
            allow_blank=AllowBlank(input_data["allow_blank"].upper()),
        )
