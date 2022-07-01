"""
This file defines the tests for checking if a file has all the required data fields.
"""
from unittest import main, TestCase

import pandas as pd

from opends.checks.required_fields import RequiredFieldsCheck
from opends.components.template_loader import TemplateLoader
from tests.unit.utils import DIR_PATH


class TestRequiredFieldsCheck(TestCase):

    def setUp(self) -> None:
        self.loader = TemplateLoader(file_path=DIR_PATH)
        self.file = self.loader.files["Loc"]

    def tearDown(self) -> None:
        pass

    def test_fail(self):
        data = pd.DataFrame([
            {
                "PortNumber": "one",
                # "AccNumber": "two",
                "LocNumber": "three",
                # "CountryCode": "two",
                "LocPerilsCovered": "two",
                "BuildingTIV": "two",
                "ContentsTIV": "two",
                # "BITIV": "two",
                "LocCurrency": "two",
            },
        ])
        check = RequiredFieldsCheck(data=data, file=self.file)
        check.run()

        expected_log_data = [
            'field name: AccNumber for Loc file is missing',
            'field name: CountryCode for Loc file is missing',
            'field name: BITIV for Loc file is missing'
        ]
        self.assertEqual(False, check.passed)
        self.assertEqual(expected_log_data, check.log_data)

    def test_pass(self):
        data = pd.DataFrame([
            {
                "PortNumber": "one",
                "AccNumber": "two",
                "LocNumber": "three",
                "CountryCode": "two",
                "LocPerilsCovered": "two",
                "BuildingTIV": "two",
                "ContentsTIV": "two",
                "BITIV": "two",
                "LocCurrency": "two",
            },
        ])
        check = RequiredFieldsCheck(data=data, file=self.file)
        check.run()
        self.assertEqual(True, check.passed)
        self.assertEqual(['required field check passed for Loc file'], check.log_data)


if __name__ == "__main__":
    main()
