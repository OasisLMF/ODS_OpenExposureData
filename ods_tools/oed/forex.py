"""
This package is in charge of converting relevant ods values such as TIV or policy term into other currencies
"""
import datetime
import json
import os
import pandas as pd
from pathlib import Path

from .common import OdsException

try:
    from forex_python.converter import CurrencyRates as BaseFxCurrencyRates
    from forex_python.converter import RatesNotAvailableError

    class FxCurrencyRates(BaseFxCurrencyRates):
        """
        subclass of forex_python.converter.CurrencyRates that allow to set date to retrieve the rate from in the constructor
        """

        def __init__(self, *args, date_obj=None, **kwargs):
            super().__init__(*args, **kwargs)
            self.date_obj = date_obj

        def get_rate(self, base_cur, dest_cur, date_obj=None) -> float:
            """
            get rate from forex for curency pair (base_cur dest_cur)
            Args:
                base_cur (str): currency from
                dest_cur (str): currency to
                date_obj (datetime): if not None get the rate at this datetime instead of the latest forex date

            Returns:
                rate of exchange (float)

            Raises:
                OdsException if rate not found
            """
            if date_obj is None:
                date_obj = self.date_obj
            try:
                return super().get_rate(base_cur, dest_cur, date_obj)
            except RatesNotAvailableError as e:
                raise OdsException("Issue retrieving rate, most probably the forex api is down") from e

except ImportError:
    FxCurrencyRates = None

import logging

logger = logging.getLogger(__name__)

CURRENCY_COLUMN = {'Loc': 'LocCurrency',
                   'Acc': 'AccCurrency',
                   'ReinsInfo': 'ReinsCurrency'}


class DictBasedCurrencyRates:
    """
    Currency converter based on a dictionary of currency pair
    """

    def __init__(self, roe_dict):
        """
        Args:
            roe_dict: dict of currency pair tuple to rate of exchange
        """
        self.roe_dict = roe_dict

    @classmethod
    def from_dataframe(cls, df):
        """
        create DictBasedCurrencyRates from a DataFrame
        Args:
            df (pd.DataFrame): Dataframe with columns 'cur_from', 'cur_to', 'roe'

        Returns:
            DictBasedCurrencyRates
        """
        roe_dict = {}
        for row in df.to_dict(orient='records'):
            roe_dict[(row['cur_from'], row['cur_to'])] = row['roe']
        return cls(roe_dict)

    @classmethod
    def from_list(cls, currency_rates):
        """
        create DictBasedCurrencyRates from a list of (cur_from, cur_to, roe) triplet
        Args:
            currency_rates (list): list of (cur_from, cur_to, roe) triplet

        Returns:
            DictBasedCurrencyRates
        """
        return cls({(cur_from, cur_to): roe for cur_from, cur_to, roe in currency_rates})

    @classmethod
    def from_csv(cls, filepath_or_buffer, df_engine=pd, **kwargs):
        """
        create DictBasedCurrencyRates from csv file
        Args:
            filepath_or_buffer:  the csv file
            df_engine: engine that will read the csv file into a DataFrame
            **kwargs: extra named arg to passes to the read_csv function

        Returns:
            DictBasedCurrencyRates
        """
        if df_engine is None:
            raise Exception("df_engine parameter not specified, you must install pandas"
                            " or pass your DataFrame engine (modin, dask,...)")

        return cls.from_dataframe(df_engine.read_csv(filepath_or_buffer, **kwargs))

    @classmethod
    def from_parquet(cls, filepath_or_buffer, df_engine=pd, **kwargs):
        """
        create DictBasedCurrencyRates from parquet file
        Args:
            filepath_or_buffer: filepath or buffer of the csv file
            df_engine: engine that will read the parquet file into a DataFrame
            **kwargs: extra named arg to passes to the read_parquet function

        Returns:
            DictBasedCurrencyRates
        """
        if df_engine is None:
            raise Exception("df_engine parameter not specified, you must install pandas"
                            " or pass your DataFrame engine (modin, dask,...)")

        return cls.from_dataframe(df_engine.read_parquet(filepath_or_buffer, **kwargs))

    def get_rate(self, cur_from, cur_to):
        """
        get a rate of exchange to convert from cur_from to cur_to
        when currency pair (cur1, cur2) is requested
        it looks first for the pair
        if not found, look for (cur2, cur1) and return the inverse

        Args:
            cur_from (str): currency from
            cur_to (str): currency to

        Returns:
            rate of exchange (float)

        Raises:
            OdsException if currency pair not found
        """
        if (cur_from, cur_to) in self.roe_dict:
            return self.roe_dict[(cur_from, cur_to)]
        elif (cur_to, cur_from) in self.roe_dict:
            return 1. / self.roe_dict[(cur_to, cur_from)]
        else:
            raise OdsException(f"currency pair {(cur_from, cur_to)} is missing")


def create_currency_rates(currency_conversion):
    """
    Create a currency_rates object from currency_conversion dictionary or json file
    support:
        DictBasedCurrencyRates
        CurrencyRates from forex_python
    Args:
        currency_conversion (path_to_json or dict or None) : information to create the currency conversion object

    Returns:
        object implementing get_rate(self, cur_from, cur_to) method
    """

    def get_path(name):
        if Path(currency_conversion[name]).is_absolute():
            return currency_conversion[name]
        else:
            return os.path.join(str(currency_conversion['root_dir']), currency_conversion[name])

    if currency_conversion:
        if isinstance(currency_conversion, str):  # it is a json file
            root_dir = Path(currency_conversion).parents[0]
            with open(currency_conversion, 'r', encoding='utf-8') as f:
                currency_conversion = json.load(f)
            currency_conversion['root_dir'] = root_dir
        else:
            currency_conversion.setdefault('root_dir', Path.cwd())
    else:
        return None

    if currency_conversion.get('currency_conversion_type') == 'DictBasedCurrencyRates':
        if currency_conversion.get("source_type") == 'csv':
            return DictBasedCurrencyRates.from_csv(get_path('file_path'),
                                                   **currency_conversion.get("read_parameters", {}))
        elif currency_conversion.get("source_type") == 'parquet':
            return DictBasedCurrencyRates.from_parquet(get_path('file_path'),
                                                       **currency_conversion.get("read_parameters", {}))
        elif currency_conversion.get("source_type", '').lower() == 'dict':
            return DictBasedCurrencyRates(currency_conversion['currency_rates'])
        else:
            raise OdsException(
                f"Unsupported currency_conversion source type : {currency_conversion.get('source_type')}")
    elif currency_conversion.get('currency_conversion_type') == 'FxCurrencyRates':
        if FxCurrencyRates is None:
            raise OdsException(
                "You must install package forex-python to use builtin_currency_conversion_type FxCurrencyRates")

        _datetime = currency_conversion.get('datetime')
        if _datetime is not None:
            _datetime = datetime.datetime.fromisoformat(_datetime)
        return FxCurrencyRates(date_obj=_datetime, **currency_conversion.get("fx_currency_rates_parameters", {}))

    else:
        raise OdsException(
            f"unsupported currency_conversion_type {currency_conversion.get('currency_conversion_type')}")


def convert_currency(oed_df, oed_type, reporting_currency, currency_rate, oed_schema):
    """
    Convert inplace the columns in currency unit (BuildingTIV, LocNetPremium, LocDed1Building (depending on type),
    LocMinDed1Building, ...) to the reporting_currency
    store the original currency  in OriginCurency, and the rate of exchange in RateOfExchange

    Args:
        oed_df (pd.DataFrame): OED Dataframe (Loc, Acc, ...)
        oed_type (str): type of file (Loc, Acc, ...)
        reporting_currency (str): currency to convert to
        currency_rate: object to get the rate of exchange by calling get_rate(cur_from, cur_to)
        oed_schema (dict): ods_fields dict
    """
    if oed_type not in CURRENCY_COLUMN:
        return

    ods_fields = oed_schema.schema['input_fields'][oed_type]
    column_to_field = oed_schema.column_to_field(oed_df.columns, ods_fields)
    field_to_column = {field_info['Input Field Name']: column for column, field_info in column_to_field.items()}
    currency_col = field_to_column[CURRENCY_COLUMN[oed_type]]

    if 'OriginalCurrency' not in field_to_column:
        oed_df['OriginalCurrency'] = oed_df[currency_col]
        oed_df['RateOfExchange'] = 1.

    transaction_currencies = oed_df[currency_col].unique()

    if set(transaction_currencies) - {reporting_currency}:
        if currency_rate is None:
            raise OdsException(
                f'Currency Convertion needs to be specified in order to convert term to reporting currency {reporting_currency}')

    for orig_cur in transaction_currencies:
        if orig_cur == reporting_currency:
            continue
        rate = currency_rate.get_rate(orig_cur, reporting_currency)

        orig_cur_rows = (oed_df[currency_col] == orig_cur)
        oed_df.loc[orig_cur_rows, 'RateOfExchange'] *= rate
        for field, column in field_to_column.items():
            field_type = ods_fields[field.lower()].get('Back End DB Field Name', '').lower()
            if (field_type in ['tax', 'grosspremium', 'netpremium', 'brokerage', 'extraexpenselimit', 'minded',
                               'maxded']
                    or field.endswith('tiv')):
                row_filter = orig_cur_rows
            elif field_type == 'ded':
                column_type_name = field.replace('ded', 'dedtype')
                row_filter = orig_cur_rows & (oed_df[field_to_column[column_type_name]] == 0)
            elif field_type == 'limit':
                column_type_name = field.replace('limit', 'limittype')
                row_filter = orig_cur_rows & (oed_df[field_to_column[column_type_name]] == 0)
            elif field_type in ['payoutstart', 'payoutend', 'payoutlimit']:
                column_type_name = 'payouttype'
                row_filter = orig_cur_rows & (oed_df[field_to_column[column_type_name]] == 0)
            elif field_type in ['triggerstart', 'triggerend']:
                column_type_name = 'triggertype'
                row_filter = orig_cur_rows & (oed_df[field_to_column[column_type_name]] == 0)
            else:  # not a currency unit column we go to the next one
                continue
            oed_df.loc[row_filter, column] *= rate

    oed_df[currency_col] = reporting_currency
    oed_df[currency_col] = oed_df[currency_col].astype('category')
