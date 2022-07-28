"""
This file should house the tests around the DataField class. However, there is no novel implementation around this
class as it is just a data class so tests are not needed. However, if the implementation becomes bespoke then tests will
be needed.
"""
from unittest import main, TestCase
from unittest.mock import patch
import numpy as np
from opends.components.field import DataField


class TestDataField(TestCase):

    # @patch("opends.components.field.DataField.__init__")
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

    def tearDown(self) -> None:
        pass

    def test_check_range(self):
        test_array = [5, 6, 5, 8, 10, 4, 6, 2, 8, 8]

        self.test.min_val = 5
        outcome = self.test.check_range(array=np.array(test_array))
        self.assertEqual([5, 7], list(outcome))

        self.test.min_val = 0
        outcome = self.test.check_range(array=np.array(test_array))
        self.assertEqual([], list(outcome))

        self.test.min_val = None
        self.test.max_val = 7
        outcome = self.test.check_range(array=np.array(test_array))
        self.assertEqual([3, 4, 8, 9], list(outcome))

        self.test.min_val = None
        self.test.max_val = 10
        outcome = self.test.check_range(array=np.array(test_array))
        self.assertEqual([], list(outcome))

        self.test.min_val = 5
        self.test.max_val = 7
        outcome = self.test.check_range(array=np.array(test_array))
        self.assertEqual([3, 4, 5, 7, 8, 9], outcome)

        self.test.min_val = None
        self.test.max_val = None
        self.test.valid_values = [5, 6]
        outcome = self.test.check_range(array=np.array(test_array))
        self.assertEqual([3, 4, 5, 7, 8, 9], outcome)

        self.test.valid_values = ["one", "three", "six"]
        outcome = self.test.check_range(array=np.array(["one", "two", "three", "four", "five", "six"]))
        self.assertEqual([1, 3, 4], outcome)

        self.test.valid_values = None
        with self.assertRaises(ValueError):
            self.test.check_range(array=np.array(test_array))


if __name__ == "__main__":
    main()
