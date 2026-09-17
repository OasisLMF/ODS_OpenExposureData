"""
Round-trip load tests for OED validation cases.

Each parametrised test:
  1. Loads the case's CSV files into staging tables.
  2. Runs usp_Database_Load (which clears and re-populates all normalised tables).
  3. Asserts the normalised row counts are consistent with the source CSVs.
  4. Runs a second load to verify idempotency (same counts, no PK violations).

Run with:
    OED_DB_PASSWORD=<pw> pytest SQL/tests/ -v
"""

import pandas as pd
import pytest
from pathlib import Path
from sqlalchemy import text

from .conftest import VALIDATION_DIR, TEST_CASES


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def _load_case(case_dir: Path, engine):
    """Push CSVs into staging tables and execute usp_Database_Load."""
    df_loc = pd.read_csv(case_dir / 'location.csv')
    df_acc = pd.read_csv(case_dir / 'account.csv')

    df_loc.to_sql('_staging_location', engine, if_exists='replace', index=False)
    df_acc.to_sql('_staging_account',  engine, if_exists='replace', index=False)

    ri_info_path = case_dir / 'ri_info.csv'
    if ri_info_path.exists():
        pd.read_csv(ri_info_path).to_sql(
            '_staging_riinfo', engine, if_exists='replace', index=False)
        pd.read_csv(case_dir / 'ri_scope.csv').to_sql(
            '_staging_riscope', engine, if_exists='replace', index=False)
    else:
        # Keep schema-defined staging tables but empty them so the RI load
        # procedures insert zero rows without error.
        with engine.begin() as conn:
            conn.execute(text('TRUNCATE TABLE _staging_riinfo'))
            conn.execute(text('TRUNCATE TABLE _staging_riscope'))

    with engine.begin() as conn:
        result = conn.execute(text('EXEC usp_Database_Load'))
        return list(result), df_loc, df_acc


def _counts(engine) -> dict:
    """Return row counts for key normalised tables."""
    tables = [
        'Portfolio', 'Account', 'Policy', 'Location', 'Coverage', 'Item',
        'Term', 'ItemTerm', 'ReinsInfo', 'ReinsScope', 'ReinsScopeLink',
        'StepPolicy',
    ]
    with engine.connect() as conn:
        return {
            t: conn.execute(text(f'SELECT COUNT(*) FROM {t}')).scalar()
            for t in tables
        }


# ---------------------------------------------------------------------------
# Tests
# ---------------------------------------------------------------------------

@pytest.mark.parametrize('case', TEST_CASES)
def test_load_completes(case, engine):
    """usp_Database_Load must return 'Done' for every validation case."""
    case_dir = VALIDATION_DIR / case
    rows, _, _ = _load_case(case_dir, engine)
    assert rows == [('Done',)], f"Unexpected result: {rows}"


@pytest.mark.parametrize('case', TEST_CASES)
def test_location_count(case, engine):
    """Distinct locations in normalised table must match distinct rows in source CSV."""
    case_dir = VALIDATION_DIR / case
    _load_case(case_dir, engine)

    df_loc = pd.read_csv(case_dir / 'location.csv')
    expected = df_loc[['PortNumber', 'AccNumber', 'LocNumber']].drop_duplicates().__len__()

    with engine.connect() as conn:
        actual = conn.execute(text('SELECT COUNT(*) FROM Location')).scalar()

    assert actual == expected, (
        f"{case}: expected {expected} locations, got {actual}"
    )


@pytest.mark.parametrize('case', TEST_CASES)
def test_account_count(case, engine):
    """Distinct accounts in normalised table must match distinct rows in source CSV."""
    case_dir = VALIDATION_DIR / case
    _load_case(case_dir, engine)

    df_acc = pd.read_csv(case_dir / 'account.csv')
    expected = df_acc[['PortNumber', 'AccNumber']].drop_duplicates().__len__()

    with engine.connect() as conn:
        actual = conn.execute(text('SELECT COUNT(*) FROM Account')).scalar()

    assert actual == expected, (
        f"{case}: expected {expected} accounts, got {actual}"
    )


@pytest.mark.parametrize('case', TEST_CASES)
def test_ri_loaded_when_present(case, engine):
    """RI cases must have rows in ReinsInfo and ReinsScope; non-RI cases must have none."""
    case_dir = VALIDATION_DIR / case
    _load_case(case_dir, engine)

    has_ri = (case_dir / 'ri_info.csv').exists()
    counts = _counts(engine)

    if has_ri:
        assert counts['ReinsInfo'] > 0,  f"{case}: expected ReinsInfo rows"
        assert counts['ReinsScope'] > 0, f"{case}: expected ReinsScope rows"
    else:
        assert counts['ReinsInfo'] == 0,  f"{case}: unexpected ReinsInfo rows"
        assert counts['ReinsScope'] == 0, f"{case}: unexpected ReinsScope rows"


@pytest.mark.parametrize('case', TEST_CASES)
def test_idempotent(case, engine):
    """Running usp_Database_Load twice must produce identical row counts."""
    case_dir = VALIDATION_DIR / case
    _load_case(case_dir, engine)
    counts_first = _counts(engine)

    _load_case(case_dir, engine)
    counts_second = _counts(engine)

    assert counts_first == counts_second, (
        f"{case}: counts differ between runs:\n"
        f"  first:  {counts_first}\n"
        f"  second: {counts_second}"
    )


@pytest.mark.parametrize('case', [
    c for c in TEST_CASES if 'step' in c
])
def test_step_policy_loaded(case, engine):
    """Step-function cases must populate the StepPolicy table."""
    case_dir = VALIDATION_DIR / case
    _load_case(case_dir, engine)
    counts = _counts(engine)
    assert counts['StepPolicy'] > 0, f"{case}: expected StepPolicy rows"
