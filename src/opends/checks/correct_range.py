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
<<<<<<< HEAD
    This class is responsible for checking to see if
    """
    def __init__(self, data: pd.DataFrame, file: File, offending_columns: List[str]) -> None:
=======
    This class is responsible for ensuring that data fields are within a defined range.

    Attributes:
        offending_columns (List[str]): columns that do not have correct data types
    """
    def __init__(self, data: pd.DataFrame, file: File) -> None:
>>>>>>> 69503ac1f6c188c1990026dc6d7939c7e4ef9cb5
        """
        The constructor for the CorrectRange class.

        Args:
            data: (pd.DataFrame) the data from the file to be checked
            file: (File) the metadata around the data to be checked
        """
        super().__init__(data=data, file=file, check_name="range field")
<<<<<<< HEAD
        self.offending_columns: List[str] = offending_columns
=======
        self.offending_columns: List[str] = OffendingColumns()
>>>>>>> 69503ac1f6c188c1990026dc6d7939c7e4ef9cb5

    def run(self) -> None:
        for column in list(self.data.columns):
            data_field: Optional[DataField] = self.file.fields.get(column)

            if data_field is not None and data_field.should_check and column not in self.offending_columns:
                expected_type: Optional[str] = self.file.data_types.get(column)
<<<<<<< HEAD
                array = self.data[column].astype(expected_type).values
                indexes: List[int] = data_field.check_range(array=array)

                for index in indexes:
                    self.log_data.append(
                        f"row {index} out of range for column {data_field.name} in file {self.file.name}"
                    )
        if len(self.log_data) == 0:
            self.log_data.append(f"range checks passed for file {self.file.name}")
=======
                array = self.data[column].astype(expected_type).to_numpy()
                indexes: List[int] = data_field.check_range(array=array)

                for index in indexes:
                    self.log_data.append(f"row {index} in column {column} is out of bounds for file {self.file.name}")
        if len(self.log_data) == 0:
            self.passed = True
            self.log_data.append(f"data range checking passed for file: {self.file.name}")
>>>>>>> 69503ac1f6c188c1990026dc6d7939c7e4ef9cb5
