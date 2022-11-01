import json
import os
import pathlib

import pandas as pd
from unittest import TestCase
import tempfile

from src.ods.oed import ExposureData, DEFAULT_ODS_SCHEMA_PATH
from src.ods.ods_exception import OdsException

base_test_path = pathlib.Path(__file__).parent

piwind_branch = 'develop'
base_url = f'https://raw.githubusercontent.com/OasisLMF/OasisPiWind/{piwind_branch}/tests/inputs'
input_file_names = {
    "csv": {
        'Acc':        'SourceAccOEDPiWind.csv',
        'Loc':        'SourceLocOEDPiWind10.csv',
        'ReinsInfo':  'SourceReinsInfoOEDPiWind.csv',
        'ReinsScope': 'SourceReinsScopeOEDPiWind.csv',
    },
    "parquet": {
        'Acc':        'SourceAccOEDPiWind.parquet',
        'Loc':        'SourceLocOEDPiWind10.parquet',
        'ReinsInfo':  'SourceReinsInfoOEDPiWind.parquet',
        'ReinsScope': 'SourceReinsScopeOEDPiWind.parquet'
    },
    "currency": {
        'Loc':        'SourceLocOEDPiWind10Currency.csv',
        'LocExp':     'SourceLocOEDPiWind10Currency_expected.csv',
        'roe':        'roe.csv'
    }

}


def _is_non_empty_file(fp):
    #print(f'{fp} not empty: {os.path.getsize(fp) > 0}')
    return os.path.getsize(fp) > 0


class OdsPackageTests(TestCase):
    def test_load_oed_from_config(self):
        config = {'location': base_url + '/SourceLocOEDPiWind.csv',
                  'account': base_url + '/SourceAccOEDPiWind.parquet',
                  'ri_info': {'cur_version_name': 'orig',
                              'sources': {'orig': {'source_type': 'filepath',
                                                   'filepath': base_url + '/SourceReinsInfoOEDPiWind.csv',
                                                   'read_param': {'usecols':['ReinsNumber', 'ReinsLayerNumber', 'ReinsName', 'ReinsPeril',
                                                       'ReinsInceptionDate', 'ReinsExpiryDate', 'CededPercent', 'RiskLimit',
                                                       'RiskAttachment', 'OccLimit', 'OccAttachment', 'PlacedPercent',
                                                       'ReinsCurrency', 'InuringPriority', 'ReinsType', 'RiskLevel', 'OEDVersion']}}}},
                  'ri_scope': base_url + '/SourceReinsScopeOEDPiWind.csv',
        }
        with tempfile.TemporaryDirectory() as tmp_run_dir:
            oed = ExposureData(**config)

            # check csv file are read
            location = oed.location.dataframe
            self.assertTrue(isinstance(location, pd.DataFrame))

            # check parquet file are read
            account = oed.account.dataframe
            self.assertTrue(isinstance(account, pd.DataFrame))

            # check support for multiple file version and read parameter option
            ri_info = oed.ri_info.dataframe
            # we remove 'UseReinsDates' from the column read to check read_param is used
            self.assertTrue('UseReinsDates' not in ri_info.columns)

            # check support for zipped file
            ri_scope = oed.ri_scope.dataframe
            self.assertTrue(isinstance(ri_scope, pd.DataFrame))

            for compression in ['csv', 'parquet', 'zip']:
                oed.location.save(f'oed_test_{compression}',
                                  {'source_type' : 'filepath',
                                   'filepath': os.path.join(tmp_run_dir, 'oed_test', f'location.{compression}')})

            # check you can reload
            oed_json_fp = os.path.join(tmp_run_dir, 'oed_test', 'oed_info.json')
            oed.save_config(oed_json_fp)
            with open(oed_json_fp) as oed_json_file:
                config = json.load(oed_json_file)
                oed2 = ExposureData(**config)
            self.assertTrue(oed.location.dataframe.equals(oed2.location.dataframe))

    def test_load_oed_from_df(self):
        location_df = pd.DataFrame({
            'PortNumber': [1,1],
            'AccNumber' : [1,2],
            'LocNumber' : [1,2],
            'CountryCode' : ['GB', 'FR'],
            'LocPerilsCovered': 'WTC',
            'BuildingTIV': ['1000', '20000'],
            'ContentsTIV': [0,0],
            'BITIV': [0,0],
            'LocCurrency': ['GBP', 'EUR']})

        oed = ExposureData(**{'location': location_df})
        # check PortNumber are converted to str
        self.assertTrue((oed.location.dataframe['PortNumber'] == '1').all())

        # check BuildingTIV converted to float
        self.assertTrue(pd.api.types.is_numeric_dtype(oed.location.dataframe['BuildingTIV']))

    def test_reporting_currency(self):
        config = {
            'location': base_url + '/SourceLocOEDPiWind10Currency.csv',
            'account': base_url + '/SourceAccOEDPiWind.csv',
            'ri_info': base_url + '/SourceReinsInfoOEDPiWind.csv',
            'ri_scope': base_url + '/SourceReinsScopeOEDPiWind.csv',
            'currency_conversion': {
                "currency_conversion_type": "DictBasedCurrencyRates",
                "source_type": "dict",
                "currency_rates": {
                    ('USD', 'GBP'): 0.85,
                    ('USD', 'EUR'): 0.952,
                    ('GBP', 'EUR'): 1.12}
                },
              }
        oed = ExposureData(**config)
        with tempfile.TemporaryDirectory() as tmp_run_dir:
            oed.location.save('copy', os.path.join(tmp_run_dir, 'location.csv'))
            oed.account.save('copy', os.path.join(tmp_run_dir, 'account.csv'))
            oed.ri_info.save('copy', os.path.join(tmp_run_dir, 'ri_info.csv'))
            oed.ri_scope.save('copy', os.path.join(tmp_run_dir, 'ri_scope.csv'))

            config_copy = {
                'location': os.path.join(tmp_run_dir, 'location.csv'),
                'account': os.path.join(tmp_run_dir, 'account.csv'),
                'ri_info': os.path.join(tmp_run_dir, 'ri_info.csv'),
                'ri_scope': os.path.join(tmp_run_dir, 'ri_scope.csv'),
                'currency_conversion': {
                    "currency_conversion_type": "DictBasedCurrencyRates",
                    "source_type": "dict",
                    "currency_rates": {('USD', 'GBP'): 0.85,
                                       ('USD', 'EUR'): 0.952,
                                       ('GBP', 'EUR'): 1.12}
                    },
                'reporting_currency': 'USD',
                }
            oed2 = ExposureData(**config_copy)
            oed.reporting_currency = 'GBP'
            oed.reporting_currency = 'USD'
            pd.testing.assert_frame_equal(oed.location.dataframe,
                                          oed2.location.dataframe)
            pd.testing.assert_frame_equal(oed.account.dataframe,
                                          oed2.account.dataframe)
            pd.testing.assert_frame_equal(oed.ri_info.dataframe,
                                          oed2.ri_info.dataframe)
            pd.testing.assert_frame_equal(oed.ri_scope.dataframe,
                                          oed2.ri_scope.dataframe)
            self.assertTrue((oed.location.dataframe['LocCurrency']=='USD').all())
            # # load portfolio from folder => load the info at specific address, oed_info.json

    def test_convert_to_parquet(self):
        with tempfile.TemporaryDirectory() as tmp_run_dir:
            config = {'location': base_url + '/SourceLocOEDPiWind.csv',
                      'account': base_url + '/SourceAccOEDPiWind.csv',
                      'ri_info': base_url + '/SourceReinsInfoOEDPiWind.csv',
                      'ri_scope': base_url + '/SourceReinsScopeOEDPiWind.csv',
                      }
            with open(pathlib.Path(tmp_run_dir, 'config.json'), 'w') as config_json:
                json.dump(config, config_json)

            ExposureData.convert(config_json=str(pathlib.Path(tmp_run_dir, 'config.json')),
                                 path=pathlib.Path(tmp_run_dir, 'json'),
                                 compression='parquet')
            ExposureData.convert(**config,
                                 path=pathlib.Path(tmp_run_dir, 'direct'),
                                 compression='parquet')

            for folder in ['json', 'direct']:
                for oed_name in ['Loc', 'Acc', 'ReinsInfo', 'ReinsScope']:
                    self.assertTrue(os.path.isfile(pathlib.Path(tmp_run_dir, folder, f'Source{oed_name}OEDPiWind.parquet')))

    def test_validation_raise_exception(self):
        config = {'location': base_url + '/SourceLocOEDPiWind.csv',
                  'account': base_url + '/SourceAccOEDPiWind.csv',
                  'ri_info': base_url + '/SourceReinsInfoOEDPiWind.csv',
                  'ri_scope': base_url + '/SourceReinsScopeOEDPiWind.csv',
                  }
        oed = ExposureData(**config)

        # create invalid data
        oed.location.dataframe['BuildingTIV'][0:5] = -1
        oed.account.dataframe['LayerParticipation'][1:2] = 2
        oed.ri_info.dataframe['ReinsPeril'] = 'FOOBAR'

        self.assertRaises(OdsException, oed.check)

    # load non utf-8 file
    def test_load_non_utf8(self):
        config = {'location': str(pathlib.Path(base_test_path, 'non_utf8_loc.csv'))
                  }
        oed = ExposureData(**config)
        self.assertTrue(oed.location.dataframe['StreetAddress'][0] == 'Ô, Avenue des Champs-Élysées')

    def test_aliases_columns(self):
        location_df = pd.DataFrame({
            'PortNumber': [1, 1],
            'AccNumber': [1, 2],
            'LocNumberAlias': [1, 2],
            'CountryCode': ['GB', 'FR'],
            'LocPerilsCovered': 'WTC',
            'BuildingTIV': ['1000', '20000'],
            'ContentsTIV': [0, 0],
            'BITIV': [0, 0],
            'LocCurrency': ['GBP', 'EUR']})
        with tempfile.TemporaryDirectory() as tmp_run_dir:
            # create a custom schema
            custom_schema_path = pathlib.Path(tmp_run_dir, 'custom_schema.json')
            with open(DEFAULT_ODS_SCHEMA_PATH) as default_schema_file, open(custom_schema_path, 'w') as custom_schema_file:
                default_schema = json.load(default_schema_file)
                default_schema['input_fields']['Loc']['locnumber']['alias'] = 'LocNumberAlias'
                json.dump(default_schema, custom_schema_file)

            ExposureData(**{'location': location_df,
                            'oed_schema_info': custom_schema_path,
                            'check_oed': True})
