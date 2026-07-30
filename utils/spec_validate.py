"""
Validate generated OED JSON spec files against all ods_tools validator checks.

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
from ods_tools.oed.common import DEFAULT_VALIDATION_CONFIG

REPO_ROOT = Path(__file__).parent.parent
DEFAULT_SPEC_DIR = REPO_ROOT / "spec-generated"
EXAMPLES_DIR = REPO_ROOT / "Examples"
DEFAULT_LOC = EXAMPLES_DIR / "property_location.csv"
DEFAULT_ACC = EXAMPLES_DIR / "property_account.csv"
DEFAULT_RI_INFO = EXAMPLES_DIR / "property_reins_info.csv"
DEFAULT_RI_SCOPE = EXAMPLES_DIR / "property_reins_scope.csv"

# Same checks as the default config but collect instead of raise/log
VALIDATION_CONFIG = [{**c, 'on_error': 'return'} for c in DEFAULT_VALIDATION_CONFIG]


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


def test_spec(spec_path, loc=None, acc=None, ri_info=None, ri_scope=None):
    spec_path = Path(spec_path)
    print(f"\n{'=' * 70}\nSpec: {spec_path.name}\n{'=' * 70}")

    kwargs = {k: str(v) for k, v in
              [('location', loc), ('account', acc), ('ri_info', ri_info), ('ri_scope', ri_scope)]
              if v and v.exists()}
    kwargs['oed_schema_info'] = str(spec_path)

    try:
        exposure = OedExposure(**kwargs)
    except Exception as e:
        print(f"[LOAD ERROR] {e}")
        traceback.print_exc()
        return "CRASHED"

    try:
        errors = exposure.check(validation_config=VALIDATION_CONFIG)
    except Exception as e:
        print(f"[CHECK CRASH] {e}")
        traceback.print_exc()
        return "CRASHED"

    if not errors:
        print("[PASS] All checks passed with no issues")
        return "PASS"

    print(f"[WARN] {len(errors)} schema compatibility finding(s):")
    for err in errors:
        print(f"  - {err.get('name', '')} | {err.get('msg', '')[:120]}")
    return "WARN"


def main():
    parser = argparse.ArgumentParser(description="Validate OED JSON spec files using ods_tools validators")
    parser.add_argument("--spec-dir", default=str(DEFAULT_SPEC_DIR), metavar="DIR",
                        help=f"Directory of spec files (default: {DEFAULT_SPEC_DIR.name}/)")
    parser.add_argument("--spec", metavar="TAG_OR_PATH",
                        help="Single spec: tag name (e.g. 3.0.1), filename, or full path")
    parser.add_argument("--piwind", metavar="CONFIG",
                        help="Path to oasislmf_ord.json; overrides --loc/--acc/--ri-info/--ri-scope")
    parser.add_argument("--loc", default=str(DEFAULT_LOC), metavar="CSV", help=f"Location CSV (default: {DEFAULT_LOC.name}; 'none' to omit)")
    parser.add_argument("--acc", default=str(DEFAULT_ACC), metavar="CSV", help=f"Account CSV (default: {DEFAULT_ACC.name}; 'none' to omit)")
    parser.add_argument("--ri-info", default=str(DEFAULT_RI_INFO), metavar="CSV",
                        help=f"RI info CSV (default: {DEFAULT_RI_INFO.name}; 'none' to omit)")
    parser.add_argument("--ri-scope", default=str(DEFAULT_RI_SCOPE), metavar="CSV",
                        help=f"RI scope CSV (default: {DEFAULT_RI_SCOPE.name}; 'none' to omit)")
    args = parser.parse_args()

    spec_dir = Path(args.spec_dir)

    def to_path(val):
        return None if val is None or val.lower() == 'none' else Path(val)

    if args.piwind:
        paths = load_piwind_paths(args.piwind)
        loc, acc, ri_info, ri_scope = paths['loc'], paths['acc'], paths['info'], paths['scope']
        print(f"Using PiWind files from: {args.piwind}")
    else:
        loc, acc, ri_info, ri_scope = to_path(args.loc), to_path(args.acc), to_path(args.ri_info), to_path(args.ri_scope)
        print(f"Using loc:      {loc.name if loc else 'none'}")
        print(f"      acc:      {acc.name if acc else 'none'}")
        print(f"      ri-info:  {ri_info.name if ri_info else 'none'}")
        print(f"      ri-scope: {ri_scope.name if ri_scope else 'none'}")

    if args.spec:
        specs = [resolve_spec(args.spec, spec_dir)]
    else:
        specs = sorted(spec_dir.glob("OpenExposureData_*Spec.json"))
        if not specs:
            print(f"No spec files found in {spec_dir}")
            sys.exit(1)
        print(f"Found {len(specs)} spec files in {spec_dir}")

    results = {spec.name: test_spec(spec, loc=loc, acc=acc, ri_info=ri_info, ri_scope=ri_scope)
               for spec in specs}

    print(f"\n{'=' * 70}\nSummary\n{'=' * 70}")
    for name, status in results.items():
        print(f"  [{status:^7}] {name}")

    if any(s == "CRASHED" for s in results.values()):
        sys.exit(1)


if __name__ == "__main__":
    main()
