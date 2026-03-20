"""
Validate generated OED JSON spec files against all ods_tools validator checks.

All checks run with on_error='return' so nothing raises — issues are collected
and reported without stopping execution.

Usage:
    python spec_validate.py                                    # all specs in spec-generated/, Examples CSVs
    python spec_validate.py --spec-dir spec-generated/        # explicit spec dir
    python spec_validate.py --spec 3.0.1                      # single spec by tag or file path
    python spec_validate.py --piwind /path/to/oasislmf_ord.json
    python spec_validate.py --loc /path/to/loc.csv --acc /path/to/acc.csv
"""
import argparse
import json
import sys
import traceback
from pathlib import Path

from ods_tools.oed import OedExposure

REPO_ROOT = Path(__file__).parent.parent
DEFAULT_SPEC_DIR = REPO_ROOT / "spec-generated"
EXAMPLES_DIR = REPO_ROOT / "Examples"
DEFAULT_LOC = EXAMPLES_DIR / "property_location.csv"
DEFAULT_ACC = EXAMPLES_DIR / "property_account.csv"
DEFAULT_RI_INFO = EXAMPLES_DIR / "property_reins_info.csv"
DEFAULT_RI_SCOPE = EXAMPLES_DIR / "property_reins_scope.csv"

VALIDATION_CONFIG = [
    {'name': 'source_coherence', 'on_error': 'return'},
    {'name': 'required_fields', 'on_error': 'return'},
    {'name': 'unknown_column', 'on_error': 'return'},
    {'name': 'valid_values', 'on_error': 'return'},
    {'name': 'perils', 'on_error': 'return'},
    {'name': 'occupancy_code', 'on_error': 'return'},
    {'name': 'construction_code', 'on_error': 'return'},
    {'name': 'country_and_area_code', 'on_error': 'return'},
    {'name': 'conditional_requirement', 'on_error': 'return'},
    {'name': 'dates', 'on_error': 'return'},
    {'name': 'oedversion_consistency', 'on_error': 'return'},
]

# Result codes
PASS = "PASS"     # loaded and validated with no issues
WARN = "WARN"     # loaded and validated but reported schema incompatibilities (expected for older specs)
CRASHED = "CRASHED"  # failed to load or validator threw an exception


def load_piwind_paths(config_path):
    config_path = Path(config_path)
    with open(config_path) as f:
        cfg = json.load(f)
    base = config_path.parent
    return {
        'loc': base / cfg['oed_location_csv'],
        'acc': base / cfg['oed_accounts_csv'],
        'info': base / cfg['oed_info_csv'] if cfg.get('oed_info_csv') else None,
        'scope': base / cfg['oed_scope_csv'] if cfg.get('oed_scope_csv') else None,
    }


def resolve_spec(spec_arg, spec_dir):
    """Resolve --spec to a file path: tag name (e.g. 3.0.1), filename, or full path."""
    path = Path(spec_arg)
    if path.exists():
        return path
    candidate = spec_dir / f"OpenExposureData_{spec_arg}Spec.json"
    if candidate.exists():
        return candidate
    raise FileNotFoundError(f"Spec not found: {spec_arg} (tried {path} and {candidate})")


def test_spec(spec_path, loc, acc, ri_info=None, ri_scope=None):
    spec_path = Path(spec_path)
    print(f"\n{'=' * 70}")
    print(f"Spec: {spec_path.name}")
    print('=' * 70)

    kwargs = dict(
        location=str(loc),
        account=str(acc),
        oed_schema_info=str(spec_path),
        check_oed=False,
    )
    if ri_info and ri_info.exists():
        kwargs['ri_info'] = str(ri_info)
    if ri_scope and ri_scope.exists():
        kwargs['ri_scope'] = str(ri_scope)

    try:
        exposure = OedExposure(**kwargs)
    except Exception as e:
        print(f"[LOAD ERROR] {e}")
        traceback.print_exc()
        return CRASHED

    try:
        errors = exposure.check(validation_config=VALIDATION_CONFIG)
    except Exception as e:
        print(f"[CHECK CRASH] {e}")
        traceback.print_exc()
        return CRASHED

    if not errors:
        print("[PASS] All checks passed with no issues")
        return PASS

    print(f"[WARN] {len(errors)} schema compatibility finding(s):")
    for err in errors:
        print(f"  - {err.get('name', '')} | {err.get('msg', '')[:120]}")
    return WARN


def main():
    parser = argparse.ArgumentParser(description="Validate OED JSON spec files using ods_tools validators")
    parser.add_argument(
        "--spec-dir", default=str(DEFAULT_SPEC_DIR), metavar="DIR",
        help=f"Directory of spec files to validate (default: {DEFAULT_SPEC_DIR.name}/)",
    )
    parser.add_argument(
        "--spec", metavar="TAG_OR_PATH",
        help="Single spec: tag name (e.g. 3.0.1), filename, or full path",
    )
    parser.add_argument(
        "--piwind", metavar="CONFIG",
        help="Path to oasislmf_ord.json; overrides --loc/--acc/--ri-info/--ri-scope",
    )
    parser.add_argument("--loc", default=str(DEFAULT_LOC), metavar="CSV", help=f"Location CSV (default: {DEFAULT_LOC.name})")
    parser.add_argument("--acc", default=str(DEFAULT_ACC), metavar="CSV", help=f"Account CSV (default: {DEFAULT_ACC.name})")
    parser.add_argument("--ri-info", default=str(DEFAULT_RI_INFO), metavar="CSV", help=f"Reinsurance info CSV (default: {DEFAULT_RI_INFO.name})")
    parser.add_argument("--ri-scope", default=str(DEFAULT_RI_SCOPE), metavar="CSV", help=f"Reinsurance scope CSV (default: {DEFAULT_RI_SCOPE.name})")
    args = parser.parse_args()

    spec_dir = Path(args.spec_dir)

    if args.piwind:
        paths = load_piwind_paths(args.piwind)
        loc = paths['loc']
        acc = paths['acc']
        ri_info = paths['info']
        ri_scope = paths['scope']
        print(f"Using PiWind files from: {args.piwind}")
    else:
        loc = Path(args.loc)
        acc = Path(args.acc)
        ri_info = Path(args.ri_info)
        ri_scope = Path(args.ri_scope)
        print(f"Using loc:      {loc.name}")
        print(f"      acc:      {acc.name}")
        print(f"      ri-info:  {ri_info.name}")
        print(f"      ri-scope: {ri_scope.name}")

    if args.spec:
        specs = [resolve_spec(args.spec, spec_dir)]
    else:
        specs = sorted(spec_dir.glob("OpenExposureData_*Spec.json"))
        if not specs:
            print(f"No spec files found in {spec_dir}")
            sys.exit(1)
        print(f"Found {len(specs)} spec files in {spec_dir}")

    results = {}
    for spec in specs:
        results[spec.name] = test_spec(spec, loc=loc, acc=acc, ri_info=ri_info, ri_scope=ri_scope)

    print(f"\n{'=' * 70}")
    print("Summary")
    print('=' * 70)
    for name, status in results.items():
        print(f"  [{status:^7}] {name}")

    if any(s == CRASHED for s in results.values()):
        sys.exit(1)


if __name__ == "__main__":
    main()
