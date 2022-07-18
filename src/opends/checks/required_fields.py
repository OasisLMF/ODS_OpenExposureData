"""
This file defines the RequiredFieldsCheck class for checking if a file has all the required data fields.
"""
import pandas as pd
from typing import Dict, List

from opends.checks.base import Check
from opends.components.file import File
from opends.components.template_loader import TemplateLoader
from opends.version_control import SchemaPath


class RequiredFieldsCheck(Check):
    """
    This class is responsible for checking if a file has all the required data fields.
    """
    def __init__(self, data: pd.DataFrame, file: File) -> None:
        """
        The constructor for the RequiredFieldsCheck class.

        Args:
            data: (pd.DataFrame) the data from the file to be checked
            file: (File) the metadata around the data to be checked
        """
        super().__init__(data=data, file=file, check_name="required fields")
        self.template_data: TemplateLoader = TemplateLoader(file_path=SchemaPath(version_string="2.3.1"))

    def _get_types(self) -> Dict[str, str]:
        """
        Gets the Pandas data types from the data fields that are needed.

        Returns: (Dict[str, str]) the name of the data field and the pandas data type
        """
        type_dict: Dict[str, str] = dict()

        data_columns: List[str] = self.file.data_types
        file = self.template_data.files.get(self.file_type.value)

        for data_column in data_columns:
            data_field = file.fields.get(data_column)
            if data_field is not None:
                type_dict[data_field.name] = data_field.pandas_value.pandas_value

        return type_dict

    def run(self) -> None:
        """
        Loops through the column names in the self.file to see if the column name is present in the file data.
        If all of the required data fields are present in the file data self.passed is True.

        Returns: None
        """
        required_fields = self.file.required_fields
        data_fields = list(self.data)

        for data_field in required_fields:
            if data_field not in data_fields:
                self.log_data.append(f"field name: {data_field} for {self.file.name} file is missing")

        if len(self.log_data) == 0:
            self.passed = True
            self.log_data.append(f"required field check passed for {self.file.name} file")
