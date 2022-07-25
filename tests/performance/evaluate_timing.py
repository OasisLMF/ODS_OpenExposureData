"""
This file is responsible for performing performance tests on the loading and checking of data. This file does not
run automatically on automated builds/test pipelines due to the data directory being empty as large data files can be
used to run performance tests. Data for running these performance tests needs to be stored in the ./data directory.
"""
import os
import time
from unittest import main, TestCase
from unittest.mock import patch
import logging

from opends.adapters.single_file_test import main as single_file_adapter_main

logger = logging.getLogger(__file__)


class TestTiming(TestCase):

    def setUp(self) -> None:
        pass

    def tearDown(self) -> None:
        pass

    @staticmethod
    @patch("opends.adapters.single_file_test.os")
    @patch("opends.adapters.single_file_test.argparse")
    def run_test(mock_argparse, mock_os, file_name, file_type):
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.name = file_name
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.type = file_type
        mock_argparse.ArgumentParser.return_value.parse_args.return_value.version = "2.3.1"
        mock_os.getcwd.return_value = str(os.path.realpath(__file__)).replace("evaluate_timing.py", "data/")
        single_file_adapter_main()

    def test_clean_acc(self):
        start_time = time.time()
        self.run_test(file_name="clean_acc.csv", file_type="Acc")
        print(f"time taken for clean acc check: {time.time() - start_time}")

    def test_error_acc(self):
        start_time = time.time()
        self.run_test(file_name="error_acc.csv", file_type="Acc")
        print(f"time taken for error acc check: {time.time() - start_time}")

    def test_spiked_acc(self):
        start_time = time.time()
        self.run_test(file_name="spiked_acc.csv", file_type="Acc")
        print(f"time taken for spiked acc check: {time.time() - start_time}")

    def test_clean_loc(self):
        start_time = time.time()
        self.run_test(file_name="clean_loc.csv", file_type="Loc")
        logger.info(f"time taken for clean loc check: {time.time() - start_time}")
        print(f"time taken for clean loc check: {time.time() - start_time}")

    def test_error_loc(self):
        start_time = time.time()
        self.run_test(file_name="error_loc.csv", file_type="Loc")
        logger.info(f"time taken for clean loc check: {time.time() - start_time}")
        print(f"time taken for error loc check: {time.time() - start_time}")

    def test_spiked_loc(self):
        start_time = time.time()
        self.run_test(file_name="spiked_loc.csv", file_type="Loc")
        logger.info(f"time taken for clean loc check: {time.time() - start_time}")
        print(f"time taken for spiked loc check: {time.time() - start_time}")


if __name__ == "__main__":
    main()
