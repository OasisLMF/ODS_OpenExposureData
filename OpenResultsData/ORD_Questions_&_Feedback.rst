Outstanding ORD Questions and Feedback
######################################

The questions and feedback below were received from multiple sources following the Lloyd's Lab project in November 2019. The comments in bold are the responses from recent discussions with key users of ODS in April 2021. They are in order of priority from the original list, but they have not been confirmed as being on the development road-map for ODS at this stage. 


1. For audit, need to ensure that we capture all information that enables an analysis to be reproduced: versions, exposure data, analysis settings, times / dates of analysis. Should consider the use of hash / checksum information to ensure nothing has changed post-analysis.

**This is very important and highlights how metadata should be standardised within the results 'package'**.

&nbsp; 

2. Should include grid-cell resolution in model metadata: hazard.

**It would be really beneficial to have losses by hazard, i.e. by windspeed or flood depth. This functionality should be high on the development list**.

&nbsp; 

3. Need to ensure that multi-model results from one 'run' can be brought together consistently into one period loss table. For example using an EnsembleID that ties together a number of different 'analyses'. Or introducing a ModelRegionId in the PLTs.

**This needs some clarity but is quite important. Every model needs to be identifiable somehow in the outputs (i.e. ModelID) and included in the results 'package' which is related to point 1**.

&nbsp; 

4. For the model metadata part we need to ensure the package can include a range of formats - e.g. shapefiles - so that a broad range of information can be included. Can the chosen technology do this?

**This is a nice to have especially as some model providers use shapefiles and so it would be useful to provide outputs by geography/area**.

&nbsp; 

5. How do we capture grouping by reinstatements / losses by reinstatements? Output file with layers affected and count reinstatements?

**This is not a typical requirement and unlikely to be requested by most users. However, outputs for other reinsurance perspectives (i.e. net of fac, QS, SS etc) would be of more benefit and are currently on the development roadmap**.

&nbsp; 

6. How about the benefits of providing outputs to show convergence of samples and the difference between the 'analytical' and 'sample' outputs?

**A nice to have and a possible development for the future**.

&nbsp; 

7. We need to consider the mechanism for ensuring that only users who have licensed a model can access a model's results - part of the technology solution or a business issue?

**This is more of a platform question around the security and encryption of accessing results. This is related to technology and will be a key aspect to address during technology discussions in the future**. 

&nbsp; 

8. We need to consider metrics beyond insurance / reinsurance loss: number of locations affected, number of people killed, number of people injured, number of people displaced etc. Which metrics should be included? here will be metrics other than input TIV and output financial loss which become important, e.g. km of infrastructure affected, number of population affected, number of locations affected; these may all replace $$ on one axis of an EP curve or in an ELT. We don't have a definitive list, as we are just starting to discover what some of these outputs may be.

**This relates to work currently being done with the World Bank on their Risk Data Library (RDL which is looking at how ODS and the RDL can come together to create a data standard applicable across sectors to provide standardised data for disaster risk management and humanitarian projects. RDL contains schemas for hazard, vulnerability and socio-economic data. Work on this project is on-going throughout 2021**. 

&nbsp; 

9. Should include uncertainty from ensemble members resulting from sensitivity testing (not secondary uncertainty). We seek a more flexible expression of uncertainty in results than just a SD. As we implement an ensemble modelling approach driven by SAFE, we will have greater power to derive more informative output; for example an empirical loss distribution within an ELT or for a given point on a loss curve. Also the output formats must not assume a single model run with internal sampling will always be appropriate; our current view is towards multiple model runs driven by, and with input parameters perturbed by, a sensitivity analysis toolset like SAFE.

**A nice to have and could be useful but not a high priority. This is likely to be a larger project in itself and so more resource and planning will be required. A possibility for the future**.

&nbsp; 

10. Can we add the facility to easily anonymise results / exposures for external distribution?

**A nice to have and a possibility but this is more down to the user to anonymise**.

&nbsp; 

11. Should include disaggregation information - has original exposure information been disaggregated by the model or not?

**This is model specific and a nice to have but not essential**.

&nbsp; 

12. Marginal impact results should be able to be stored in ORD.

**Nice to have but not essential. There are too many variations of a marginal impact analyses and so difficult to tie down the most appropriate or required. These analytics should really be down to the user to perform**.

&nbsp; 

13. Loss results should be usable on their own (no other lookups to find original values from IDs) - the results file itself should be the only file I need to interpret the results, the fact you can't achieve this at present makes Oasis harder to use. Likewise, naming of files should not result in identical file names.

**The explanations of output 'types' and 'IDs' are already available and so it's easy for the user to decipher the results in just two files. Not necessary to have all in one file.**

&nbsp; 

14. Is there a way of being able to trace back everything that has happened to give rise to the loss at a given location (reinsurance applied, models run etc). Essentially full audit trail at a location level rather than an analysis level?

**Not really viable - just too much data to record all changes and edits. Files would become huge**.

