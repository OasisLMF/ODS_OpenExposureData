import pandas as pd
from sqlalchemy import create_engine, text

connection_string = (
    "mssql+pyodbc://sa:password@localhost:1433/OED?"
    "driver=ODBC+Driver+18+for+SQL+Server&TrustServerCertificate=yes"
)

engine = create_engine(connection_string)

# location
df_loc = pd.read_csv('SQL_Scripts/SourceFiles/location.csv')
df_loc.to_sql(
    name='_staging_location',      # Table name
    con=engine,
    if_exists='replace',      # replace, append, or fail
    index=False,              # Don't include pandas index
    method='multi'            # Faster bulk insert
)

# account
df_acc = pd.read_csv('SQL_Scripts/SourceFiles/account.csv')
df_acc.to_sql(
    name='_staging_account',      # Table name
    con=engine,
    if_exists='replace',      # replace, append, or fail
    index=False,              # Don't include pandas index
    method='multi'            # Faster bulk insert
)

# reinsurance info
df_riinfo = pd.read_csv('SQL_Scripts/SourceFiles/ri_info.csv')
df_riinfo.to_sql(
    name='_staging_riinfo',      # Table name
    con=engine,
    if_exists='replace',      # replace, append, or fail
    index=False,              # Don't include pandas index
    method='multi'            # Faster bulk insert
)

# reinsurance scope
df_riscope = pd.read_csv('SQL_Scripts/SourceFiles/ri_scope.csv')
df_riscope.to_sql(
    name='_staging_riscope',      # Table name
    con=engine,
    if_exists='replace',      # replace, append, or fail
    index=False,              # Don't include pandas index
    method='multi'            # Faster bulk insert
)

with engine.connect() as conn:
    result = conn.execute(text("EXEC usp_Database_Load"))
    for row in result:
        print(row)
