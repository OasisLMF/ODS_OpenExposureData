"""
This file defines a class that checks to see if the data columns are within pre-defined ranges loaded from the schema.
"""
from typing import List, Optional

import pandas as pd

from opends.checks.base import Check
from opends.components.file import File, DataField
from opends.components.offending_columns import OffendingColumns


class CorrectRangeCheck(Check):
    """
    This class is responsible for ensuring that data fields are within a defined range.

    Attributes:
        offending_columns (List[str]): columns that do not have correct data types
    """
    def __init__(self, data: pd.DataFrame, file: File) -> None:
        """
        The constructor for the CorrectRange class.

        Args:
            data: (pd.DataFrame) the data from the file to be checked
            file: (File) the metadata around the data to be checked
        """
        super().__init__(data=data, file=file, check_name="range field")
        self.offending_columns: List[str] = OffendingColumns()

    def _log_indexes(self, indexes: List[int], data_field: DataField) -> None:
        """
        Adds failing indexes of the check to the self.log_data.

        Args:
            indexes: (List[int]) the indexes that have failed the check
            data_field: (DataField) the data field that has been checked

        Returns: None
        """
        for index in indexes:
            self.log_data.append(
                f"row {index} out of range for column {data_field.name} in file {self.file.name}"
            )

    def run(self) -> None:
        for column in list(self.data.columns):
            data_field: Optional[DataField] = self.file.fields.get(column)

            # checks the column if supported and the column data type is clean (faster)
            if data_field is not None and data_field.should_check and column not in self.offending_columns:
                expected_type: Optional[str] = self.file.data_types.get(column)
                array = self.data[column].astype(expected_type).values
                indexes: List[int] = data_field.check_range(array=array)
                self._log_indexes(indexes=indexes, data_field=data_field)

            # checks the column if supported and the column data type is unsure (slower)
            if data_field is not None and data_field.should_check and column in self.offending_columns:
                array = self.data[column].values
                indexes: List[int] = data_field.check_unsafe_array(array=array)
                self._log_indexes(indexes=indexes, data_field=data_field)

        if len(self.log_data) == 0:
            self.log_data.append(f"range checks passed for file {self.file.name}")
            self.passed = True
