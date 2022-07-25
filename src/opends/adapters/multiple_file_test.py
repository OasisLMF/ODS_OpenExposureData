"""
This file defines an adapter that tests all the valid files in a directory.
"""
import os
from typing import List, Optional

from opends.adapters.single_file_test import SingleFileTestAdapter
from opends.enums import FileNames
import argparse


class MultipleFileTestAdapter:
    """
    This class is responsible for loading all files from the enum FileNames and perform all checks on all the valid
    files in a directory to produce a log.

    Attributes:
        version (str): the version of schema being loaded (current latest one is "2.3.1")
        root_path (str): the directory where the files are housed in order to be checked
    """
    def __init__(self, version: str, root_path: str) -> None:
        """
        The constructor for the MultipleFileTestAdapter class.

        Args:
            version: (str) the version of the schema needed
            root_path: (str) the directory housing the files
        """
        self.version: str = version
        self.root_path: str = root_path
        self._csv_files: Optional[List[str]] = None

    def file_path(self, file_name: str) -> str:
        """
        Gets the path of the file.

        Args:
            file_name: (str) the name of the file for the path

        Returns: (str) the path to the file
        """
        return str(os.path.join(self.root_path, file_name))

    def run_checks(self) -> List[str]:
        """
        Runs a test on all files in the self.root_path.

        Returns: (List[str]) the logs for all of the tests
        """
        buffer: List[str] = []

        for name in self.csv_files:
            for file_name in FileNames:
                if str(file_name.value).casefold() in name.casefold():
                    buffer += SingleFileTestAdapter(
                        file_path=self.file_path(file_name=name),
                        file_name=file_name, version=self.version
                    ).run_checks()
        return buffer

    @property
    def csv_files(self) -> List[str]:
        if self._csv_files is None:
            all_files = os.listdir(self.root_path)
            self._csv_files = list(filter(lambda f: f.endswith('.csv'), all_files))
        return self._csv_files


def main() -> None:
    """
    The entry point for a terminal command that checks all the files in the current directory.

    Returns: None
    """
    args_parser = argparse.ArgumentParser()
    args_parser.add_argument('--version', action='store', type=str, required=True,
                             help="the OED version to be run")
    args = args_parser.parse_args()
    root_path: str = str(os.getcwd())

    adapter = MultipleFileTestAdapter(version=args.version, root_path=root_path)
    log_data = adapter.run_checks()

    with open(f'{os.getcwd()}/all_files_check_output.txt', mode='wt', encoding='utf-8') as file:
        file.write('\n'.join(log_data))
