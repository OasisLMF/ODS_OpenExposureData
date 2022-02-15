import os
import pandas as pd
import pyarrow
import requests
from unittest import TestCase

from ..oed import (
    read_csv,
    read_parquet,
    get_ods_fields,
    parquet_to_csv,
    csv_to_parquet,
)


piwind_branch = 'master'
base_url = f'https://raw.githubusercontent.com/OasisLMF/OasisPiWind/{piwind_branch}/tests/inputs'
input_file_names = {
    "csv": {
        'Acc':        'SourceAccOEDPiWind.csv',
        'Loc':        'SourceLocOEDPiWind10.csv',
        'ReinsInfo':  'SourceReinsInfoOEDPiWind.csv',
        'ReinsScope': 'SourceReinsScopeOEDPiWind.csv'
    },
    "parquet": {
        'Acc':        'SourceAccOEDPiWind.parquet',
        'Loc':        'SourceLocOEDPiWind10.parquet',
        'ReinsInfo':  'SourceReinsInfoOEDPiWind.parquet',
        'ReinsScope': 'SourceReinsScopeOEDPiWind.parquet'
    }
}

def _is_non_empty_file(fp):
    #print(f'{fp} not empty: {os.path.getsize(fp) > 0}')
    return os.path.getsize(fp) > 0

class OdsPackageTests(TestCase):

    def setUp(self):
        # Load OED Spec
        self.ods_fields = get_ods_fields(pd)

        # download piwind example files
        for file_format in input_file_names:
            for oed_file in input_file_names[file_format]:
                filename = input_file_names[file_format][oed_file]
                url = f'{base_url}/{filename}'
                r = requests.get(url, allow_redirects=True)
                with open(filename, 'wb') as local_oed_file:
                    local_oed_file.write(r.content)

    def tearDown(self):
        # Remove example files
        for file_format in input_file_names:
            for oed_file in input_file_names[file_format]:
                filename = input_file_names[file_format][oed_file]
                os.remove(filename)


    def test_get_ods_fields(self):
        self.assertTrue(isinstance(self.ods_fields,dict))
        for oed_type in ['Acc', 'Loc', 'ReinsInfo', 'ReinsScope']:
            self.assertTrue(oed_type in self.ods_fields)
            self.assertTrue(isinstance(self.ods_fields[oed_type], dict))

    def test_read_csv(self):
        for oed_type in input_file_names['csv']:
            filename = input_file_names['csv'][oed_type]
            output_df = read_csv(filename, df_engine=pd, file_type=oed_type)
            self.assertTrue(
                set(output_df.columns).issubset(set(self.ods_fields[oed_type].keys()))
            )

    def test_read_parquet(self):
        for oed_type in input_file_names['parquet']:
            filename = input_file_names['parquet'][oed_type]
            output_df = read_parquet(filename, df_engine=pd)
            self.assertTrue(
                set(output_df.columns).issubset(set(self.ods_fields[oed_type].keys()))
            )

    def test_csv_to_parquet(self):
        for oed_type in input_file_names['csv']:
            in_f = input_file_names['csv'][oed_type]
            out_f = f'new_{oed_type}.parquet'
            csv_to_parquet(csv_fp=in_f, parquet_fp=out_f, file_type=oed_type)
            self.assertTrue(_is_non_empty_file(out_f))
            os.remove(out_f)


    def test_parquet_to_csv(self):
        for oed_type in input_file_names['parquet']:
            in_f = input_file_names['parquet'][oed_type]
            out_f = f'new_{oed_type}.csv'
            parquet_to_csv(parquet_fp=in_f, csv_fp=out_f)
            self.assertTrue(_is_non_empty_file(out_f))
            os.remove(out_f)

