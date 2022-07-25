"""
This file tests enums that have exotic functions outside of the standard Enum behavour.
"""
from unittest import main, TestCase

from opends.enums import PandasValue, PythonValueTypes


class TestPythonValueTypes(TestCase):

    def setUp(self) -> None:
        pass

    def tearDown(self) -> None:
        pass

    def test_native_type(self):
        self.assertEqual(int, PythonValueTypes("int").native_type)
        self.assertEqual(float, PythonValueTypes("float").native_type)
        self.assertEqual(str, PythonValueTypes("string").native_type)


class TestPandasValue(TestCase):

    def setUp(self) -> None:
        pass

    def tearDown(self) -> None:
        pass

    def test_pandas_value(self):
        self.assertEqual("float64", PandasValue.from_str(input_str="float").pandas_value)
        self.assertEqual("int64", PandasValue.from_str(input_str="int").pandas_value)
        self.assertEqual("int32", PandasValue.from_str(input_str="tinyint").pandas_value)
        self.assertEqual("category", PandasValue.from_str(input_str="varchar(20)").pandas_value)
        self.assertEqual("category", PandasValue.from_str(input_str="navarchar(200)").pandas_value)


if __name__ == "__name__":
    main()
