# OED fields

The input fields for each OED file, grouped by file. **Status** is the field's requirement
level for property business:

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

Line-of-business status for Cyber, Liability and Marine Cargo is carried in `oed.json`
(`Cyber/Liability/Marine Cargo field status`); the table below shows the property status.

```{include} _generated/oed_fields.md
```
