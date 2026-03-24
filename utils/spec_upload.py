"""
Upload generated OED JSON spec files to GitHub releases.

For each spec file found in the source directory:
  - If the release exists and already has the asset  -> overwrites it (--clobber)
  - If the release exists but has no asset           -> uploads as new asset
  - If no release exists for the tag                 -> creates a minimal release and uploads

A full plan is printed and confirmation is required before any changes are made.
Use --dry-run to inspect the plan without being prompted.

Usage:
    python spec_upload.py --dry-run
    python spec_upload.py
    python spec_upload.py --yes
    python spec_upload.py --source spec-generated/ --tag 3.0.1
    GITHUB_TOKEN=ghp_... python spec_upload.py
"""
import argparse
import json
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ODS_REPO = "OasisLMF/ODS_OpenExposureData"
ASSET_NAME = "OpenExposureData_Spec.json"  # fixed name used in existing releases
DEFAULT_SOURCE = Path(__file__).parent.parent / "spec-generated"

# Actions (for plan display and execution)
OVERWRITE = "OVERWRITE"   # release exists, asset exists -> replace
ADD = "ADD"         # release exists, no asset    -> add
CREATE = "CREATE"      # no release at all           -> create release + upload


def run(cmd, check=True, capture=True):
    return subprocess.run(cmd, capture_output=capture, text=True, check=check)


def get_releases():
    """Return dict of {tag: {asset_name: asset_id, ...}} for all releases in the repo."""
    result = run(["gh", "api", f"repos/{ODS_REPO}/releases?per_page=100"])
    releases = json.loads(result.stdout)
    out = {}
    for r in releases:
        out[r["tag_name"]] = {a["name"]: a["id"] for a in r.get("assets", [])}
    return out


def tag_from_filename(filename):
    """Extract tag from OpenExposureData_<tag>Spec.json."""
    m = re.match(r"OpenExposureData_(.+)Spec\.json$", filename)
    return m.group(1) if m else None


def build_plan(spec_files, releases):
    """Return list of (action, tag, path) tuples."""
    plan = []
    for path in sorted(spec_files):
        tag = tag_from_filename(path.name)
        if not tag:
            continue
        if tag not in releases:
            plan.append((CREATE, tag, path))
        elif ASSET_NAME in releases[tag]:
            plan.append((OVERWRITE, tag, path))
        else:
            plan.append((ADD, tag, path))
    return plan


def print_plan(plan):
    action_labels = {
        CREATE: "CREATE release + upload",
        ADD: "ADD asset to existing release",
        OVERWRITE: "OVERWRITE existing asset",
    }
    print(f"\nPlan: {len(plan)} spec file(s) -> repo {ODS_REPO}\n")
    for action, tag, path in plan:
        print(f"  [{action:9}] {tag:12}  {path.name}")
    print()


def execute_plan(plan):
    ok, failed = [], []
    for action, tag, path in plan:
        print(f"  [{action:9}] {tag} ...", end=" ", flush=True)
        try:
            with tempfile.TemporaryDirectory() as tmpdir:
                tmp_path = str(Path(tmpdir) / ASSET_NAME)
                shutil.copy2(path, tmp_path)
                if action == OVERWRITE:
                    run(["gh", "release", "upload", tag, tmp_path,
                         "--repo", ODS_REPO, "--clobber"])
                elif action == ADD:
                    run(["gh", "release", "upload", tag, tmp_path,
                         "--repo", ODS_REPO])
                elif action == CREATE:
                    run(["gh", "release", "create", tag, tmp_path,
                         "--repo", ODS_REPO,
                         "--title", tag,
                         "--notes", f"OED spec for version {tag}.",
                         "--latest=false"])
            print("OK")
            ok.append(tag)
        except subprocess.CalledProcessError as e:
            print(f"FAILED\n    {e.stderr.strip()}")
            failed.append(tag)

    print(f"\nDone: {len(ok)} ok, {len(failed)} failed")
    if failed:
        print(f"Failed: {failed}")
    return len(failed) == 0


def main():
    parser = argparse.ArgumentParser(description="Upload generated OED spec files to GitHub releases")
    parser.add_argument("--source", default=str(DEFAULT_SOURCE), metavar="DIR",
                        help=f"Directory of spec files to upload (default: {DEFAULT_SOURCE.name}/)")
    parser.add_argument("--tag", metavar="TAG",
                        help="Upload a single tag only (e.g. 3.0.1)")
    parser.add_argument("--dry-run", action="store_true",
                        help="Show the plan without uploading anything")
    parser.add_argument("--yes", "-y", action="store_true",
                        help="Skip confirmation prompt")
    args = parser.parse_args()

    source_dir = Path(args.source)
    if not source_dir.is_dir():
        print(f"Source directory not found: {source_dir}")
        sys.exit(1)

    if args.tag:
        spec_files = [source_dir / f"OpenExposureData_{args.tag}Spec.json"]
        missing = [f for f in spec_files if not f.exists()]
        if missing:
            print(f"Spec file not found: {missing[0]}")
            sys.exit(1)
    else:
        spec_files = sorted(source_dir.glob("OpenExposureData_*Spec.json"))
        if not spec_files:
            print(f"No spec files found in {source_dir}")
            sys.exit(1)

    print(f"Fetching current releases from {ODS_REPO} ...")
    releases = get_releases()
    print(f"Found {len(releases)} existing releases.")

    plan = build_plan(spec_files, releases)
    if not plan:
        print("Nothing to do.")
        return

    print_plan(plan)

    overwrites = [tag for action, tag, _ in plan if action == OVERWRITE]
    creates = [tag for action, tag, _ in plan if action == CREATE]

    if overwrites:
        print(f"WARNING: {len(overwrites)} existing release asset(s) will be replaced:")
        for tag in overwrites:
            print(f"  - {tag}")
        print()
    if creates:
        print(f"WARNING: {len(creates)} new GitHub release(s) will be created:")
        for tag in creates:
            print(f"  - {tag}")
        print()

    if args.dry_run:
        print("Dry run — no changes made.")
        return

    if not args.yes:
        try:
            answer = input("Proceed? [y/N] ").strip().lower()
        except (EOFError, KeyboardInterrupt):
            print("\nAborted.")
            sys.exit(1)
        if answer != "y":
            print("Aborted.")
            sys.exit(1)

    print()
    if not execute_plan(plan):
        sys.exit(1)


if __name__ == "__main__":
    main()
