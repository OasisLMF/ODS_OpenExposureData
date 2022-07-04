"""
This file defines the RequiredFieldsCheck class for checking if a file has all the required data fields.
"""
import pandas as pd

from opends.checks.base import Check
from opends.components.file import File


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
