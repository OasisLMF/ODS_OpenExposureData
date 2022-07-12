"""
This file defines the test around checking a file to see if all the fields in that file are valid.
"""
from unittest import main, TestCase

import pandas as pd

from opends.checks.valid_fields import ValidFieldCheck
from opends.components.template_loader import TemplateLoader
from tests.unit.utils import DIR_PATH


class TestValidFields(TestCase):

    def setUp(self) -> None:
        self.loader = TemplateLoader(file_path=DIR_PATH)
        self.file = self.loader.files["Loc"]

    def tearDown(self) -> None:
        pass

    def test_fail(self):
        expected_log_data = [
            'field name: one for Loc file is not valid',
            'field name: two for Loc file is not valid',
            'field name: Flexi_Loctwo for Loc file is not valid'
        ]
        data = pd.DataFrame([
            {"LocName": "one", "City": "two", "AreaName": "three", "one": "four", "two": "five"},
            {"LocName": "one", "City": "two", "AreaName": "three", "one": "four", "two": "five"},
            {"LocName": "one", "City": "two", "AreaName": "three", "one": "four", "two": "five"},
            {"LocName": "one", "City": "two", "AreaName": "three", "one": "four", "two": "five"},
            {"LocName": "one", "City": "two", "AreaName": "three", "flexilocone": "four", "FlexiLoctwo": "five"},
            {"LocName": "one", "City": "two", "AreaName": "three", "flexiloc_one": "four", "Flexi_Loctwo": "five"},
        ])
        check = ValidFieldCheck(data=data, file=self.file)
        check.run()

        self.assertEqual(False, check.passed)
        self.assertEqual(expected_log_data, check.log_data)

    def test_pass(self):
        data = pd.DataFrame([
            {"LocName": "one", "City": "two", "AreaName": "three"},
            {"LocName": "one", "City": "two", "AreaName": "three"},
            {"LocName": "one", "City": "two", "AreaName": "three"},
            {"LocName": "one", "City": "two", "AreaName": "three"}
        ])
        check = ValidFieldCheck(data=data, file=self.file)
        check.run()

        self.assertEqual(True, check.passed)
        self.assertEqual(["valid field check passed for Loc file"], check.log_data)


if __name__ == "__main__":
    main()
