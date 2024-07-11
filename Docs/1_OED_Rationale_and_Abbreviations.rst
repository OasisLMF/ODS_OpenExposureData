Rationale
=========

The need for a new (re)insurance industry exposure data standard arose from the lack of such an existing standard for Oasis based models. Exposure data is the starting point for catastrophe risk analysis, and without such a standard in place it is impossible to give users guidance and documentation on how to prepare their input data and enable appropriate validation within Oasis based modelling platforms.

The Oasis financial model (FM) enables a wide variety of model developers to use one consistent financial model: it is a key part of the utility of the Oasis framework. However, it is important that financial fields in the exposure data correspond well with the financial model to enable the full scope of the financial model to be used. The OED has been designed from the outset to work well with, and enable the full functionality of, the Oasis FM.

The OED also provides companies with a starting point for implementing a model-developer-independent exposure data repository, which is strategically beneficial as it prevents firms being locked in to any one particular model developer.

Although OED is designed to work well with Oasis based models, the scope of OED is wider than Oasis. For example, financial fields exist in OED which are not yet implemented in Oasis and secondary modifiers that exist in OED which are not currently used by any Oasis based model. However, Oasis LMF continue to expand the scope of their FM with the aim to support as much of the OED functionality as possible.

In the meantime, users should consult their platform / model specific documentation to understand which elements within OED are being used by a certain model at a particular time.


OED Abbreviations
-----------------

The following abbreviations are used in OED field names:

.. csv-table::
    :widths: 8, 40
    :header: "Abbreviation", "Description"

    "Acc", "Account"
    "Agg", "Aggregate"
    "BI",	"Business interruption, but also used to denote other time-based coverage insurable values such as alternative living expenses"
    "Cond",	"Condition (as in special condition such as sub-limit or sub-deductible)"
    "Cov", "Coverage"
    "Ded", "Deductible"
    "Def", "Defined (as in user defined)"
    "FX",	 "Exchange rate"
    "LOB", "Line of business"
    "Loc", "Location"
    "Max", "Maximum"
    "Min", "Minimum"
    "Occ", "Occurrence"
    "Org", "Original"
    "PD",  "Property damage"
    "POI", "Period of indemnity"
    "Pol", "Policy"
    "Port", "Portfolio"
    "Reins", "Reinsurance"
    "TIV", "Total insurable value"
    "Vuln",	"Vulnerability"
