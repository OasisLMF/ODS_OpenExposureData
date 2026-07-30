"""
Export normalised OED data back to flat CSV files.

Reads from the _import_* tables (which hold the cleaned OED flat-file columns
as loaded by usp_SourceTable_Load) and writes location.csv, account.csv, and
optionally ri_info.csv / ri_scope.csv to an output directory.

Usage:
    OED_DB_PASSWORD=<pw> python SQL/export_sql.py [--out-dir OUTPUT_DIR]

The output files can be diff'd against the originals to verify round-trip
fidelity for every column that the schema recognises.
"""

import os
import sys
import argparse
from pathlib import Path

import pandas as pd
from sqlalchemy import create_engine, text


def get_engine():
    password = os.environ.get('OED_DB_PASSWORD')
    if not password:
        sys.exit('Set OED_DB_PASSWORD before running')
    conn_str = (
        f"mssql+pyodbc://sa:{password}@localhost:1433/OED?"
        "driver=ODBC+Driver+18+for+SQL+Server&TrustServerCertificate=yes"
    )
    return create_engine(conn_str, fast_executemany=True)


def export_table(engine, table: str, out_path: Path):
    df = pd.read_sql(f'SELECT * FROM [{table}]', engine)
    if df.empty:
        print(f"  {table}: empty — skipped")
        return 0
    df.to_csv(out_path, index=False)
    print(f"  {table}: {len(df)} rows → {out_path}")
    return len(df)


def main():
    parser = argparse.ArgumentParser(description='Export OED DB to CSV files')
    parser.add_argument('--out-dir', default='SQL/SQL_Scripts/ExportFiles',
                        help='Directory to write exported CSVs (default: SQL/SQL_Scripts/ExportFiles)')
    args = parser.parse_args()

    out_dir = Path(args.out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    engine = get_engine()

    print('Exporting from import tables...')
    export_table(engine, '_import_location', out_dir / 'location.csv')
    export_table(engine, '_import_account',  out_dir / 'account.csv')
    export_table(engine, '_import_riinfo',   out_dir / 'ri_info.csv')
    export_table(engine, '_import_riscope',  out_dir / 'ri_scope.csv')

    print('\nDone.')


if __name__ == '__main__':
    main()
