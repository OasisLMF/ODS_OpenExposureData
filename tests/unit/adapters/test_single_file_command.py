"""
This file defines the test around the terminal command entry point that runs all checks on an individual file.
The adapter directly is not tested because all it does is call some basic functions and objects that have already been
directly tested. The Adapter is still in-place because it gives the developer the ability to import the single test
into their own Python code.
"""
from unittest import main, TestCase
from unittest.mock import patch

from opends.adapters.single_file_test import main as adapter_main
from tests.unit.utils import META_DATA_PATH


class TestSingleCommandFileAdapter(TestCase):

    def setUp(self) -> None:
        pass

    def tearDown(self) -> None:
        pass

    @patch("opends.adapters.single_file_command.os")
    @patch("opends.adapters.single_file_command.argparse")
    def test_adapter_main(self, mock_argparse, mock_os):
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.name = "SourceLocOEDPiWind.csv"
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.type = "Loc"
        mock_os.getcwd.return_value = META_DATA_PATH

        adapter_main()


if __name__ == "__main__":
    main()
