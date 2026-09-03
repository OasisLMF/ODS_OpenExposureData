import pandas as pd
from sqlalchemy import create_engine, text

connection_string = (
    "mssql+pyodbc://sa:password@localhost:1433/OED?"
    "driver=ODBC+Driver+18+for+SQL+Server&TrustServerCertificate=yes"
)

# fast_executemany batches inserts at the pyodbc driver level instead of
# building one big multi-row INSERT (method='multi'), which is both faster
# for large files and not bounded by SQL Server's 2100-param-per-statement
# limit, so it scales to OED input files with millions of rows.
engine = create_engine(connection_string, fast_executemany=True)
CHUNKSIZE = 10000

# location
df_loc = pd.read_csv('SQL_Scripts/SourceFiles/location.csv').head(10)
df_loc.to_sql(
    name='_staging_location',      # Table name
    con=engine,
    if_exists='replace',      # replace, append, or fail
    index=False,              # Don't include pandas index
    chunksize=CHUNKSIZE
)

# account
df_acc = pd.read_csv('SQL_Scripts/SourceFiles/account.csv')

# OED spec requires ISO 8601 (YYYY-MM-DD); normalize in case source files
# use a locale-specific format (e.g. DD/MM/YYYY), which SQL Server would
# otherwise misparse against its default MDY session setting.
for col in ('PolInceptionDate', 'PolExpiryDate'):
    df_acc[col] = pd.to_datetime(df_acc[col], dayfirst=True).dt.strftime('%Y-%m-%d')

df_acc.to_sql(
    name='_staging_account',      # Table name
    con=engine,
    if_exists='replace',      # replace, append, or fail
    index=False,              # Don't include pandas index
    chunksize=CHUNKSIZE
)

# reinsurance info
df_riinfo = pd.read_csv('SQL_Scripts/SourceFiles/ri_info.csv')
df_riinfo.to_sql(
    name='_staging_riinfo',      # Table name
    con=engine,
    if_exists='replace',      # replace, append, or fail
    index=False,              # Don't include pandas index
    chunksize=CHUNKSIZE
)

# reinsurance scope
df_riscope = pd.read_csv('SQL_Scripts/SourceFiles/ri_scope.csv')
df_riscope.to_sql(
    name='_staging_riscope',      # Table name
    con=engine,
    if_exists='replace',      # replace, append, or fail
    index=False,              # Don't include pandas index
    chunksize=CHUNKSIZE
)

with engine.begin() as conn:
    result = conn.execute(text("EXEC usp_Database_Load"))
    for row in result:
        print(row)
