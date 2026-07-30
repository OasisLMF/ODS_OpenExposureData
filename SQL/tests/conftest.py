import os
import pytest
from pathlib import Path
from sqlalchemy import create_engine, text

VALIDATION_DIR = Path('/home/benhayes/oasis/git/OasisLMF/validation')

# Top-level test cases: each must have location.csv + account.csv.
# RI cases additionally have ri_info.csv + ri_scope.csv.
TEST_CASES = [
    'insurance',
    'insurance_account',
    'insurance_bi',
    'insurance_conditions',
    'insurance_and_step',
    'insurance_policy_coverage',
    'insurance_step',
    'issue_1816',
    'issue_1953_layerparticipation',
    'issues',
    'perilscovered',
    'reinsurance1',
    'reinsurance2',
    'reinsurance3',
    'reinsurance4',
]


@pytest.fixture(scope='session')
def engine():
    password = os.environ.get('OED_DB_PASSWORD')
    if not password:
        pytest.skip('Set OED_DB_PASSWORD to run DB tests')
    conn_str = (
        f"mssql+pyodbc://sa:{password}@localhost:1433/OED?"
        "driver=ODBC+Driver+18+for+SQL+Server&TrustServerCertificate=yes"
    )
    return create_engine(conn_str, fast_executemany=True)
