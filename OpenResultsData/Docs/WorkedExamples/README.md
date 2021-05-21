# Open Results Data worked examples

The worked examples in this section demonstrate how the variants of loss reports are calculated for platforms which use a sampling approach in their financial engine.
        
The worked examples are;

* SELT_SPLT - illustrates how Sample PLT is derived from Sample ELT
* SELT_MELT_QELT - illustrates how Moment ELT and Quantile ELT are derived from Sample ELT
                                                                                                           
### Reports overview

The main report types can be summarized as follows;
* **Event Loss Table** “ELT” with variants;
	* Sample ELT “SELT”
	* Moment ELT “MELT”
	* Quantile ELT “QELT”
* **Period (Year) Loss Table** “PLT” with variants;
	* Moment PLT “PELT”
	* Sample PLT “SPLT”
	* Quantile PLT “QPLT”
* **Average Loss Table** “ALT” – containing Average Annual losses (AAL’s)
* **Exceedance Probability Table** “EPT” with variant;
	* Per Sample Exceedance Probability Table "PSEPT"

ALT and EPT reports are derived from ELTs and PLTs and represent higher statistical summaries of the more detailed ELTs and PLTs.

### Agnostic format
The loss report formats have been designed to be agnostic to the loss modelling platform that produced them. They have been based on OasisLMFs wide range of sample-based reports, with an extended set of fields to accomodate statistics that do not come from a sampling approach. Platforms that do not use sampling will not be able to populate the full range of reports, but the reports that are produced can be expressed in the same format as those that have been produced from a sampling methodology.

The worked examples in this section demonstrate the derivation of ORD loss reports for the Oasis platform, which uses a Monte Carlo sampling approach to loss generation for a fixed set of event occurrences. 

The diagram illustrates how the reports are derived from each other. Further reference data is needed for some calculations which is detailed as reference or input data in each worked example spreadsheet.

### How reports are derived
![alt text](overview.jpg "Reports overview")


