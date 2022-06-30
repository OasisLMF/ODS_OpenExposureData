"""
This file defines the adapter from checking an individual file and the terminal entry point for checking an
individual file.
"""
import argparse
import os
from typing import List

import pandas as pd

from opends.checks import perform_checks
from opends.components.template_loader import TemplateLoader
from opends.version_control import DIR_PATH


class SingleFileTestAdapter:
    """
    This class is responsible for loading a file, loading the template data, and checking the file that is loaded.

    Warnings:
        - at this point this class only handles CSV loading, other formats will be supported in the future

    Attributes:
        file_path (str): the path of the file being checked
        file_name (str): the name of the file being checked
        templates (TemplateLoader): the loader that loads the data for field standards
        data (pd.DataFrame): the data of the file being loaded
    """
    def __init__(self, file_path: str, file_name: str) -> None:
        """
        The constructor for the SingleFileTestAdapter class.

        Args:
            file_path: (str) the path of the file being checked
            file_name: (str) the name of the file being checked
        """
        self.file_path: str = file_path
        self.file_name: str = file_name
        self.templates: TemplateLoader = TemplateLoader(file_path=DIR_PATH)
        self.data: pd.DataFrame = self._load_csv()

    def _load_csv(self) -> pd.DataFrame:
        """
        Loads data from a CSV file.

        Returns: (pd.DataFrame) the data from the CSV
        """
        return pd.read_csv(self.file_path)

    def run_checks(self) -> List[str]:
        """
        Runs a series of checks

        Returns: (List[str]) logs of all the test outcomes for the file
        """
        return perform_checks(data=self.data, file=self.templates.files[self.file_name])


def main() -> None:
    """
    Entry point for a terminal command that checks the file.

    Returns: None
    """
    args_parser = argparse.ArgumentParser()
    args_parser.add_argument('--name', action='store', type=str, required=True,
                             help="the name of the file being checked")
    args_parser.add_argument('--type', action='store', type=str, required=True,
                             help="type of file being checked like: Loc, Acc, ReinsInfo, ReinsScope")
    args = args_parser.parse_args()

    file_path = str(os.getcwd()) + f"/{args.name}"
    file_name = args.type

    log_data = SingleFileTestAdapter(file_path=file_path, file_name=file_name).run_checks()

    with open(f'{os.getcwd()}/{file_name}_check_output.txt', mode='wt', encoding='utf-8') as file:
        file.write('\n'.join(log_data))
