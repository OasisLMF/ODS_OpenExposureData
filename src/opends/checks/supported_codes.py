"""
This file is responsible for defining the check around checking to see if fields in a file are valid.
"""
import pandas as pd

from opends.checks.base import Check
from opends.components.file import File
from typing import List


class SupportedCodesCheck(Check):

    OCCUPANCY_FIELD = "OccupancyCode"
    FILE_NAME = "Loc"

    def __init__(self, data: pd.DataFrame, file: File) -> None:
        """
        The constructor for the ValidFieldCheck class.

        Args:
            data: (pd.DataFrame) the data from the file to be checked
            file: (File) the metadata around the data to be checked
        """
        super().__init__(data=data, file=file, check_name="Supported codes")

    def _unsafe_codes_check(self) -> bool:
        pass

    def _codes_check(self) -> bool:
        pass

    def _check_occupancy_codes(self) -> None:
        if self.file.name == self.FILE_NAME:
            occupancy_codes = self.data[self.OCCUPANCY_FIELD].to_numpy()
            data_field = self.file.fields.get(self.OCCUPANCY_FIELD)
            failure_indexes = data_field.check_range(array=occupancy_codes)

            for index in failure_indexes:
                self.log_data.append(
                    f"occupancy code in row {index} is not supported in column {self.OCCUPANCY_FIELD} in "
                    f"file: {self.FILE_NAME}"
                )

    def _check_construction_codes(self):
        pass

    def _check_country_and_area_codes(self):
        pass

    def run(self) -> None:
        self._check_occupancy_codes()
        self._check_construction_codes()
        self._check_country_and_area_codes()
        self.validate_pass()
