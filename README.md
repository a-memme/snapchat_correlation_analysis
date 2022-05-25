# Snapchat Video Metrics Analysis

## Introduction 
When assessing data within the social media landscape, it is extremely important to understand the nuances of the platform you are dealing with. Snapchat, in particular, has its own particular set of nuaces where some of the typical metrics assumed in social media (clicks, click-through-rate (CTR) , reach, impressions per session (IPS), etc.) are either not readily present, or are represented by other catgeorizations or a combination of different metrics. These differences are partly due to the natural changes one may find platform to platform, but more specifically, are due to the static nature in which videos are viewed, distributed, and maintained within the platform. 

For the purpose of this project, the context assumed is that Snapchat is a novel major revenue stream, where further insight is required to understand how the metrics available through the platform are related to viewership (in this case, the KPI "unique viewers"). Furthermore, this question becomes increasingly more interesting when considering whether any of these metric relationships differ in strength or nature when isolating for the overly successful episodes (i.e "banger" episodes).

## Purpose 
To evaluate Snapchat Video performance data to uncover insights regarding:
-  Metric correlations to viewership across different dimensions (timeframes, individual snapchat channels, "banger" vs. regular episodes)
    -  How do the following KPIs relate to unique viewership?
        - If there is significant relation between variables, what is the shape of this relationship? (i.e linear, polynomial, non-linear, etc.)
        - Does the nature of these relationships change under different time frames? (i.e strength of correlation, direction or shape of relationship)
-  Uniqueness of "banger" episodes 
    -  Are there changes in these metric relationships when filtering for outlier (banger) episodes?

## Approach 
### Data
- Real-world dataset, previously used in a professional setting and altered to appropriately translate to github.
- 4 data samples are used and filtered based on the following:
    - **2021-2022 Data (see [data/yearly_updated.csv](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/data/yearly_updated.csv)):** inaugural episode-level data from Sept 2021-Mar 2022
    - **2022 Data (see [data/2022_updated.csv](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/data/2022_updated.csv):** Inaugural episode-level data from Jan 2022-Mar 2022
    - **Bangers 21-22 (see [data/in_bangers.csv](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/data/in_bangers.csv):** data pertaining to episodes individually designated as "bangers" based on pre-determined critera of stakeholders
    - **Bangers 2022 (see [data/bangers_2022.csv](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/data/bangers_2022.csv):** "" filter from Jan 2022-March2022 

### Correlation Analysis
*(See [Correlation_analysis](https://github.com/a-memme/snapchat_correlation_analysis/tree/main/Correlation_analysis) folder for method)*
- Pearson/Spearman correlation values are compared across different time frames/data samples to assess metric to viewership relations.

### Regression Analysis
*(See [Regression_analysis](https://github.com/a-memme/snapchat_correlation_analysis/tree/main/Regression_analysis) folder for method)*
- A collection of different linear & nonlinear regression models are fit to the data to determine the shape and predictability of metric to viewership relationships. 
- Only metrics with strong correlations to viewership (i.e correlation coefficient > 0.70) are selected for regression.

## Results

### Correlations 
*(see [Correlation_analysis](https://github.com/a-memme/snapchat_correlation_analysis/tree/main/Correlation_analysis) folder)*
- Metrics with strongest correlations to viewership:
    - Unique Topsnap Views and Unique Completers (0.93-0.98)
    - Subscribers added (0.89-0.92)
        - strongest correlated metric to viewership out of engagement metrics (i.e subcribers, screenshots and shares)
        - most consistently correlated metric to viewership out of the engagement metrics.  
- Shares 
    - are only strongly correlated with viewership when assessing episodes overall, and not for banger episodes 
- Screenshots 
    - only strongly correlation with viewership when isolating for individual channels

### Relationships 
*(See [Regression_analysis](https://github.com/a-memme/snapchat_correlation_analysis/tree/main/Regression_analysis) folder)*
- Unique Topsnap Views & Unique Completers 
    - Very close linear relationship to viewership (R2 = ~0.90)
    - Potentially perceived as an obvious finding as both metrics are by-nature viewership metrics. 
- Subcribers added 
    - Moderate linear relationship with viewership (R2 = ~0.80) - best modelled by a RLM to account for outliers.
- Shares 
    - Asymptotic relationship with viewership, best modelled by the Michaleis-Menten equation, or GAM (0.78-0.79 correlation predicted y to actual y)
        - ** this relationship is only valid when assessing overall data, and not banger episodes specifically 
    - Indicates a threshold value where the increase of shares becomes less relevant to the increase of unique viewers 
        - i.e as the number of shares increase, the rate of UV increase slows. 
    - Outlier influence 
        - asymptotic relationship is still quite apparent even with the removal of substantial outliers. 
        - *(see Outlier influence section in [Regression_analysis](https://github.com/a-memme/snapchat_correlation_analysis/tree/main/Regression_analysis) folder)* 
- Screenshots 
    - Linear relationship with viewership when looking at data individual to each unique channel 
        - apparent under all channels except for 1 (channel_2d)
    - The strength and rate of this relationship is unique to each channel, indicating a potential profile pertaining to each channel where screenshots interact with viewership at different rates. 

### Bangers 
- Metrics most strongly correlated with viewership become even more strongly correlated when isolating for banger episodes 
        -  *(See table under All Datasets section in [Correlation_analysis](https://github.com/a-memme/snapchat_correlation_analysis/tree/main/Correlation_analysis))*
- No significant linear or nonlinear correlations with shares
- Strong correlations with screenshots only exist when data is filtered by individual snapchat channel. 
        - *(See table under Data by Individual Snapchat Channel section in [Correlation_analysis](https://github.com/a-memme/snapchat_correlation_analysis/tree/main/Correlation_analysis))*
- Although the strength of correlations/relationships change when analyzing across different datasets, the shape of these relationships remain constant 
    - i.e shares to viewership is always a nonlinear (asymptotic) relationship when looking at all-channel data across different time-frames or banger/overall data, regardless of the correlation strength or performance of the regression model.

## Summary & Insights
- Only metrics that are **consistently** strongly correlated with viewership are:
    - Unique topsnap views 
    - Unique completers 
    - Subscribers added 
- All strongly correlated metrics have a positive linear relationship with viewership with the exception of shares
    - Shares is the only metric with a nonlinear (asymptotic) relationship with viewership 
- Correlation strength and the slope of the linear relationship between screenshots and viewership are channel-dependent 
- The shape of metric to viewership relationships remain consistent across timeframes and datasets, regardless of correlation strength or regression performance.

## Future Analyses 
- Regression analyses with a greater wealth of data 
    - The nonlinear relationship with shares and viewership is only statistically satisifed when applied to overall data (not to bangers) - one may be able to find more adequate models with use of a larger dataset. Thus, future inferences will look to perform  the same analyses at a future date when more data is available. 
