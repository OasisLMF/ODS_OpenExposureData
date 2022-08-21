from unittest import TestCase, main
from unittest.mock import MagicMock

import pandas as pd

from opends.checks.cross_checks.consistent_values import ConsistentValuesCheck


class TestConsistentValuesCheck(TestCase):

    def setUp(self) -> None:
        left_file = MagicMock()
        right_file = MagicMock()
        left_file.name = "left file"
        right_file.name = "right file"

        self.test = ConsistentValuesCheck(
            left_data=pd.DataFrame(LEFT_DATA),
            left_file=left_file,
            right_data=pd.DataFrame(RIGHT_DATA),
            right_file=right_file,
            column_name="test"
        )
        self.expected_data = ['consistent values for test column for files left file and '
                              'right file check passed for file left file']

    def tearDown(self) -> None:
        pass

    def test_fail_number(self):
        expected_data = ["row 2 for column one is not consistent across files left file and right file"]
        self.test.column_name = "one"
        self.test.run()

        self.assertEqual(False, self.test.passed)
        self.assertEqual(expected_data, self.test.log_data)

    def test_pass_number(self):
        self.test.column_name = "two"
        self.test.run()

        self.assertEqual(True, self.test.passed)
        self.assertEqual(self.expected_data, self.test.log_data)

    def test_fail_string(self):
        expected_data = ['row 1 for column three is not consistent across files left file and right file']
        self.test.column_name = "three"
        self.test.run()

        self.assertEqual(False, self.test.passed)
        self.assertEqual(expected_data, self.test.log_data)

    def test_pass_string(self):
        self.test.column_name = "four"
        self.test.run()

        self.assertEqual(True, self.test.passed)
        self.assertEqual(self.expected_data, self.test.log_data)

    def test_fail_different_type(self):
        expected_data = [
            'row 0 for column five is not consistent across files left file and right file',
            'row 1 for column five is not consistent across files left file and right file',
            'row 2 for column five is not consistent across files left file and right file',
            'row 3 for column five is not consistent across files left file and right file'
        ]
        self.test.column_name = "five"
        self.test.run()

        self.assertEqual(False, self.test.passed)
        self.assertEqual(expected_data, self.test.log_data)


LEFT_DATA = [
    {"one": 1, "two": 2, "three": "3", "four": "4", "five": "5"},
    {"one": 2, "two": 3, "three": "4", "four": "5", "five": "6"},
    {"one": 3, "two": 4, "three": "5", "four": "6", "five": "7"},
    {"one": 4, "two": 5, "three": "6", "four": "7", "five": "8"},
]

RIGHT_DATA = [
    {"one": 1, "two": 2, "three": "3", "four": "4", "five": 5},
    {"one": 2, "two": 3, "three": "10", "four": "5", "five": 6},
    {"one": 10, "two": 4, "three": "5", "four": "6", "five": 7},
    {"one": 4, "two": 5, "three": "6", "four": "7", "five": 8},
]


if __name__ == "__main__":
    main()
