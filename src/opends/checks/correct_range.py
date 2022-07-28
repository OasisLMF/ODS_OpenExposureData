from typing import List, Optional

import pandas as pd

from opends.checks.base import Check
from opends.components.file import File, DataField


class CorrectRangeCheck(Check):

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

    def _check_range(self) -> bool:
        pass

    def _check_category(self) -> bool:
        pass

    def run(self) -> None:
        for column in list(self.data.columns):
            data_field: DataField = self.file.fields.get(column)

            if data_field.should_check and column not in self.offending_columns:
                expected_type: Optional[str] = self.file.data_types.get(column)
                try:
                    array = self.data[column].to_numpy().astype(expected_type)
                    indexes: List[int] = data_field.check_range(array=array)
                    print(indexes)
                except Exception as error:
                    print(error)
