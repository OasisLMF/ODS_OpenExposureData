"""
This file defines tests around checking data types for columns.
"""
from unittest import TestCase, main

import pandas as pd

from opends.checks.correct_range import CorrectRangeCheck
from opends.checks.correct_data_type import CorrectDataTypeCheck
from opends.components.template_loader import TemplateLoader
from opends.components.offending_columns import OffendingColumnsSingleton
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
<<<<<<< HEAD
        self.assertEqual(['row 5 out of range for column Latitude in file Loc'], self.test.log_data)
=======
        self.assertEqual(['data range checking passed for file: Loc'], self.test.log_data)

    def test_out_of_range_run(self):
        self.test.data = pd.read_csv(META_DATA_PATH + "/outranged_loc.csv", index_col=False)
        self.test.run()

        expected_data = [
            'row 2 in column CountryCode is out of bounds for file Loc',
            'row 7 in column CountryCode is out of bounds for file Loc',
            'row 3 in column Latitude is out of bounds for file Loc',
            'row 6 in column Latitude is out of bounds for file Loc'
        ]
        self.assertEqual(expected_data, self.test.log_data)
>>>>>>> 69503ac1f6c188c1990026dc6d7939c7e4ef9cb5


if __name__ == "__main__":
    main()
