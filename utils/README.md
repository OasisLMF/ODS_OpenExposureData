# OED Spec Utilities

Scripts for generating, downloading, and comparing OED JSON spec files across all tagged releases.

## Scripts

| Script | Purpose |
|---|---|
| `spec_download.py` | Download published spec assets from GitHub releases |
| `spec_generate.py` | Generate spec files from git tag source (Excel or CSV) |
| `spec_compare.py` | Semantically compare two sets of spec files |
| `spec_validate.py` | Validate generated specs through all `ods_tools` validator checks |
| `spec_upload.py` | Upload generated spec files to GitHub releases |

Output directories (`spec-downloaded/` and `spec-generated/`) are gitignored.

## Requirements

Install script dependencies from `utils/requirements.in`:

```bash
pip install -r utils/requirements.in
```

`spec_validate.py` additionally requires `ods_tools`:

```bash
pip install ods_tools
# or, for development (from a local clone of ODS_Tools):
pip install -e /path/to/ODS_Tools
```

## Workflow

### 1. Download published specs from GitHub releases

```bash
python utils/spec_download.py
```

Downloads all available release assets into `spec-downloaded/`. Tags without a release asset (pre-3.0.0) are skipped — this is expected, as those versions pre-date the JSON spec format.

`GITHUB_TOKEN` is optional; only needed if you hit the unauthenticated API rate limit (60 req/hour), e.g. when running repeatedly in CI:

```bash
GITHUB_TOKEN=ghp_... python utils/spec_download.py
```

### 2. Generate specs from git tags

```bash
python utils/spec_generate.py --all
```

Generates specs for every tag into `spec-generated/` by reading source files directly from the git tree (no checkout required):

- **>= 4.0.0** — CSVs + `gen-json.py` from the tagged commit
- **< 4.0.0** — Excel file from the tagged commit, processed via `extract_spec.py`

To generate a single tag:

```bash
python utils/spec_generate.py --tag 3.0.1
python utils/spec_generate.py --tag 4.0.0 --output /path/to/output.json
```

### 3. Compare downloaded vs generated

```bash
python utils/spec_compare.py
```

With no arguments, compares `spec-downloaded/` against `spec-generated/`. Comparison is order-insensitive (list values are sorted before diffing, so non-deterministic ordering in `cr_field` is not flagged as a difference).

Output per file:

- `[MATCH  ]` — semantically identical
- `[DIFFER ]` — differs, with the differing top-level keys listed below
- `[ONLY-A ]` / `[ONLY-B ]` — file only exists in one directory

To compare specific directories or individual files:

```bash
python utils/spec_compare.py --dir-a spec-downloaded/ --dir-b spec-generated/
python utils/spec_compare.py spec-downloaded/OpenExposureData_4.0.0Spec.json spec-generated/OpenExposureData_4.0.0Spec.json
```

### 4. Validate generated specs

```bash
python utils/spec_validate.py
```

Runs all generated specs in `spec-generated/` through every `ods_tools` validator check. Requires `ods_tools` to be installed. Defaults to the `Examples/` property CSVs from this repo:

- `property_location.csv`
- `property_account.csv`
- `property_reins_info.csv`
- `property_reins_scope.csv`

Summary result per spec:

- `[ PASS  ]` — loaded and validated with no issues
- `[ WARN  ]` — loaded and validated, but reported schema compatibility findings (expected for older specs that predate newer fields)
- `[CRASHED]` — failed to load or validator threw an exception (exits with code 1)

To validate a single spec by tag name:

```bash
python utils/spec_validate.py --spec 3.0.1
```

To override individual input files:

```bash
python utils/spec_validate.py --loc /path/to/loc.csv --acc /path/to/acc.csv --ri-info /path/to/ri_info.csv --ri-scope /path/to/ri_scope.csv
```

To validate against PiWind test files instead of Examples (overrides all input file args):

```bash
python utils/spec_validate.py --piwind /path/to/OasisPiWind/oasislmf_ord.json
```

### 5. Upload generated specs to GitHub releases

```bash
python utils/spec_upload.py --dry-run
```

Prints a full plan of what will happen for each spec file, then exits without making any changes. Review the plan before proceeding.

```bash
python utils/spec_upload.py
```

Prints the plan, then prompts for confirmation before uploading. Per tag:

- **OVERWRITE** — release exists and already has the asset; replaces it (`--clobber`)
- **ADD** — release exists but has no asset; uploads as a new asset
- **CREATE** — no release exists for this tag; creates a minimal release and uploads

Requires the `gh` CLI to be installed and authenticated (`gh auth login`).

To upload a single tag:

```bash
python utils/spec_upload.py --tag 3.0.1
```

To skip the confirmation prompt:

```bash
python utils/spec_upload.py --yes
```
