from unittest import TestCase, main

from oed import read_csv
from tests.unit.utils import LOC_PATH, META_DATA_PATH
import pandas as pd
import json


# def read_csv(filepath: str) -> pd.DataFrame:
#     pass


class TestReadCSV(TestCase):

    def test_read_csv(self):
        # print(LOC_PATH)
        df = read_csv(filepath_or_buffer=META_DATA_PATH + "pass_loc.csv")
        with open(META_DATA_PATH + "/oed_schema.json", "r") as file:
            data = json.loads(file.read())
        # print(df)

        self.assertEqual(data, df)


if __name__ == "__main__":
    main()
