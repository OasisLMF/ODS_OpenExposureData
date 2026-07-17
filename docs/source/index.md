# Open Exposure Data (OED)

**OED** is the open standard for catastrophe-model **exposure data** — a common format for
describing locations, accounts, policy terms and reinsurance, so that exposure can be moved
between models and tools without bespoke conversion. It is the exposure counterpart to
[ORD](https://github.com/OasisLMF/ODS_OpenResultsData) (results data), together forming the
Open Data Standards (ODS) maintained by the ODS Steering Committee.

This site is the reference for the standard. The field and coded-value definitions are
generated directly from the authoritative `oed.json` in this repository, so they always match
the released specification.

::::{grid} 1 1 2 2
:gutter: 3

:::{grid-item-card} 📖 Explanation
:link: explanation/index
:link-type: doc

What OED is, the file structure (Location / Account / Reinsurance), the exposure hierarchy,
and how financial terms and perils are represented.
:::

:::{grid-item-card} 📋 Reference
:link: reference/index
:link-type: doc

The generated field reference for every input file, plus the coded value lists (perils,
occupancy, construction, country, coverage).
:::
::::

```{toctree}
:hidden:
:maxdepth: 2

explanation/index
reference/index
```
