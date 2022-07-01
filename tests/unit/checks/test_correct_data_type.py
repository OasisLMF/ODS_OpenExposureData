"""
This file defines tests around checking data types for columns.
"""
from unittest import TestCase, main

import pandas as pd

from opends.checks.correct_data_type import CorrectDataTypeCheck
from opends.components.template_loader import TemplateLoader
from tests.unit.utils import DIR_PATH


class TestCorrectDataTypeCheck(TestCase):

    def setUp(self) -> None:
        self.loader = TemplateLoader(file_path=DIR_PATH)
        self.file = self.loader.files["Loc"]

    def tearDown(self) -> None:
        pass

    def test_fail(self):
        data = pd.DataFrame([
            {
                "PortNumber": 0.32,
                "AccNumber": 5.6,
                "LocNumber": 7.3,
                "CountryCode": 5.5,
                "LocPerilsCovered": 3.3,
                "BuildingTIV": "two",
                "ContentsTIV": "two",
                "BITIV": "two",
                "LocCurrency": 1.1,
            },
            {
                "PortNumber": "test",
                "AccNumber": 5.6,
                "LocNumber": "test",
                "CountryCode": 5.5,
                "LocPerilsCovered": 3.3,
                "BuildingTIV": 1.1,
                "ContentsTIV": 2.2,
                "BITIV": "two",
                "LocCurrency": 1.1,
            },
        ])
        check = CorrectDataTypeCheck(data=data, file=self.file)
        check.run()
        expected_data = [
            "column: PortNumber row: 2 is a <class 'str'> instead of a <class 'float'> in file Loc",
            "column: LocNumber row: 2 is a <class 'str'> instead of a <class 'float'> in file Loc",
            "column: BuildingTIV row: 1 is a <class 'str'> instead of a <class 'float'> in file Loc",
            "column: ContentsTIV row: 1 is a <class 'str'> instead of a <class 'float'> in file Loc",
            "column: BITIV row: 1 is a <class 'str'> instead of a <class 'float'> in file Loc",
            "column: BITIV row: 2 is a <class 'str'> instead of a <class 'float'> in file Loc"
        ]
        self.assertEqual(expected_data, check.log_data)

    def test_pass(self):
        data = pd.DataFrame([
            {
                "PortNumber": 0.32,
                "AccNumber": 5.6,
                "LocNumber": 7.3,
                "CountryCode": 5.5,
                "LocPerilsCovered": 3.3,
                "BuildingTIV": 4.4,
                "ContentsTIV": 6.6,
                "BITIV": 7.7,
                "LocCurrency": 1.1,
            },
            {
                "PortNumber": 0.32,
                "AccNumber": 5.6,
                "LocNumber": 7.3,
                "CountryCode": 5.5,
                "LocPerilsCovered": 3.3,
                "BuildingTIV": 4.4,
                "ContentsTIV": 6.6,
                "BITIV": 7.7,
                "LocCurrency": 1.1,
            },
        ])
        check = CorrectDataTypeCheck(data=data, file=self.file)
        check.run()
        self.assertEqual(['data type checking passed for file: Loc'], check.log_data)


if __name__ == "__main__":
    main()
