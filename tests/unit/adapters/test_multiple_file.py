"""
This file tests the implementation of the MultipleFileTestAdapter class and how the entry point implements the tests.
This file also tests the entry point for running all tests in the current working directory.
"""
import os
from typing import List
from unittest import main, TestCase
from unittest.mock import patch

from opends.adapters.multiple_file_test import MultipleFileTestAdapter
from opends.adapters.multiple_file_test import main as adapter_main
from tests.unit.utils import META_DATA_PATH


class MultipleFileTestAdapterTest(TestCase):

    def setUp(self) -> None:
        self.version: str = "2.3.1"
        self.test = MultipleFileTestAdapter(version=self.version, root_path=META_DATA_PATH)
        self.outcome_path = META_DATA_PATH + "/all_files_check_output.txt"

    def tearDown(self) -> None:
        self._wipe_outcome(path=self.outcome_path)

    @staticmethod
    def _wipe_outcome(path: str) -> None:
        if os.path.exists(path):
            os.remove(path)

    def compare_data(self, path: str, expected_data: List[str]):
        with open(path, "r") as file:
            data = file.read()
        # print(data)
        self.assertEqual(expected_data, data.split("\n"))

    @staticmethod
    @patch("opends.adapters.multiple_file_test.os.getcwd")
    @patch("opends.adapters.multiple_file_test.argparse")
    def run_test(mock_argparse, mock_os, function):
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.version = "2.3.1"
        mock_os.return_value = META_DATA_PATH
        adapter_main()
        function()

    def test___init__(self):
        self.assertEqual(self.version, self.test.version)
        self.assertEqual(META_DATA_PATH, self.test.root_path)
        self.assertEqual(None, self.test._csv_files)

    def test_csv_files(self):
        expected_outcome = [
            'pass_acc.csv',
            'fail_reinsinfo.csv',
            'pass_reinscope.csv',
            'fail_reinscope.csv',
            'fail_loc.csv',
            'pass_reinsinfo.csv',
            'fail_acc.csv',
            'pass_loc.csv'
        ]
        self.assertEqual(expected_outcome, self.test.csv_files)

    def test_file_path(self):
        self.assertEqual(META_DATA_PATH + "pass_acc.csv", self.test.file_path(file_name='pass_acc.csv'))

    def test_run_checks(self):
        self.assertEqual(EXPECTED_OUTCOME, self.test.run_checks())

    def test_adapter_main_pass_loc(self):
        self.run_test(function=self.run_all)

    def run_all(self):
        self.compare_data(path=self.outcome_path, expected_data=EXPECTED_OUTCOME)


EXPECTED_OUTCOME = [
    'valid field check passed for Acc file',
    'required field check passed for Acc file',
    'data type checking passed for file: Acc',
    'field name: ReinsNumbers for ReinsInfo file is not valid',
    'field name: ReinsNames for ReinsInfo file is not valid',
    'field name: ReinsNumber for ReinsInfo file is missing',
    'column ReinsNumbers is not supported in file ReinsInfo and therefore cannot be type checked',
    'column ReinsNames is not supported in file ReinsInfo and therefore cannot be type checked',
    'field name: PortNumbers for Loc file is not valid',
    'field name: LocNumbers for Loc file is not valid',
    'field name: Longitudes for Loc file is not valid',
    'field name: PortNumber for Loc file is missing',
    'field name: LocNumber for Loc file is missing',
    'column PortNumbers is not supported in file Loc and therefore cannot be type checked',
    'column LocNumbers is not supported in file Loc and therefore cannot be type checked',
    'column Longitudes is not supported in file Loc and therefore cannot be type checked',
    'valid field check passed for ReinsInfo file',
    'required field check passed for ReinsInfo file',
    'data type checking passed for file: ReinsInfo',
    'field name: PortNumbers for Acc file is not valid',
    'field name: PolInceptionDates for Acc file is not valid',
    'field name: PortNumber for Acc file is missing',
    'column PortNumbers is not supported in file Acc and therefore cannot be type checked',
    'column PolInceptionDates is not supported in file Acc and therefore cannot be type checked',
    'valid field check passed for Loc file',
    'required field check passed for Loc file',
    'data type checking passed for file: Loc'
]


if __name__ == "__main__":
    main()
