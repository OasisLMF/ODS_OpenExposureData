"""
Generate OED JSON spec files from git tags.

Strategy per version:
  >= 4.0.0 : CSV files in git tree -> gen-json.py (from the same tag)
  <  4.0.0 : Excel file in git tree -> extract_spec.py functions (with column normalisation)

Usage:
    python spec_generate.py --list
    python spec_generate.py --tag 3.0.1
    python spec_generate.py --tag 4.0.0 --output /path/to/output.json
    python spec_generate.py --all
    python spec_generate.py --all --output /path/to/dir/
"""
import argparse
import json
import re
import subprocess
import sys
import tempfile
import warnings
import pandas as pd
from pathlib import Path

from packaging.version import parse as parse_version

from extract_spec import (
    get_ods_input_fields, get_ods_perils, get_occupancy,
    get_construction, get_country, get_area, get_cr_field, get_versioning,
)

UTILS_DIR = Path(__file__).parent
REPO_ROOT = UTILS_DIR.parent

XLSX_PATH = "OpenExposureData/Docs/OpenExposureData_Spec.xlsx"
CSV_DIR = "OpenExposureData"
CSV_NAMES = [
    "OEDInputFields.csv", "PerilValues.csv", "PerilsCovered.csv",
    "OccupancyValues.csv", "ConstructionValues.csv", "CountryValues.csv",
    "AreaCodeValues.csv", "OEDCRFieldAppendix.csv", "Versioning.csv",
    "CoverageValues.csv",
]

GEN_JSON_AT_TAG = "utils/gen-json.py"  # path inside the git tree

DEFAULT_OUTPUT_DIR = REPO_ROOT / "spec-generated"


def get_tags():
    result = subprocess.run(["git", "tag"], capture_output=True, text=True, check=True)
    return [t for t in result.stdout.splitlines() if "rc" not in t]


def version_of(tag):
    try:
        return parse_version(tag.lstrip("v"))
    except Exception:
        return parse_version("0")


def _is_nan_key(k):
    """True for float NaN keys (pre-serialisation) and the string 'NaN' (post-deserialisation)."""
    return k != k or k == "NaN"


def clean_spec(schema):
    """Remove junk NaN file-type keys from input_fields (blank File Names in Excel / CSV artifacts)."""
    if "input_fields" in schema:
        schema["input_fields"] = {
            ft: fields
            for ft, fields in schema["input_fields"].items()
            if not _is_nan_key(ft)
        }
    return schema


# ---------------------------------------------------------------------------
# >= 4.0.0: CSV path
# ---------------------------------------------------------------------------

def extract_from_csv(tag, output):
    with tempfile.TemporaryDirectory() as tmp_dir:
        tmp_dir = Path(tmp_dir)

        # Use gen-json.py from the tag itself so output matches CI exactly
        script_result = subprocess.run(
            ["git", "show", f"{tag}:{GEN_JSON_AT_TAG}"], capture_output=True,
        )
        if script_result.returncode != 0:
            raise RuntimeError(f"{GEN_JSON_AT_TAG} not found at tag {tag}")
        gen_json_py = tmp_dir / "gen-json.py"
        gen_json_py.write_bytes(script_result.stdout)

        for csv_name in CSV_NAMES:
            # Versioning.csv is a cumulative historical ledger maintained on main,
            # not a point-in-time snapshot — always use the working tree version.
            if csv_name == "Versioning.csv":
                local_versioning = REPO_ROOT / CSV_DIR / csv_name
                if local_versioning.exists():
                    (tmp_dir / csv_name).write_bytes(local_versioning.read_bytes())
                else:
                    print(f"[WARN]  Versioning.csv not found at {local_versioning}, skipping")
                continue
            result = subprocess.run(
                ["git", "show", f"{tag}:{CSV_DIR}/{csv_name}"],
                capture_output=True,
            )
            if result.returncode == 0:
                (tmp_dir / csv_name).write_bytes(result.stdout)
            else:
                print(f"[WARN]  {csv_name} not found at tag {tag}, skipping")

        result = subprocess.run(
            [sys.executable, str(gen_json_py),
             "--source-csv-dir", str(tmp_dir),
             "--output-path", str(output)],
            capture_output=True, text=True,
        )

    if result.returncode != 0:
        raise RuntimeError(f"gen-json.py failed:\n{result.stderr.strip()}")

    # Re-serialize to 2-space indentation and clean up
    output = Path(output)
    output.write_text(json.dumps(clean_spec(json.loads(output.read_text())), indent=2))


# ---------------------------------------------------------------------------
# < 4.0.0: Excel path
# ---------------------------------------------------------------------------

def normalise_valid_value_range(val):
    """Convert old single-value bracket notation [X] to [X,X] expected by extract_valid_value_range."""
    return re.sub(r'\[(-?[\d.]+)\]', r'[\1,\1]', str(val))


def normalise_input_fields(df):
    """Normalise OED Input Fields sheet for pre-3.x Excel format differences."""
    if "Data Type" not in df.columns:
        df["Data Type"] = "varchar(255)"
    if "Valid value range" not in df.columns:
        df["Valid value range"] = "n/a"
    else:
        df["Valid value range"] = df["Valid value range"].apply(normalise_valid_value_range)
    return df


def normalise_occ_con(df):
    """Normalise Occupancy/Construction sheets for pre-3.x Excel format differences."""
    if "Broad Category" not in df.columns:
        df["Broad Category"] = ""
    return df


def normalise_perils(df):
    """Normalise Peril Values sheet for pre-3.x Excel format differences."""
    if "Peril" not in df.columns:
        df["Peril"] = ""
    if "PerilsCovered" not in df.columns:
        df["PerilsCovered"] = ""
    return df


def normalise_cr_field(df):
    """Normalise CR Field Appendix sheet for pre-3.x Excel format differences."""
    if "Data Type" not in df.columns:
        df["Data Type"] = "varchar(255)"
    return df


def extract_from_excel(tag, output):
    # All pre-4.0.0 tags predate utils/ so we always use the local extract_spec.py
    sys.path.insert(0, str(UTILS_DIR))

    result = subprocess.run(["git", "show", f"{tag}:{XLSX_PATH}"], capture_output=True)
    if result.returncode != 0:
        raise RuntimeError(f"No xlsx found at {XLSX_PATH} for tag {tag}")

    with tempfile.NamedTemporaryFile(suffix=".xlsx", delete=False) as tmp:
        tmp.write(result.stdout)
        tmp_path = Path(tmp.name)

    try:
        def read(sheet):
            return pd.read_excel(
                tmp_path, sheet_name=sheet,
                dtype={"Default": str}, keep_default_na=False, na_values=[],
            )

        with warnings.catch_warnings():
            warnings.simplefilter("ignore", FutureWarning)

            schema = {}
            schema["input_fields"] = get_ods_input_fields(normalise_input_fields(read("OED Input Fields")))
            schema["perils"] = get_ods_perils(normalise_perils(read("Peril Values")))
            schema["occupancy"] = get_occupancy(normalise_occ_con(read("Occupancy Values")))
            schema["construction"] = get_construction(normalise_occ_con(read("Construction Values")))
            schema["country"] = get_country(read("Country Values"))
            schema["area"] = get_area(read("AreaCode Values"))
            schema["cr_field"] = get_cr_field(normalise_cr_field(read("OED CR Field Appendix")))
            try:
                schema["versioning"] = get_versioning(read("Versioning"))
            except Exception:
                schema["versioning"] = {}

        with open(output, "w") as f:
            json.dump(clean_spec(schema), f, indent=2)
    finally:
        tmp_path.unlink(missing_ok=True)


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def run_tag(tag, output):
    ver = version_of(tag)
    try:
        if ver >= parse_version("4.0.0"):
            print(f"[CSV]   {tag} — gen-json.py from git tree")
            extract_from_csv(tag, output)
        else:
            print(f"[Excel] {tag} — extract_spec.py from git tree")
            extract_from_excel(tag, output)
        print(f"        -> {output}")
        return True
    except Exception as e:
        print(f"[ERROR] {tag}: {e}")
        return False


def main():
    parser = argparse.ArgumentParser(description="Generate OED JSON spec files from git tags")
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--list", action="store_true", help="List available tags")
    group.add_argument("--tag", metavar="TAG", help="Generate spec for a single tag")
    group.add_argument("--all", action="store_true", help="Generate specs for all tags")
    parser.add_argument(
        "--output", metavar="PATH", default=str(DEFAULT_OUTPUT_DIR),
        help="Output directory for --all, or file/directory for --tag "
             f"(default: {DEFAULT_OUTPUT_DIR.name}/)",
    )
    args = parser.parse_args()

    if args.list:
        print("\n".join(get_tags()))
        return

    output_path = Path(args.output)

    if args.all:
        output_path.mkdir(parents=True, exist_ok=True)
        tags = get_tags()
        print(f"Generating {len(tags)} tags -> {output_path}/\n")
        ok, failed = [], []
        for tag in tags:
            (ok if run_tag(tag, output_path / f"OpenExposureData_{tag}Spec.json") else failed).append(tag)
        print(f"\nDone: {len(ok)} ok, {len(failed)} failed")
        if failed:
            print(f"Failed: {failed}")
        return

    tag = args.tag
    if output_path.suffix:
        output = output_path           # explicit file path given
    else:
        output_path.mkdir(parents=True, exist_ok=True)
        output = output_path / f"OpenExposureData_{tag}Spec.json"
    if not run_tag(tag, output):
        sys.exit(1)


if __name__ == "__main__":
    main()
