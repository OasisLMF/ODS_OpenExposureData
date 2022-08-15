"""
This file defines the base class for file checks.
"""
from typing import List
import pandas as pd

from opends.components.file import File
from opends.components.template_meta_loader import TemplateMetaLoader, get_template_meta_data


class Check:
    """
    This class is the base class for file checks.

    Attributes:
        data (pd.DataFrame): the data from file being checked
        file (File): the metadata around the standards for the file being checked
        check_name (str): the name of the check being performed
        log_data (List[str]): the outcomes of the check
        passed (bool): True if test has passed, False if not
    """
    def __init__(self, data: pd.DataFrame, file: File, check_name: str) -> None:
        """
        The constructor for the Check class.

        Args:
            data: (pd.DataFrame) the data from file being checked
            file: (File) the metadata around the standards for the file being checked
            check_name: (str) the name of the check being performed
        """
        self.data: pd.DataFrame = data
        self.file: File = file
        self.check_name: str = check_name
        self.log_data: List[str] = []
        self.passed: bool = False

    def run(self) -> None:
        """
        Runs the check on the file updating the self.log_data and self.passed based on the outcome.

        Returns: None
        """
        raise NotImplementedError(f"run function needs to be implemented for the {self.check_name}")

    def check_if_flexi_field_name(self, name: str) -> bool:
        """
        Checks to see if the field name is a flexi field meaning that it can be allowed even if the name is not in the
        schema.

        Args:
            name: (str) the data field name to be checked

        Returns: (bool) True if the field is flexi, False if not
        """
        data_length = len(self.flexi_prefix)
        field_prefix = name[0:data_length]
        if field_prefix.lower() == self.flexi_prefix:
            return True
        return False

    @property
    def flexi_prefix(self) -> str:
        return f"flexi{self.file.name}".lower()

    @property
    def meta_data(self) -> TemplateMetaLoader:
        meta_data = get_template_meta_data(name=self.check_name + "check")
        return meta_data
