"""
This file defines tests around checking data types for columns.
"""
from unittest import TestCase, main

import pandas as pd

from opends.checks.correct_data_type import CorrectDataTypeCheck
from opends.checks.correct_range import CorrectRangeCheck
from opends.components.offending_columns import OffendingColumnsSingleton
from opends.components.template_loader import TemplateLoader
from tests.unit.utils import DIR_PATH, META_DATA_PATH


class TestCorrectRangeCheck(TestCase):

    def setUp(self) -> None:
        self.loader = TemplateLoader(file_path=DIR_PATH)
        self.file = self.loader.files["Loc"]
        self.file_path = META_DATA_PATH + "/spiked_loc.csv"
        self.df = pd.read_csv(self.file_path, index_col=False)
        self.type_check = CorrectDataTypeCheck(data=self.df, file=self.file)
        self.type_check.run()
        self.test = CorrectRangeCheck(data=self.df, file=self.file)

    def tearDown(self) -> None:
        OffendingColumnsSingleton._instances = {}

    def test___init__(self):
        self.assertEqual(['IsTenant'], self.test.offending_columns)

    def test_clean_run(self):
        self.test.run()
        expected_data = [
            'row 4 out of range for column IsTenant in file Loc',
            'row 5 out of range for column Latitude in file Loc'
        ]
        self.assertEqual(expected_data, self.test.log_data)

    def test_out_of_range_run(self):
        self.test.data = pd.read_csv(META_DATA_PATH + "/outranged_loc.csv", index_col=False)
        self.test.run()

        expected_data = [
            'row 4 out of range for column IsTenant in file Loc',
            'row 2 out of range for column CountryCode in file Loc',
            'row 7 out of range for column CountryCode in file Loc',
            'row 3 out of range for column Latitude in file Loc',
            'row 6 out of range for column Latitude in file Loc'
        ]
        self.assertEqual(expected_data, self.test.log_data)


if __name__ == "__main__":
    main()
