"""
This file defines the check for ensuring that a column between two files is the same.
"""
from typing import List

import numpy as np
import pandas as pd

from opends.checks.cross_checks.base import CrossCheck
from opends.components.file import File


class ConsistentValuesCheck(CrossCheck):
    """
    This class is responsible for checking if a column between two files are the same.

    Attributes:
        column_name (str): the name of the column being checked
    """
    def __init__(self, left_data: pd.DataFrame, left_file: File, right_data: pd.DataFrame, right_file: File,
                 column_name: str) -> None:
        """
        The constructor for the ConsistentValuesCheck class.

        Args:
            left_data: (pd.DataFrame) data loaded from the left file
            left_file: (File) metadata about the right file
            right_data: (pd.DataFrame) data loaded from the right file
            right_file: (File) metadata about the left file
            column_name: (str) the name of the column being checked
        """
        super().__init__(left_data=left_data, left_file=left_file,
                         right_data=right_data, right_file=right_file,
                         check_name=f"consistent values for {column_name} column for files "
                                    f"{left_file.name} and {right_file.name}")
        self.column_name: str = column_name

    def run(self) -> None:
        left_column = self.data[self.column_name].to_numpy()
        right_column = self.right_check.data[self.column_name].to_numpy()
        bool_results = left_column == right_column
        indexes: List[int] = list(np.where(bool_results == False)[0])

        for index in indexes:
            self.log_data.append(
                f"row {index} for column {self.column_name} is not consistent across files {self.file.name} and "
                f"{self.right_check.file.name}"
            )
        self.validate_pass()
