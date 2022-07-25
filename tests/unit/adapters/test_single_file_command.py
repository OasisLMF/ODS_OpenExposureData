"""
This file defines the test around the terminal command entry point that runs all checks on an individual file.
The adapter directly is not tested because all it does is call some basic functions and objects that have already been
directly tested. The Adapter is still in-place because it gives the developer the ability to import the single test
into their own Python code.
"""
import os
from unittest import main, TestCase
from unittest.mock import patch

from opends.adapters.single_file_test import main as adapter_main
from tests.unit.utils import META_DATA_PATH


class TestSingleCommandFileAdapter(TestCase):

    @patch("opends.adapters.single_file_test.os")
    @patch("opends.adapters.single_file_test.argparse")
    def setUp(self, mock_argparse, mock_os) -> None:
        self.loc_outcome_path: str = f"{META_DATA_PATH}/Loc_check_output.txt"
        self.acc_outcome_path: str = f"{META_DATA_PATH}/Acc_check_output.txt"
        self.reinscope_outcome_path: str = f"{META_DATA_PATH}/ReinsScope_check_output.txt"
        self.reinsinfo_outcome_path: str = f"{META_DATA_PATH}/ReinsInfo_check_output.txt"
        self.input_file = mock_argparse.ArgumentParser.return_value.parse_args.return_value.name
        self.file_choice = mock_argparse.ArgumentParser.return_value.parse_args.return_value.type
        mock_os.getcwd.return_value = META_DATA_PATH

    def tearDown(self) -> None:
        self._wipe_outcome(path=self.loc_outcome_path)
        self._wipe_outcome(path=self.acc_outcome_path)
        self._wipe_outcome(path=self.reinscope_outcome_path)
        self._wipe_outcome(path=self.reinsinfo_outcome_path)

    @staticmethod
    def _wipe_outcome(path: str) -> None:
        if os.path.exists(path):
            os.remove(path)

    def compare_data(self, path: str, expected_data: str):
        with open(path, "r") as file:
            data = file.read()
        # print(data)
        self.assertEqual(expected_data, data)

    @staticmethod
    @patch("opends.adapters.single_file_test.os")
    @patch("opends.adapters.single_file_test.argparse")
    def run_test(mock_argparse, mock_os, function, file_name, file_type):
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.name = file_name
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.type = file_type
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.version = "2.3.1"
        mock_os.getcwd.return_value = META_DATA_PATH
        adapter_main()
        function()

    def test_adapter_main_pass_loc(self):
        self.run_test(function=self.adapter_main_pass_loc, file_name="pass_loc.csv", file_type="Loc")

    def test_adapter_main_fail_loc(self):
        self.run_test(function=self.adapter_main_fail_loc, file_name="fail_loc.csv", file_type="Loc")

    def test_adapter_main_pass_reinscope(self):
        self.run_test(function=self.adapter_main_pass_reinscope, file_name="pass_reinscope.csv",
                      file_type="ReinsScope")

    def test_adapter_main_fail_reinscope(self):
        self.run_test(function=self.adapter_main_fail_reinscope, file_name="fail_reinscope.csv",
                      file_type="ReinsScope")

    def test_adapter_main_pass_reinsinfo(self):
        self.run_test(function=self.adapter_main_pass_reinsinfo, file_name="pass_reinsinfo.csv",
                      file_type="ReinsInfo")

    def test_adapter_main_fail_reinsinfo(self):
        self.run_test(function=self.adapter_main_fail_reinsinfo, file_name="fail_reinsinfo.csv",
                      file_type="ReinsInfo")

    def test_adapter_main_spiked_loc(self):
        self.run_test(function=self.adapter_main_spiked_loc, file_name="spiked_loc.csv",
                      file_type="Loc")

    def adapter_main_pass_loc(self):
        expected_outcome = "valid field check passed for Loc file\n" \
                           "required field check passed for Loc file\n" \
                           "data type checking passed for file: Loc"
        self.compare_data(path=self.loc_outcome_path, expected_data=expected_outcome)

    def adapter_main_fail_loc(self):
        expected_outcome = "field name: PortNumbers for Loc file is not valid\n" \
                           "field name: LocNumbers for Loc file is not valid\n" \
                           "field name: Longitudes for Loc file is not valid\n" \
                           "field name: PortNumber for Loc file is missing\n" \
                           "field name: LocNumber for Loc file is missing\n" \
                           "column PortNumbers is not supported in file Loc and therefore cannot be type checked\n" \
                           "column LocNumbers is not supported in file Loc and therefore cannot be type checked\n" \
                           "column Longitudes is not supported in file Loc and therefore cannot be type checked"
        self.compare_data(path=self.loc_outcome_path, expected_data=expected_outcome)

    def adapter_main_pass_reinscope(self):
        expected_data = "valid field check passed for ReinsScope file\n" \
                        "required field check passed for ReinsScope file\n" \
                        "data type checking passed for file: ReinsScope"
        self.compare_data(path=self.reinscope_outcome_path, expected_data=expected_data)

    def adapter_main_fail_reinscope(self):
        expected_data = "field name: ReinsNumbers for ReinsScope file is not valid\n" \
                        "field name: PolNumbers for ReinsScope file is not valid\n" \
                        "field name: ReinsNumber for ReinsScope file is missing\n" \
                        "column ReinsNumbers is not supported in file ReinsScope and therefore cannot be type checked\n" \
                        "column PolNumbers is not supported in file ReinsScope and therefore cannot be type checked"
        self.compare_data(path=self.reinscope_outcome_path, expected_data=expected_data)

    def adapter_main_pass_reinsinfo(self):
        expected_data = "valid field check passed for ReinsInfo file\n" \
                        "required field check passed for ReinsInfo file\n" \
                        "data type checking passed for file: ReinsInfo"
        self.compare_data(path=self.reinsinfo_outcome_path, expected_data=expected_data)

    def adapter_main_fail_reinsinfo(self):
        expected_data = "field name: ReinsNumbers for ReinsInfo file is not valid\n" \
                        "field name: ReinsNames for ReinsInfo file is not valid\n" \
                        "field name: ReinsNumber for ReinsInfo file is missing\n" \
                        "column ReinsNumbers is not supported in file ReinsInfo and therefore cannot be type checked\n" \
                        "column ReinsNames is not supported in file ReinsInfo and therefore cannot be type checked"
        self.compare_data(path=self.reinsinfo_outcome_path, expected_data=expected_data)

    def adapter_main_spiked_loc(self):
        expected_data = "valid field check passed for Loc file\n" \
                        "required field check passed for Loc file\n" \
                        "column: IsTenant row: 5 is a <class 'str'> instead of a <class 'int'> in file Loc"
        self.compare_data(path=self.loc_outcome_path, expected_data=expected_data)


if __name__ == "__main__":
    main()
