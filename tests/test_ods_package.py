import json
import os
import pathlib
import shutil

import sys

import pandas as pd
import numpy as np
from unittest import TestCase
import tempfile

# WORKAROUND - this line to to force an import from the installed ods_tools package
# from `python3.xx/site-packages/ods_tools` instead of the local module
sys.path.append(sys.path.pop(0))

from ods_tools.main import convert
from ods_tools.oed import OedExposure, OedSchema, OdsException

base_test_path = pathlib.Path(__file__).parent

piwind_branch = 'develop'
base_url = f'https://raw.githubusercontent.com/OasisLMF/OasisPiWind/{piwind_branch}/tests/inputs'
input_file_names = {
    "csv": {
        'Acc': 'SourceAccOEDPiWind.csv',
        'Loc': 'SourceLocOEDPiWind10.csv',
        'ReinsInfo': 'SourceReinsInfoOEDPiWind.csv',
        'ReinsScope': 'SourceReinsScopeOEDPiWind.csv',
    },
    "parquet": {
        'Acc': 'SourceAccOEDPiWind.parquet',
        'Loc': 'SourceLocOEDPiWind10.parquet',
        'ReinsInfo': 'SourceReinsInfoOEDPiWind.parquet',
        'ReinsScope': 'SourceReinsScopeOEDPiWind.parquet'
    },
    "currency": {
        'Loc': 'SourceLocOEDPiWind10Currency.csv',
        'LocExp': 'SourceLocOEDPiWind10Currency_expected.csv',
        'roe': 'roe.csv'
    }

}


def _is_non_empty_file(fp):
    # print(f'{fp} not empty: {os.path.getsize(fp) > 0}')
    return os.path.getsize(fp) > 0


class OdsPackageTests(TestCase):
    def test_load_oed_from_config(self):
        config = {'location': base_url + '/SourceLocOEDPiWind.csv',
                  'account': base_url + '/SourceAccOEDPiWind.parquet',
                  'ri_info': {'cur_version_name': 'orig',
                              'sources': {'orig': {'source_type': 'filepath',
                                                   'filepath': base_url + '/SourceReinsInfoOEDPiWind.csv',
                                                   'read_param': {
                                                       'usecols': ['ReinsNumber', 'ReinsLayerNumber', 'ReinsName',
                                                                   'ReinsPeril',
                                                                   'ReinsInceptionDate', 'ReinsExpiryDate',
                                                                   'CededPercent', 'RiskLimit',
                                                                   'RiskAttachment', 'OccLimit', 'OccAttachment',
                                                                   'PlacedPercent',
                                                                   'ReinsCurrency', 'InuringPriority', 'ReinsType',
                                                                   'RiskLevel', 'OEDVersion']}}}},
                  'ri_scope': base_url + '/SourceReinsScopeOEDPiWind.csv',
                  'use_field': True
                  }
        with tempfile.TemporaryDirectory() as tmp_run_dir:
            exposure = OedExposure(**config)

            # check csv file are read
            location = exposure.location.dataframe
            self.assertTrue(isinstance(location, pd.DataFrame))

            # check parquet file are read
            account = exposure.account.dataframe
            self.assertTrue(isinstance(account, pd.DataFrame))

            # check support for multiple file version and read parameter option
            ri_info = exposure.ri_info.dataframe
            # we remove 'UseReinsDates' from the column read to check read_param is used
            self.assertTrue('UseReinsDates' not in ri_info.columns)

            # check support for zipped file
            ri_scope = exposure.ri_scope.dataframe
            self.assertTrue(isinstance(ri_scope, pd.DataFrame))

            for compression in ['csv', 'parquet', 'zip']:
                exposure.location.save(f'oed_test_{compression}',
                                       {'source_type': 'filepath',
                                        'filepath': os.path.join(tmp_run_dir, 'oed_test', f'location.{compression}')})

            # check you can reload
            exposure_json_fp = os.path.join(tmp_run_dir, 'oed_test', OedExposure.DEFAULT_EXPOSURE_CONFIG_NAME)
            exposure.save_config(exposure_json_fp)
            with open(exposure_json_fp) as oed_json_file:
                config = json.load(oed_json_file)
                exposure2 = OedExposure(**config)
            self.assertTrue(exposure.location.dataframe.equals(exposure2.location.dataframe))

    def test_load_oed_from_df(self):
        location_df = pd.DataFrame({
            'PortNumber': [1, 1],
            'AccNumber': [1, 2],
            'LocNumber': [1, 2],
            'CountryCode': ['GB', 'FR'],
            'LocPerilsCovered': 'WTC',
            'BuildingTIV': ['1000', '20000'],
            'ContentsTIV': [0, 0],
            'BITIV': [0, 0],
            'LocCurrency': ['GBP', 'EUR']})

        exposure = OedExposure(**{'location': location_df})
        # check PortNumber are converted to str
        self.assertTrue((exposure.location.dataframe['PortNumber'] == '1').all())

        # check BuildingTIV converted to float
        self.assertTrue(pd.api.types.is_numeric_dtype(exposure.location.dataframe['BuildingTIV']))

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
        exposure = OedExposure(**config)
        with tempfile.TemporaryDirectory() as tmp_run_dir:
            exposure.location.save('copy', os.path.join(tmp_run_dir, 'location.csv'))
            exposure.account.save('copy', os.path.join(tmp_run_dir, 'account.csv'))
            exposure.ri_info.save('copy', os.path.join(tmp_run_dir, 'ri_info.csv'))
            exposure.ri_scope.save('copy', os.path.join(tmp_run_dir, 'ri_scope.csv'))

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
            exposure2 = OedExposure(**config_copy)
            exposure.reporting_currency = 'GBP'
            exposure.reporting_currency = 'USD'
            pd.testing.assert_frame_equal(exposure.location.dataframe,
                                          exposure2.location.dataframe)
            pd.testing.assert_frame_equal(exposure.account.dataframe,
                                          exposure2.account.dataframe)
            pd.testing.assert_frame_equal(exposure.ri_info.dataframe,
                                          exposure2.ri_info.dataframe)
            pd.testing.assert_frame_equal(exposure.ri_scope.dataframe,
                                          exposure2.ri_scope.dataframe)
            self.assertTrue((exposure.location.dataframe['LocCurrency'] == 'USD').all())
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

            convert(config_json=str(pathlib.Path(tmp_run_dir, 'config.json')),
                    output_dir=pathlib.Path(tmp_run_dir, 'json'),
                    compression='parquet')
            convert(**config,
                    output_dir=pathlib.Path(tmp_run_dir, 'direct'),
                    compression='parquet')

            for folder in ['json', 'direct']:
                for oed_name in ['Loc', 'Acc', 'ReinsInfo', 'ReinsScope']:
                    self.assertTrue(
                        os.path.isfile(pathlib.Path(tmp_run_dir, folder, f'Source{oed_name}OEDPiWind.parquet')))

    def test_validation_raise_exception(self):
        config = {'location': base_url + '/SourceLocOEDPiWind.csv',
                  'account': base_url + '/SourceAccOEDPiWind.csv',
                  'ri_info': base_url + '/SourceReinsInfoOEDPiWind.csv',
                  'ri_scope': base_url + '/SourceReinsScopeOEDPiWind.csv',
                  }
        exposure = OedExposure(**config)

        # create invalid data
        exposure.location.dataframe['BuildingTIV'][0:5] = -1
        exposure.account.dataframe['LayerParticipation'][1:2] = 2
        exposure.ri_info.dataframe['ReinsPeril'] = 'FOOBAR'

        self.assertRaises(OdsException, exposure.check)

    # load non utf-8 file
    def test_load_non_utf8(self):
        config = {'location': str(pathlib.Path(base_test_path, 'non_utf8_loc.csv'))
                  }
        exposure = OedExposure(**config)
        self.assertTrue(exposure.location.dataframe['StreetAddress'][0] == 'Ô, Avenue des Champs-Élysées')

    def test_aliases_columns(self):
        location_df = pd.DataFrame({
            'PortNumber': [1, 1],
            'AccNumber': [1, 2],
            'LocNumberAlias': [1, 2],
            'CountryCode': ['GB', 'FR'],
            'LocPerilsCovered': 'WTC',
            'BuildingTIV': ['1000', '20000'],
            'ContentsTIV': [0, 0],
            'LocCurrency': ['GBP', 'EUR']})
        with tempfile.TemporaryDirectory() as tmp_run_dir:
            # create a custom schema to init the test
            custom_schema_path = pathlib.Path(tmp_run_dir, 'custom_schema.json')
            with open(OedSchema.DEFAULT_ODS_SCHEMA_PATH) as default_schema_file, open(custom_schema_path,
                                                                                      'w') as custom_schema_file:
                default_schema = json.load(default_schema_file)
                default_schema['input_fields']['Loc']['locnumber']['alias'] = 'LocNumberAlias'
                json.dump(default_schema, custom_schema_file)

            exposure = OedExposure(**{
                'location': location_df,
                'oed_schema_info': custom_schema_path,
                'use_field': True,
                'check_oed': True})
            pd.testing.assert_series_equal(exposure.location.dataframe['LocNumber'],
                                           location_df['LocNumberAlias'].astype(str).astype('category'),
                                           check_names=False)

    def test_load_exposure_from_different_directory(self):
        """
        Check that exposure loads correctly after it has been moved to another place
        """
        config = {'location': base_url + '/SourceLocOEDPiWind.csv',
                  'account': base_url + '/SourceAccOEDPiWind.csv', }

        with tempfile.TemporaryDirectory() as tmp_save_dir, tempfile.TemporaryDirectory() as tmp_move_dir:
            exposure_save = OedExposure(**config)
            exposure_save.save(pathlib.Path(tmp_save_dir, 'oed'), save_config=True)

            shutil.move(str(pathlib.Path(tmp_save_dir, 'oed')), str(pathlib.Path(tmp_move_dir)))

            exposure_move = OedExposure.from_dir(pathlib.Path(tmp_move_dir, 'oed'))
            pd.testing.assert_frame_equal(exposure_save.location.dataframe, exposure_move.location.dataframe)
            pd.testing.assert_frame_equal(exposure_save.account.dataframe, exposure_move.account.dataframe)


    def test_field_required_allow_blank_are_set_to_default(self):
        original_exposure = OedExposure(**{
            'location': base_url + '/SourceLocOEDPiWind.csv',
            'account': base_url + '/SourceAccOEDPiWind.csv',
            'ri_info': base_url + '/SourceReinsInfoOEDPiWind.csv',
            'ri_scope': base_url + '/SourceReinsScopeOEDPiWind.csv',
            'use_field': True})

        original_exposure.location.dataframe.drop(columns=['ContentsTIV'], inplace=True)
        original_exposure.location.dataframe['BITIV'] = np.nan
        original_exposure.ri_info.dataframe.drop(columns='RiskLevel', inplace=True)

        with tempfile.TemporaryDirectory() as tmp_dir:
            original_exposure.save(pathlib.Path(tmp_dir, 'oed'), save_config=True)
            modified_exposure = OedExposure.from_dir(pathlib.Path(tmp_dir, 'oed'))

            assert (modified_exposure.location.dataframe['ContentsTIV'] == 0).all()  # check column is added with correct value
            assert (modified_exposure.location.dataframe['BITIV'] == 0).all()  # check default is applied
            assert (modified_exposure.ri_info.dataframe['RiskLevel'] == '').all()  # check it works for string
