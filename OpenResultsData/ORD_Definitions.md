# ORD Output Definitions

ORD covers an extensive suite of model outputs for multiple perspectives and calculations. The key ORD outputs and the ones most typically used in cat modelling are the exceedance probability (EP) curves.

The detailed ORD outputs are outlined in the data sepc doc:

https://github.com/OasisLMF/OpenDataStandards/tree/master/OpenResultsData/Docs

&nbsp;

## Probability Table (EPT) 

The calculation of EPTs depends on the mathematical methodology of calculating the underlying ground up and insured losses.
In the Oasis kernel the methodology is Monte Carlo Sampling from damage distributions, which results in several samples (realisations) of an event loss for every event in the model's catalogue. The event losses are assigned to a year timeline and the years are rank ordered by loss. The method of computing the percentiles is by taking the ratio of the frequency of years with a loss exceeding a given threshold over the total number of years.
The EPT in ORD is a set of user-specified percentiles of (typically) annual loss and contains the following data fields:
•	SummaryID: Summary level groupings from OED

**EPCalc:**

**1	= Mean Damage Ratio** - the loss calculation for a year using the event mean damage loss computed by numerical integration of the effective damageability distributions. 

**2	= Full Uncertainty** - the calculation across all samples (treating the samples effectively as repeat years) - this is the most accurate of all the single EP Curves.

**3	= Per Sample Mean** - the average of the losses at each return period of the Per Sample EPT (see PSEPT below).

**4	= Sample Mean** - the loss calculation for a year using the statistical sample event mean.

&nbsp;

**EPType:**

**1	= OEP (Occurrence Exceedance Probability)** - maximum of any one event’s losses in a year).

**2	= OEP TVaR (Tail Value at Risk or TCE (Tail Conditional Expectation))** - is computed by averaging the rank ordered losses exceeding a given return period loss from the respective OEP result.

**3	= AEP (Aggregate Exceedance Probability)** - sum of losses from all events in a year)

**4	= AEP TVaR (Tail Value at Risk or TCE (Tail Conditional Expectation))** - is computed by averaging the rank ordered losses exceeding a given return period loss from the respective AEP result.

**ReturnPeriod:** Represents the reciprocal of the percentile

**Loss:** Modelled loss

&nbsp;

## Per Sample Exceedance Probability Table (PSEPT)

Similarly to the EPT, the PSEPT is a set of user specified percentiles calculated separately for each sample, resulting in many curves (one loss curve per sample) and contains the following data fields:

**• SummaryID:**	Summary level groupings from OED

**•	SampleID:** Refers to the sample number from the user defined set

**•	EPType:** Same as EPT

**•	ReturnPeriod:** Same as EPT

**•	Loss:** Same as EPT


&nbsp;

## Event Loss Tables (ELT)

There are multiple ELTs in ORD format that contain the losses by event at each summary level.

**• Event Loss Table (SELT):** Sample losses for each event at the appropriate summary level.

**•	Moment Event Loss Table (MELT):** Summary stats (mean and standard deviation) for each event at the appropriate summary level, along with the event’s annual rate of occurrence.

**• Quantile Event Loss Table (QELT):** Distribution of losses at user specified quantiles for each 
event at the appropriate summary level.

&nbsp;

## Period Loss Tables (PLT)

The detailed event losses of the ELT’s are organised into periods according to how events are assigned to those periods in the occurrence timeline. A period is typically a year, however in ORD loss can be represented over any period of time and referred to as a ‘period’. 
As for events, the same statistical variants are available for periods at each summary level as follows:

**•	Moment Period Loss Table (MPLT)** - Summary stats (mean, event rates, standard deviation, etc) for each event within each period at the appropriate summary level.

**•	Quantile Period Loss Table (QPLT)** - Distribution of losses at user specified quantiles for each event within each period at the appropriate summary level

**•	Sample Period Loss Table (SPLT)** - Sample losses for each event within each period at the appropriate summary level

&nbsp;

## Average Loss Table (PALT)

Commonly known as the Average Annual Loss ‘AAL’, the Period Average Loss Table (PALT) is the high level statistical summary of the mean and standard deviation of loss over all periods.
