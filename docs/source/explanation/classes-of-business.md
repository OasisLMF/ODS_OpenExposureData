# Classes of business

OED began as a property standard. Since **v4.0.0** it is a single integrated specification
covering four classes of business, rather than separate schemas per class:

Property
: The original and most fully developed class. The chapters in this section — import format,
  asset details, geography and perils, financial terms and reinsurance — describe property
  business unless they say otherwise.

Cyber
: Released as a separate schema in February 2023 and folded into the main schema at v4.0.0.
  See {doc}`cyber`.

Liability
: Released as a separate schema in April 2022 and folded into the main schema at v4.0.0.
  See {doc}`liability`.

Marine Cargo
: Integrated into the main schema at v4.0.0. It follows the same four-file structure as
  property. There is no separate background document for marine cargo.

A field's requirement level differs by class, and the {doc}`field reference <../reference/fields>`
gives all four statuses per field — a field required for property may be `n/a` for cyber, and
vice versa.

```{toctree}
:maxdepth: 1
:hidden:

cyber
liability
```
