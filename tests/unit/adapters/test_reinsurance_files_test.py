import os
from unittest import main, TestCase
from unittest.mock import patch

# from opends.adapters.reinsurance_files_test import main as adapter_main
from tests.unit.utils import META_DATA_PATH
from opends.adapters.reinsurance_files_test import ReinsuranceFilesTestAdapter


class TestReinsuranceFilesTestAdapter(TestCase):

    def setUp(self) -> None:
        pass

    def tearDown(self) -> None:
        pass

    def test___init__(self):
        test = ReinsuranceFilesTestAdapter(version="2.3.1", root_path=META_DATA_PATH)




if __name__ == "__main__":
    main()
