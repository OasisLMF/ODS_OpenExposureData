import os
import pandas as pd
from sqlalchemy import create_engine, text

password = os.environ.get('OED_DB_PASSWORD')
if not password:
    raise RuntimeError("Set the OED_DB_PASSWORD environment variable before running")

connection_string = (
    f"mssql+pyodbc://sa:{password}@localhost:1433/OED?"
    "driver=ODBC+Driver+18+for+SQL+Server&TrustServerCertificate=yes"
)

# fast_executemany uses ODBC native batch inserts — no 2100-parameter limit
engine = create_engine(connection_string, fast_executemany=True)
CHUNKSIZE = 10000

# location
df_loc = pd.read_csv('SQL_Scripts/SourceFiles/location.csv')
df_loc.to_sql(name='_staging_location', con=engine, if_exists='replace', index=False, chunksize=CHUNKSIZE)

# account
df_acc = pd.read_csv('SQL_Scripts/SourceFiles/account.csv')

# OED spec requires ISO 8601 (YYYY-MM-DD); normalize in case source files
# use a locale-specific format (e.g. DD/MM/YYYY), which SQL Server would
# otherwise misparse against its default MDY session setting.
for col in ('PolInceptionDate', 'PolExpiryDate'):
    df_acc[col] = pd.to_datetime(df_acc[col], dayfirst=True).dt.strftime('%Y-%m-%d')

df_acc.to_sql(name='_staging_account', con=engine, if_exists='replace', index=False, chunksize=CHUNKSIZE)

# reinsurance info
df_riinfo = pd.read_csv('SQL_Scripts/SourceFiles/ri_info.csv')
df_riinfo.to_sql(name='_staging_riinfo', con=engine, if_exists='replace', index=False, chunksize=CHUNKSIZE)

# reinsurance scope
df_riscope = pd.read_csv('SQL_Scripts/SourceFiles/ri_scope.csv')
df_riscope.to_sql(name='_staging_riscope', con=engine, if_exists='replace', index=False, chunksize=CHUNKSIZE)

# engine.begin() auto-commits on exit, which is required for EXEC to take effect
with engine.begin() as conn:
    result = conn.execute(text("EXEC usp_Database_Load"))
    for row in result:
        print(row)
