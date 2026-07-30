"""
Download OED JSON spec release assets from GitHub for all tags.

Specs are saved as OpenExposureData_<tag>Spec.json in the output directory.
Tags without a release asset (pre-3.0.0) are skipped silently.

Usage:
    python spec_download.py
    python spec_download.py --output spec-downloaded/
    GITHUB_TOKEN=ghp_... python spec_download.py --output spec-downloaded/
"""
import os
import argparse
import json
import urllib.request
from pathlib import Path
from urllib.error import HTTPError

ODS_REPO = "OasisLMF/ODS_OpenExposureData"
FILENAME = "OpenExposureData_{}Spec.json"
BASE_URL = f"https://github.com/{ODS_REPO}/releases/download/"

DEFAULT_OUTPUT = Path(__file__).parent.parent / "spec-downloaded"


def get_all_tags(github_token=None):
    tags = []
    page = 1
    while True:
        api_url = f"https://api.github.com/repos/{ODS_REPO}/tags?per_page=100&page={page}"
        req = urllib.request.Request(api_url)
        if github_token:
            req.add_header("Authorization", f"token {github_token}")
        with urllib.request.urlopen(req) as response:
            data = json.load(response)
        if not data:
            break
        tags.extend([t["name"] for t in data if "rc" not in t["name"]])
        page += 1
    return tags


def main():
    parser = argparse.ArgumentParser(description="Download OED spec release assets from GitHub")
    parser.add_argument("--output", default=str(DEFAULT_OUTPUT),
                        help=f"Output directory (default: {DEFAULT_OUTPUT})")
    args = parser.parse_args()

    github_token = os.environ.get("GITHUB_TOKEN")
    output_dir = Path(args.output)
    output_dir.mkdir(parents=True, exist_ok=True)

    print("Fetching all tags from GitHub...")
    tags = get_all_tags(github_token)
    print(f"Found {len(tags)} tags\n")

    downloaded, skipped = [], []

    for tag in tags:
        url = BASE_URL + f"{tag}/{FILENAME.format('')}"
        out_path = output_dir / FILENAME.format(tag)
        try:
            req = urllib.request.Request(url)
            if github_token:
                req.add_header("Authorization", f"token {github_token}")
            with urllib.request.urlopen(req) as response:
                raw = response.read()
            out_path.write_bytes(raw)
            print(f"[OK]      {tag} -> {out_path.name}")
            downloaded.append(tag)
        except HTTPError as e:
            print(f"[SKIPPED] {tag} (HTTP {e.code})")
            skipped.append(tag)
        except Exception as e:
            print(f"[ERROR]   {tag}: {e}")
            skipped.append(tag)

    print(f"\nSummary: {len(downloaded)} downloaded, {len(skipped)} skipped")


if __name__ == "__main__":
    main()
