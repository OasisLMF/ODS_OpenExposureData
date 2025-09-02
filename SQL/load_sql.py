import pandas as pd
from sqlalchemy import create_engine, text


df_loc = pd.read_csv('SQL_Scripts/SourceFiles/location.csv').head(10)

connection_string = (
    "mssql+pyodbc://sa:password@localhost:1433/OED?"
    "driver=ODBC+Driver+18+for+SQL+Server&TrustServerCertificate=yes"
)

engine = create_engine(connection_string)

df_loc.to_sql(
    name='_staging_location',      # Table name
    con=engine,
    if_exists='replace',      # replace, append, or fail
    index=False,              # Don't include pandas index
    method='multi'            # Faster bulk insert
)


df_acc = pd.read_csv('SQL_Scripts/SourceFiles/account.csv')

df_acc.to_sql(
    name='_staging_account',      # Table name
    con=engine,
    if_exists='replace',      # replace, append, or fail
    index=False,              # Don't include pandas index
    method='multi'            # Faster bulk insert
)

with engine.connect() as conn:
    result = conn.execute(text("EXEC usp_Database_Load"))
    result
