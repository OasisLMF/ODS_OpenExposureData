# OED fields

The input fields for each OED file, grouped by file. A field's requirement level depends on the
line of business, so there is one status column per line — **Property**, **Cyber**,
**Liability** and **Marine Cargo** — each taking one of:

```{list-table}
:header-rows: 0
:widths: 10 90

* - `R`
  - Required
* - `O`
  - Optional
* - `CR`
  - Conditionally required (required in certain circumstances — see the field description)
* - `n/a`
  - Not applicable to this file / line of business
```

```{include} _generated/oed_fields.md
```
