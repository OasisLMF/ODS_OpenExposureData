"""
This file is responsible for defining the check around checking to see if fields in a file are valid.
"""
import pandas as pd

from opends.checks.base import Check
from opends.components.file import File
from opends.components.template_meta_loader import TemplateMetaLoader, get_template_meta_data


class SupportedCodesCheck(Check):

    def __init__(self, data: pd.DataFrame, file: File) -> None:
        """
        The constructor for the ValidFieldCheck class.

        Args:
            data: (pd.DataFrame) the data from the file to be checked
            file: (File) the metadata around the data to be checked
        """
        super().__init__(data=data, file=file, check_name="Supported codes")
        self.meta_data: TemplateMetaLoader = get_template_meta_data(name=self.check_name + "check")

    def _safe_codes_check(self) -> bool:
        pass

    def _codes_check(self) -> bool:
        pass

    def run(self) -> None:
        pass


