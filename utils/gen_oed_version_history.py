import sys
import pandas as pd

version_number = sys.argv[1]

version_history_fp = '../OpenExposureData/OEDInputFieldsVersionHistory.csv'
version_latest_fp = '../OpenExposureData/OEDInputFields.csv'

df_history = pd.read_csv(version_history_fp)
df_latest = pd.read_csv(version_latest_fp)

df_latest['version_number'] = version_number

df_updated = pd.concat([df_history,df_latest])

df_updated.to_csv(version_history_fp,index=False)
