import os
from unittest import main, TestCase
from unittest.mock import patch

from opends.adapters.cross_file_test import main as adapter_main
from tests.unit.utils import META_DATA_PATH


class TestCrossFileTestAdapter(TestCase):

    @patch("opends.adapters.cross_file_test.os")
    @patch("opends.adapters.cross_file_test.argparse")
    def setUp(self, mock_argparse, mock_os) -> None:
        self.loc_outcome_path: str = f"{META_DATA_PATH}/Loc_cross_check_output.txt"
        self.acc_outcome_path: str = f"{META_DATA_PATH}/Acc_check_output.txt"
        self.input_file = mock_argparse.ArgumentParser.return_value.parse_args.return_value.name
        self.file_choice = mock_argparse.ArgumentParser.return_value.parse_args.return_value.type
        mock_os.getcwd.return_value = META_DATA_PATH

    def tearDown(self) -> None:
        self._wipe_outcome(path=self.loc_outcome_path)
        # self._wipe_outcome(path=self.acc_outcome_path)

    @staticmethod
    def _wipe_outcome(path: str) -> None:
        if os.path.exists(path):
            os.remove(path)

    def compare_data(self, path: str, expected_data: str):
        with open(path, "r") as file:
            data = file.read()
        print(data)
        # self.assertEqual(expected_data, data)

    @staticmethod
    @patch("opends.adapters.cross_file_test.os")
    @patch("opends.adapters.cross_file_test.argparse")
    def run_test(mock_argparse, mock_os, function, left_file_name, left_file_type, right_file_name, right_file_type):
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.lname = left_file_name
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.ltype = left_file_type
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.rname = right_file_name
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.rtype = right_file_type
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.version = "2.3.1"
        mock_os.getcwd.return_value = META_DATA_PATH
        adapter_main()
        function()

    def test_adapter_main_pass_loc(self):
        self.run_test(function=self.adapter_main_pass_loc,
                      left_file_name="pass_loc.csv", left_file_type="Loc",
                      right_file_name="pass_acc.csv", right_file_type="Acc")

    def adapter_main_pass_loc(self):
        expected_outcome = "valid field check passed for file Loc\n" \
                           "required fields check passed for file Loc\n" \
                           "correct data types check passed for file Loc\n" \
                           "range field check passed for file Loc"

        self.compare_data(path=self.loc_outcome_path, expected_data=expected_outcome)


if __name__ == "__main__":
    main()
