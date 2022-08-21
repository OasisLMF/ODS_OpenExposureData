"""
This file defines the base class for cross-checks that test data in two different files.
"""
import pandas as pd

from opends.checks.base import Check
from opends.components.file import File


class CrossCheck(Check):
    """
    This class is responsible for defining core features for a cross-file check. Basically this class inherits from
    the base class of a standard check making the attributes concerned with the left file the main check. The
    attributes concerned with the right file also passed into a Check class however, data concerning the right file
    will only be used for reference.

    Attributes:
        right_check (Check): the check data concerned with attributes from the right file
    """
    def __init__(self, left_data: pd.DataFrame, left_file: File,
                 right_data: pd.DataFrame, right_file: File, check_name: str) -> None:
        """
        The constructor for the CrossCheck class.

        Args:
            left_data: (pd.DataFrame) data loaded from the left file
            left_file: (File) metadata about the right file
            right_data: (pd.DataFrame) data loaded from the right file
            right_file: (File) metadata about the left file
            check_name: (str) name of the check being performed
        """
        super().__init__(data=left_data, file=left_file, check_name=check_name)
        self.right_check: Check = Check(data=right_data, file=right_file, check_name=check_name)

    def run(self) -> None:
        """
        Runs the check on the file updating the self.log_data and self.passed based on the outcome.

        Returns: None
        """
        raise NotImplementedError(f"run function needs to be implemented for the {self.check_name}")
