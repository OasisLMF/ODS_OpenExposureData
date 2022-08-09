"""
This file should house the tests around the DataField class. However, there is no novel implementation around this
class as it is just a data class so tests are not needed. However, if the implementation becomes bespoke then tests will
be needed.
"""
from unittest import main, TestCase

import numpy as np

from opends.components.field import DataField


class TestDataField(TestCase):

    def setUp(self) -> None:
        self.data_field_data = {
            "name": "PortNumber",
            "field_desc": "Portfolio number: used for defining treaty scope in the reinsurance scope file",
            "file_names": [
                "ReinsScope"
            ],
            "required": "CR",
            "sql_data_type": "varchar(20)",
            "python_data_type": "string",
            "allow_blank": "YES",
            "default": None,
            "valid_value_range": "nan",
            "sec_mod": None
        }
        self.test = DataField.from_dict(input_data=self.data_field_data)
        self.test_array = np.array([5, 6, 5, 8, 10, 4, 6, 2, 8, 8])
        self.test_category_array = np.array(["one", "two", "three", "four", "five", "six"])

    def tearDown(self) -> None:
        pass

    def test_min_val(self):
        self.test.min_val = 5
        outcome = self.test.check_range(array=self.test_array)
        self.assertEqual([5, 7], list(outcome))

        self.test.min_val = 0
        outcome = self.test.check_range(array=self.test_array)
        self.assertEqual([], list(outcome))

    def test_max_val(self):
        self.test.min_val = None
        self.test.max_val = 7
        outcome = self.test.check_range(array=self.test_array)
        self.assertEqual([3, 4, 8, 9], list(outcome))

        self.test.min_val = None
        self.test.max_val = 10
        outcome = self.test.check_range(array=self.test_array)
        self.assertEqual([], list(outcome))

    def test_multiple_vals(self):
        self.test.min_val = 5
        self.test.max_val = 7
        outcome = self.test.check_range(array=self.test_array)
        self.assertEqual([3, 4, 5, 7, 8, 9], outcome)

    def test_valid_values_int(self):
        self.test.min_val = None
        self.test.max_val = None
        self.test.valid_values = [5, 6]
        outcome = self.test.check_range(array=self.test_array)
        self.assertEqual([3, 4, 5, 7, 8, 9], outcome)

    def test_valid_category(self):
        self.test.min_val = None
        self.test.max_val = None
        self.test.valid_values = ["one", "three", "six"]
        outcome = self.test.check_range(array=self.test_category_array)
        self.assertEqual([1, 3, 4], outcome)

    def test_no_checks_defined(self):
        self.test.min_val = None
        self.test.max_val = None
        self.test.valid_values = None
        with self.assertRaises(ValueError):
            self.test.check_range(array=self.test_array)

    def test_min_val_individual(self):
        self.test.min_val = 5
        self.test.max_val = None
        self.test.valid_values = None

        self.assertEqual(False, self.test.check_individual_rage(value=4))
        self.assertEqual(True, self.test.check_individual_rage(value=5))
        self.assertEqual(False, self.test.check_individual_rage(value="test"))

    def test_max_val_individual(self):
        self.test.min_val = None
        self.test.max_val = 5
        self.test.valid_values = None

        self.assertEqual(True, self.test.check_individual_rage(value=5))
        self.assertEqual(False, self.test.check_individual_rage(value=6))
        self.assertEqual(False, self.test.check_individual_rage(value="test"))

    def test_multiple_vals_individual(self):
        self.test.min_val = 3
        self.test.max_val = 6
        self.test.valid_values = None

        self.assertEqual(True, self.test.check_individual_rage(value=5))
        self.assertEqual(True, self.test.check_individual_rage(value=6))
        self.assertEqual(True, self.test.check_individual_rage(value=3))

        self.assertEqual(False, self.test.check_individual_rage(value=7))
        self.assertEqual(False, self.test.check_individual_rage(value=2))
        self.assertEqual(False, self.test.check_individual_rage(value="test"))

    def test_check_unsafe_array(self):
        self.test.min_val = 5
        outcome = self.test.check_unsafe_array(array=self.test_array)
        self.assertEqual([5, 7], list(outcome))

        self.test.min_val = 0
        outcome = self.test.check_unsafe_array(array=self.test_array)
        self.assertEqual([], list(outcome))

    def test_clean_peril_array(self):
        test = ['WW1; ORF;QEQ ;WEC', 'WW1', 'WW1']
        outcome = DataField.clean_peril_array(input_array=np.array(test))
        expected_outcome = [['WW1', 'ORF', 'QEQ', 'WEC'], ['WW1'], ['WW1']]
        self.assertEqual(expected_outcome, outcome)


if __name__ == "__main__":
    main()
