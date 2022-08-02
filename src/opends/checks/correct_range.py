from typing import List, Optional

import pandas as pd

from opends.checks.base import Check
from opends.components.file import File, DataField


class CorrectRangeCheck(Check):
    """
    This class is responsible for checking to see if
    """
    def __init__(self, data: pd.DataFrame, file: File, offending_columns: List[str]) -> None:
        """
        The constructor for the CorrectRange class.

        Args:
            data: (pd.DataFrame) the data from the file to be checked
            file: (File) the metadata around the data to be checked
            offending_columns: (List[str]) columns that do not have correct data types
        """
        super().__init__(data=data, file=file, check_name="range field")
        self.offending_columns: List[str] = offending_columns

    def run(self) -> None:
        for column in list(self.data.columns):
            data_field: DataField = self.file.fields.get(column)

            if data_field.should_check and column not in self.offending_columns:
                expected_type: Optional[str] = self.file.data_types.get(column)
                array = self.data[column].astype(expected_type).values
                indexes: List[int] = data_field.check_range(array=array)

                for index in indexes:
                    self.log_data.append(
                        f"row {index} out of range for column {data_field.name} in file {self.file.name}"
                    )
        if len(self.log_data) == 0:
            self.log_data.append(f"range checks passed for file {self.file.name}")
