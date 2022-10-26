# ODS Tools

## Overview
ODS tools is a python package put in place to support generic use case regarding the reading and writing of ODS file
in accordance with the [ODS schemas](https://github.com/OasisLMF/OpenDataStandards/).

## command line interface
ODS tools provide command line interface to quickly convert oed files:

example :
```
ods_tools convert --location path_to_location_file --path output folder
```
see `ods_tools convert --help` for more option
  
## package usage
### loading exposure data
in order to load oed file we use the concept of source.
A source will define how to retrieve the oed data. For the moment we only support files but other type of
source such as DataBase could be envisaged.
The loading itself support several format such as parquet, csv and all pandas read_csv supported compression
The path to the file can be absolute relative or even an url

config example:
```python
config = {'location': 'SourceLocOEDPiWind.csv', # csv file
          'account': 'SourceAccOEDPiWind.parquet', # parquet file
          'ri_info': {'cur_version_name': 'orig', # passing args to the reader function
                      'sources': {'orig': {'source_type': 'filepath',
                                           'filepath': 'SourceReinsInfoOEDPiWind.csv',
                                           'read_param': {'usecols':['ReinsNumber', 'ReinsLayerNumber', 'ReinsName', 'ReinsPeril',
                                               'ReinsInceptionDate', 'ReinsExpiryDate', 'CededPercent', 'RiskLimit',
                                               'RiskAttachment', 'OccLimit', 'OccAttachment', 'PlacedPercent',
                                               'ReinsCurrency', 'InuringPriority', 'ReinsType', 'RiskLevel', 'OEDVersion']}}}},
          'ri_scope': 'https://raw.githubusercontent.com/OasisLMF/OasisPiWind/master/tests/inputs/SourceReinsScopeOEDPiWind.csv', # url
}
```

### Access Oed File as DataFrame
Once the config is done you can create your ExposureData Object
and access the Dataframe representation of the different sources.
Data Type in the DataFrame will correspond to the type 

```python
import ods_tools
exposure_data = ods_tools.ods.ExposureData(**config)
location = exposure_data.location.dataframe
account = exposure_data.account.dataframe
```

### Saving Change to the oed DataFrame
You can modify the DataFrame and save it as a new version
```python
exposure_data.location.save(version_name='modified version',
                            source='path_to_save_the_file')
```

### OED Validation
Validity of oed files can be checked at loading time with the argument check_oed
```python
exposure_data = ods_tools.ods.ExposureData(check_oed=True, **config)
```
Current validation encompass:
 - required fields
 - unknown column
 - values range
 - peril codes
 - country and area codes
 - construction codes
 - occupancy codes

An OdsException is raised with a message indicating which file is invalid and why.

### Currency Conversion Support
Exposure Data handles the conversion of relevant columns of the oed files to another currency
to do so you will need to provide information on the currency conversion method in the config or after loading

#### DictBasedCurrencyRates
DictBasedCurrencyRates is a solution where all the rate are provided via files and stored internally as a dictionary.

We support csv file (compressed or not) or a parquet file where they will be read as DataFrame.
exemple of currency_conversion_json ("source_type": "parquet" if parquet file is used):
```json
{
    "currency_conversion_type": "DictBasedCurrencyRates",
    "source_type": "csv",
    "file_path": "tests/inputs/roe.csv"
}
```

The expected format is (roe being a float in parquet format):
```
cur_from,cur_to,roe
USD,GBP,0.85
USD,EUR,0.95
GBP,EUR,1.12
```

Rate can also be passed directly in currency_conversion_json
ex:
```json
{
    "currency_conversion_type": "DictBasedCurrencyRates",
    "source_type": "dict",
    "currency_rates": [["USD", "GBP", 0.85],
                       ["USD", "EUR", 0.95],
                       ["GBP", "EUR", 1.12]
                      ]
}
```

When looking for a key pair, DictBasedCurrencyRates check 1st for the key pair (cur1, cur2) then for (cur2, cur1).
So if a Currency pairs is only specified one way (ex: GBP=>EUR) then it is automatically assume that 
roe EUR=>GBP = 1/(roe GPB=>EUR)

if a currency pair is missing ValueError(f"currency pair {(cur_from, cur_to)} is missing") is thrown


#### FxCurrencyRates
OasisLMF let you use the external package [forex-python](https://forex-python.readthedocs.io/en/latest/usage.html)
to perform the conversion. A date may be specified in ISO 8601 format (YYYY-MM-DD)
currency_conversion_json: 
```json
{
  "currency_conversion_type": "FxCurrencyRates",
  "datetime": "2018-10-10"
}
```

those config can be added as a json file path of directly into the oed_config dict
```python
config_with_currency_rate = {
    'location': 'SourceLocOEDPiWind.csv', # csv file
    'currency_conversion': {
        "currency_conversion_type": "DictBasedCurrencyRates",
        "source_type": "dict",
        "currency_rates": {
            ('USD', 'GBP'): 0.85,
            ('USD', 'EUR'): 0.952,
            ('GBP', 'EUR'): 1.12}
        },
    'reporting_currency': 'USD',
    }
```
if reporting_currency is specified in the config, the oed file will be converted on load
It can also be set once the ExposureData object has been created
```python
import ods_tools
exposure_data = ods_tools.ods.ExposureData(**config)
exposure_data.currency_conversion = ods_tools.ods.forex.create_currency_rates(
    {
        "currency_conversion_type": "DictBasedCurrencyRates",
        "source_type": "dict",
        "currency_rates": {
            ('USD', 'GBP'): 0.85,
            ('USD', 'EUR'): 0.952,
            ('GBP', 'EUR'): 1.12}
        }
)
exposure_data.reporting_currency = 'EUR' # this line will trigger currency conversion
```
