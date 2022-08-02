"""
This file defines the CorrectDataTypeCheck class for checking if a file has the correct data type of each field.
"""
import pandas as pd

from opends.checks.base import Check
from opends.components.field import DataField
from opends.components.file import File
from typing import Optional, List


class CorrectDataTypeCheck(Check):
    """
    This class is responsible for checking if a file has the correct data type of each field.
    """
    def __init__(self, data: pd.DataFrame, file: File) -> None:
        """
        The constructor for the CorrectDataTypeCheck class.

        Args:
            data: (pd.DataFrame) the data from the file to be checked
            file: (File) the metadata around the data to be checked
        """
        super().__init__(data=data, file=file, check_name="correct data types")
        self.offending_columns: List[str] = []

    def _pass_cast_column_d_type(self, d_type: str, column_name: str) -> bool:
        """
        Casts the entire column and the expected data type to check if the entire column can be casted into a
        particular type.

        Args:
            d_type: (str) the data type that will be casted into
            column_name: (str) the name of the column being checked in the self.data

        Returns: True => column can be casted into the desired type, False => column cannot and therefore has incorrect
                 data types
        """
        try:
            self.data[column_name].astype(d_type)
            return True
        except ValueError:
            return False

    def _locate_offending_rows(self, column_name: str, data_field: DataField) -> None:
        """
        Locates the offending rows that cause the column to fail the self._pass_cast_column_d_type test.

        Warnings:
            this type check cannot be 100% accurate. For instance, a float like 1.1 can be converted to the
            string "1.1".

        Args:
            column_name: (str) the name of the column being checked in the self.data
            data_field: (DataField) the meta data of the column being checked

        Returns: None
        """
        column = self.data[column_name].values.tolist()
        needed_data_type = data_field.python_data_type.native_type
        counter = 1

        for i in column:
            try:
                needed_data_type(i)
            except ValueError:
                self.log_data.append(
                    f"column: {column_name} row: {counter} is a {type(i)} instead of a {needed_data_type} "
                    f"in file {self.file.name}"
                )
            counter += 1

    def _log_not_supported(self, column_name: str) -> None:
        """
        Adds to the self.log_data that a column is not supported and therefore cannot be type checked.

        Args:
            column_name: (str) the name of the column that cannot be type checked

        Returns: None
        """
        self.log_data.append(
            f"column {column_name} is not supported in file {self.file.name} and "
            f"therefore cannot be type checked"
        )

    def run(self) -> None:
        """
        Loops through the rows of each column to note where there are data inconsistencies for data types.
        If there are any inconsistencies found the test will fail.

        Returns: None
        """
        data_columns = list(self.data)

        # TODO => get rid of offending columns and do try accept to capture everything in one go
        for data_column in data_columns:
            expected_type: Optional[str] = self.file.data_types.get(data_column)

            if expected_type is None:
                self.offending_columns.append(data_column)
                self._log_not_supported(column_name=data_column)
            else:
                if self._pass_cast_column_d_type(d_type=expected_type, column_name=data_column) is False:
                    self.offending_columns.append(data_column)
                    data_field = self.file.fields.get(data_column)
                    self._locate_offending_rows(column_name=data_column, data_field=data_field)

        if len(self.log_data) == 0:
            self.passed = True
            self.log_data.append(f"data type checking passed for file: {self.file.name}")
