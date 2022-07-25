"""
This file tests the loading of CSV files with particular types depending on the schema.
"""
from unittest import TestCase, main
from unittest.mock import patch

from opends.components.csv_loader import CsvLoader
from opends.enums import FileNames
from tests.unit.utils import META_DATA_PATH


class TestCsvLoader(TestCase):

    def setUp(self) -> None:
        self.test = CsvLoader(version="2.3.1", data_path=META_DATA_PATH + "/pass_loc.csv", file_type=FileNames.LOC)

    def tearDown(self) -> None:
        pass

    def test__get_types(self):
        self.assertEqual(TYPE_DICT, self.test._get_types())

    @patch("opends.components.csv_loader.CsvLoader._get_types")
    @patch("opends.components.csv_loader.pd.read_csv")
    def test_read(self, mock_read_csv, mock__get_types):
        test = CsvLoader(version="2.3.1", data_path=META_DATA_PATH + "/pass_loc.csv", file_type=FileNames.LOC)
        outcome = test.read()

        self.assertEqual(mock_read_csv.return_value, outcome)
        mock_read_csv.assert_called_once_with(self.test.data_path, dtype=mock__get_types.return_value)


TYPE_DICT = {
    'PortNumber': 'category',
    'AccNumber': 'category',
    'LocNumber': 'category',
    'IsTenant': 'int32',
    'BuildingID': 'category',
    'CountryCode': 'category',
    'Latitude': 'float64',
    'Longitude': 'float64',
    'StreetAddress': 'category',
    'PostalCode': 'category',
    'OccupancyCode': 'int64',
    'ConstructionCode': 'int64',
    'LocPerilsCovered': 'category',
    'BuildingTIV': 'float64',
    'OtherTIV': 'float64',
    'ContentsTIV': 'float64',
    'BITIV': 'float64',
    'LocCurrency': 'category',
    'OEDVersion': 'category'
}


if __name__ == "__main__":
    main()
