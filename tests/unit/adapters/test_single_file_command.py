"""
This file defines the test around the terminal command entry point that runs all checks on an individual file.
The adapter directly is not tested because all it does is call some basic functions and objects that have already been
directly tested. The Adapter is still in-place because it gives the developer the ability to import the single test
into their own Python code.
"""
from unittest import main, TestCase
from unittest.mock import patch
import os

from opends.adapters.single_file_test import main as adapter_main
from tests.unit.utils import META_DATA_PATH


class TestSingleCommandFileAdapter(TestCase):

    def setUp(self) -> None:
        self.outcome_path = f"{META_DATA_PATH}/Loc_check_output.txt"

    def tearDown(self) -> None:
        if os.path.exists(self.outcome_path):
            os.remove(self.outcome_path)

    @patch("opends.adapters.single_file_test.os")
    @patch("opends.adapters.single_file_test.argparse")
    def test_adapter_main_pass(self, mock_argparse, mock_os):
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.name = "pass_loc.csv"
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.type = "Loc"
        mock_os.getcwd.return_value = META_DATA_PATH

        adapter_main()

        with open(self.outcome_path, "r") as file:
            data = file.read()
        self.assertEqual("valid field check passed for Loc file", data)

    @patch("opends.adapters.single_file_test.os")
    @patch("opends.adapters.single_file_test.argparse")
    def test_adapter_main_fail(self, mock_argparse, mock_os):
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.name = "fail_loc.csv"
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.type = "Loc"
        mock_os.getcwd.return_value = META_DATA_PATH

        adapter_main()

        with open(self.outcome_path, "r") as file:
            data = file.read()
        expected_outcome = "field name: PortNumbers for Loc file is not valid\n" \
                           "field name: LocNumbers for Loc file is not valid\n" \
                           "field name: Longitudes for Loc file is not valid"
        self.assertEqual(expected_outcome, data)


if __name__ == "__main__":
    main()
