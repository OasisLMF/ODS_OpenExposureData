"""
This file tests the implementation of the File class and how it is managed in memory using the Flyweight pattern.
"""
from unittest import main, TestCase

from opends.components.file import File, DataField, FileFlyweight


class TestFile(TestCase):

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
        self.data_field = DataField.from_dict(input_data=self.data_field_data)
        self.test = File(name="main test")

    def tearDown(self) -> None:
        FileFlyweight._instances = {}

    def test___init__(self):
        test_one = File(name="test")
        test_two = File("test")
        test_three = File(name="test")
        test_four = File("test")

        tests = [test_one, test_two, test_three, test_four]

        for x in tests:
            for y in tests:
                self.assertEqual(id(x), id(y))

        test_five = File(name="test one")
        test_six = File("test two")
        self.assertNotEqual(id(test_five), id(test_six))

    def test_add_field(self):
        self.assertEqual(0, len(self.test.fields.keys()))
        self.test.add_field(field_data=self.data_field_data)

        self.assertEqual(1, len(self.test.fields.keys()))
        self.assertEqual(self.data_field, self.test.fields[list(self.test.fields.keys())[0]])

    def test_field_names(self):
        self.test.fields = {
            self.data_field.name: self.data_field
        }

        self.assertEqual(None, self.test._field_names)
        self.assertEqual(["PortNumber"], self.test.field_names)
        self.assertEqual(self.test._field_names, self.test.field_names)


if __name__ == "__main__":
    main()
