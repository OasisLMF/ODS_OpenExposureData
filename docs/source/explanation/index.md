# Explanation

Background on the OED standard — what it is, its file structure and the exposure hierarchy.
Detailed chapters (import format, asset details, geography & perils, financial terms and
reinsurance) are migrated from the standard's specification documents.

## The four input files

OED comprises four input files, designed to let users enter data in a manageable way without
having to understand the relationships between many underlying tables:

- **Location (`Loc`)** — the exposed locations and their coverages, characteristics and
  primary financial terms.
- **Account (`Acc`)** — accounts and policies, including policy-level financial terms and
  special conditions.
- **Reinsurance Info (`ReinsInfo`)** — the reinsurance programme definitions.
- **Reinsurance Scope (`ReinsScope`)** — what each reinsurance contract applies to.

This trades some duplication for practicality. The full field lists are in the
{doc}`field reference <../reference/fields>`.

## The exposure hierarchy

OED follows an organisational and financial hierarchy familiar to catastrophe-model users:

Coverage
: The lowest level — the specific type of cover: **Buildings**, **Other** (e.g. appurtenant
  structures or motor), **Contents**, and **Business Interruption** (time element). Primary
  financial terms can attach at coverage level, across property damage (PD = Buildings +
  Other + Contents), or across all coverages.

Location
: A site — a group of coverages at one place. Primary financial terms and facultative
  reinsurance can attach here. A single location record can represent several buildings
  (`NumberOfBuildings`), and related locations can be linked (`LocGroup`).

Policy
: A financial structure applying to a set of locations. Multiple policies can exist under
  the same account and apply to the same locations (e.g. insurance layers). Within a policy,
  a **special condition** applies sub-limits/sub-deductibles to a subset of locations.
  Reinsurance can attach at policy level.

Account
: Groups policies and locations — you cannot have a policy without a location, or a location
  without a policy. Primary and reinsurance terms can attach here.

Account group
: A grouping of accounts for reporting purposes, defined through `AccGroup` (for example, a
  binder). No financial structures attach at this level.

Portfolio
: A number of accounts, defined through `PortNumber`. Primary terms cannot attach at portfolio
  level, but reinsurance structures can.

Which levels financial terms attach to:

| Hierarchy level | Defined by | Primary terms? | Reinsurance terms? |
| --- | --- | --- | --- |
| Location coverage | Buildings, contents, business interruption, other | Yes | No |
| Location | `LocNumber`; field names start with `Loc` | Yes | Yes |
| Location group | `LocGroup` | No | Yes |
| Policy | `PolNumber`; within it, special conditions (`Cond`) apply first, then standard policy conditions (`Pol`), then layers (`Layer`) | Yes | Yes |
| Account | `AccNumber`; field names start with `Acc` | Yes | Yes |
| Account group | `AccGroup` | No | No |
| Portfolio | `PortNumber` | No | Yes |

Because multiple policies can apply to the same locations, take care when summing exposure or
ground-up loss at policy level, to avoid overcounting.

## Coded values

Many OED fields draw on controlled vocabularies (perils, occupancy, construction, country,
coverage). Those allowed values are in the {doc}`coded values reference <../reference/values>`.

## Detailed chapters

The full specification narrative, migrated from the OED standard documents:

```{toctree}
:maxdepth: 1

rationale
import-format
asset-details
geography-perils
financial-primary
financial-policy-conditions
reinsurance
```
