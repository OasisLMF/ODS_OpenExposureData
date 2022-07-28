"""
This file defines tests around checking data types for columns.
"""
from unittest import TestCase, main

import pandas as pd

from opends.checks.correct_range import CorrectRangeCheck
from opends.checks.correct_data_type import CorrectDataTypeCheck
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
        self.test = CorrectRangeCheck(data=self.df, file=self.file, offending_columns=self.type_check.offending_columns)

    def tearDown(self) -> None:
        pass

    def test___init__(self):
        self.assertEqual(['IsTenant'], self.test.offending_columns)

    def test__check_range(self):
        self.test.run()


if __name__ == "__main__":
    main()
