"""
This file defines the CorrectDataTypeCheck class for checking if a file has the correct data type of each field.
"""
import pandas as pd

from opends.checks.base import Check
from opends.components.file import File


class CorrectDataTypeCheck(Check):
    """
    This class is responsible for checking if a file if a file has the correct data type of each field.
    """
    def __init__(self, data: pd.DataFrame, file: File) -> None:
        """
        The constructor for the CorrectDataTypeCheck class.

        Args:
            data: (pd.DataFrame) the data from the file to be checked
            file: (File) the metadata around the data to be checked
        """
        super().__init__(data=data, file=file, check_name="correct data types")

    def run(self) -> None:
        """
        Loops through the rows of each column to note where there are data inconsistencies for data types.
        If there are any inconsistencies found the test will fail.

        Returns: None
        """
        data_columns = list(self.data)

        for data_column in data_columns:
            column = self.data[data_column].values
            data_field = self.file.fields.get(data_column)
            counter = 1

            if data_field is not None:
                needed_data_type = data_field.python_data_type.native_type
                for i in column:
                    if not isinstance(i, needed_data_type):
                        self.log_data.append(
                            f"column: {data_column} row: {counter} is a {type(i)} instead of a {needed_data_type} "
                            f"in file {self.file.name}"
                        )
                    counter += 1
            else:
                self.log_data.append(
                    f"column {data_column} is not supported in file {self.file.name} and "
                    f"therefore cannot be type checked"
                )
        if len(self.log_data) == 0:
            self.passed = True
            self.log_data.append(f"data type checking passed for file: {self.file.name}")
