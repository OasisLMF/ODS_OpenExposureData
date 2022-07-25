"""
This file is responsible for defining the check around checking to see if fields in a file are valid.
"""
import pandas as pd

from opends.checks.base import Check
from opends.components.file import File


class ValidFieldCheck(Check):
    """
    This class is responsible for checking the fields in a file to see if they are valid.
    """
    def __init__(self, data: pd.DataFrame, file: File) -> None:
        """
        The constructor for the ValidFieldCheck class.

        Args:
            data: (pd.DataFrame) the data from the file to be checked
            file: (File) the metadata around the data to be checked
        """
        super().__init__(data=data, file=file, check_name="valid field")

    def run(self) -> None:
        """
        Loops through the column names in the self.data to see if the column name is present in the file metadata.
        If all the columns in the self.data are present in the metadata then the test has passed. If the field
        has a "flexi{filetype}" prefix then it will be allowed not matter what it is called.

        Returns: None
        """
        data_columns = list(self.data)

        for column_name in data_columns:
            flexi_name: bool = self.check_if_flexi_field_name(name=column_name)
            if self.file.fields.get(column_name) is None and flexi_name is False:
                self.log_data.append(f"field name: {column_name} for {self.file.name} file is not valid")

        if len(self.log_data) == 0:
            self.passed = True
            self.log_data.append(f"valid field check passed for {self.file.name} file")
