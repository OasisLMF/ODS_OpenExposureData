"""
Compare OED JSON spec files for semantic equality (order-insensitive).

All list values are sorted before comparison so that cr_field list ordering
differences (from the non-deterministic set->list conversion in gen-json.py)
are ignored.

Usage:
    python spec_compare.py                                   # spec-downloaded/ vs spec-generated/
    python spec_compare.py --dir-a spec-downloaded/ --dir-b spec-generated/
    python spec_compare.py path/to/a.json path/to/b.json
"""
import argparse
import json
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).parent.parent
DEFAULT_DIR_A = REPO_ROOT / "spec-downloaded"
DEFAULT_DIR_B = REPO_ROOT / "spec-generated"


def normalise(obj):
    """Recursively normalise an object for order-insensitive comparison."""
    if isinstance(obj, dict):
        return {k: normalise(v) for k, v in sorted(obj.items())}
    if isinstance(obj, list):
        items = [normalise(i) for i in obj]
        try:
            return sorted(items)
        except TypeError:
            return sorted(items, key=repr)
    return obj


def compare(path_a, path_b):
    with open(path_a) as f:
        a = json.load(f)
    with open(path_b) as f:
        b = json.load(f)

    na, nb = normalise(a), normalise(b)
    if na == nb:
        return True, []

    diffs = []
    all_keys = set(na) | set(nb)
    for key in sorted(all_keys):
        if key not in na:
            diffs.append(f"  key '{key}' missing from A")
        elif key not in nb:
            diffs.append(f"  key '{key}' missing from B")
        elif na[key] != nb[key]:
            diffs.append(f"  key '{key}' differs")
            if isinstance(na[key], dict) and isinstance(nb[key], dict):
                for subkey in sorted(set(na[key]) | set(nb[key])):
                    if na[key].get(subkey) != nb[key].get(subkey):
                        diffs.append(f"    sub-key '{subkey}' differs")
    return False, diffs


def compare_dirs(dir_a, dir_b):
    specs_a = {p.name: p for p in dir_a.glob("OpenExposureData_*Spec.json")}
    specs_b = {p.name: p for p in dir_b.glob("OpenExposureData_*Spec.json")}
    names = sorted(set(specs_a) | set(specs_b))
    if not names:
        print(f"No spec files found in {dir_a} or {dir_b}.")
        sys.exit(1)
    print(f"Comparing {len(names)} spec files  ({dir_a} vs {dir_b})\n")
    all_ok = True
    for name in names:
        if name not in specs_a:
            print(f"[ONLY-B ] {name}")
            all_ok = False
        elif name not in specs_b:
            print(f"[ONLY-A ] {name}")
            all_ok = False
        else:
            ok, diffs = compare(specs_a[name], specs_b[name])
            if ok:
                print(f"[MATCH  ] {name}")
            else:
                print(f"[DIFFER ] {name}")
                for d in diffs:
                    print(d)
                all_ok = False
    sys.exit(0 if all_ok else 1)


def main():
    parser = argparse.ArgumentParser(
        description="Semantically compare OED JSON spec files (order-insensitive)",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=f"With no arguments, compares {DEFAULT_DIR_A.name}/ vs {DEFAULT_DIR_B.name}/",
    )
    parser.add_argument("files", nargs="*", metavar="FILE",
                        help="Two spec files to compare directly")
    parser.add_argument("--dir-a", metavar="DIR",
                        help=f"Directory A (default: {DEFAULT_DIR_A.name}/)")
    parser.add_argument("--dir-b", metavar="DIR",
                        help=f"Directory B (default: {DEFAULT_DIR_B.name}/)")
    args = parser.parse_args()

    if args.files:
        if len(args.files) != 2:
            parser.error("Provide exactly two files for direct comparison")
        path_a, path_b = Path(args.files[0]), Path(args.files[1])
        ok, diffs = compare(path_a, path_b)
        if ok:
            print(f"MATCH: {path_a.name} == {path_b.name} (order-insensitive)")
        else:
            print(f"DIFFER: {path_a.name} vs {path_b.name}")
            for d in diffs:
                print(d)
        sys.exit(0 if ok else 1)

    dir_a = Path(args.dir_a) if args.dir_a else DEFAULT_DIR_A
    dir_b = Path(args.dir_b) if args.dir_b else DEFAULT_DIR_B
    compare_dirs(dir_a, dir_b)


if __name__ == "__main__":
    main()
