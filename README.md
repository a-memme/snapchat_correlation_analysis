# Snapchat Video Metrics Analysis

## Purpose 
- Evaluate Snapchat viewership data to uncover insights regarding:
    -  Metric correlations across different dimensions (timeframes, individual snapchat channels, "banger" vs. regular episodes)
        - how do the following KPIs relate to unique viewership?
        - if there is significant relation between variables, what is the shape of this relationship? (i.e linear, polynomial, non-linear, etc.)
        - does the nature of these relationships (strength of correlation, direction and shape of relationship) change under different time frames?
    -  Uniquess of "banger" episodes 
        - are there specific sets of metrics that share stronger/weaker relationships when filtering for outlier (banger) episodes?

## Approach 
- Data
    - real-world dataset, previously used in a professional setting and altered to translate to a github context 
    - 4 data samples are used and filtered based on the following:
        - **2021-2022 Data (see [data/yearly_updated.csv](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/data/yearly_updated.csv)):** inaugural episode-level data from Sept 2021-Mar 2022
        - **2022 Data (see [data/2022_updated.csv](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/data/2022_updated.csv):** Inaugural episode-level data from Jan 2022-Mar 2022
        - **Bangers 21-22 (see [data/in_bangers.csv](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/data/in_bangers.csv):** data pertaining to episodes individually designated as "bangers" based on pre-determined critera of stakeholders
        - **Bangers 2022 (see [data/bangers_2022.csv](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/data/bangers_2022.csv):** "" filter from Jan 2022-March2022  
- [Correlation Analysis](https://github.com/a-memme/snapchat_correlation_analysis/tree/main/Correlation_analysis)
    - correlation matrices are created across different time frames/data samples to assess correlations across episode-level metrics 
- [Regression](https://github.com/a-memme/snapchat_correlation_analysis/tree/main/Regression_analysis)
    - several regression models are assesed amongst selected metrics with high-correlation coefficients to further assess relationship strength and predictive power between/amongst variables(>0.70 pearson correlation coefficient/spearman in cases on non-linear relationships).

## Results

### Correlations 
*(see [Correlation_analysis](https://github.com/a-memme/snapchat_correlation_analysis/tree/main/Correlation_analysis) for context)*
- The strongest metrics correlated to viewership (Unique Viewers) are the following:
    - Unique Topsnap Views and Unique Completers (0.93-0.98)
    - Subscribers added (0.89-0.92)
        - strongest correlated metric to viewership out of engagement metrics (i.e subcribers, screenshots and shares)
        - most consistently correlated metric to viewership out of the engagement metrics.  
- Shares 
    - are only strongly correlated with viewership when assessing episodes overall, and not for banger episodes 
- Screenshots 
    - only strongly correlation with viewership when isolating for individual channels

### Relationships 
*(See [Regression_analysis](https://github.com/a-memme/snapchat_correlation_analysis/tree/main/Regression_analysis) for context)*
- Unique Topsnap Views & Unique Completers 
    - very close linear relationship to viewership (R2 = ~0.90)
    - could potentially be perceived as an obvious finding as both metrics are by-nature viewership metrics in and of themselves. 
    - understanding that particular quality of viewership metrics (number of unique completers of content, and number of unique viewers per each individual snap in any particular set of content) move closely in tandem with the number of unique viewers. 
- Subcribers added 
    - moderate linear relationship with viewership (R2 = ~0.80) - best modelled by a RLM to account for outliers.
- Shares 
    - asymptotic relationship with viewership, best modelled by the Michaleis-Menten equation, or GAM (0.78-0.79 correlation predicted y to actual y)
        - ** this relationship is only valid when assessing overall data, and not banger episodes specifically 
    - indicates a threshold value where the increase of shares becomes less relevant to the increase of unique viewers 
        - i.e as the number of shares increase, the rate of UV increase slows. 
    - outlier influence (see Outlier influence section in [Regression_analysis](https://github.com/a-memme/snapchat_correlation_analysis/tree/main/Regression_analysis)
        - the asymptotic relationship between shares and viewership is strongly held up by a single outlier 
        - when removing this outlier, the relationship is still apparent, however substantially weaker 
            - not as concerning in this context as it my normally be as outlier episodes represent some of the data that we're most interested in analyzing within the social media context
            - further analyses will look to perform the same regression at a future date when even more data is available.     
- Screenshots 
    - linear relationship with viewership when looking at data individual to each unique channel 
        - apparent under all channels except for 1 (channel_2d)
    - the strength and rate of this relationship is unique to each channel, indicating a potential profile pertaining to each channel where screenshots hold different influence over its relationship with viewership. 

### Bangers 
- The most strongly correlated metrics with viewership become even more strongly correlated when isolating for banger episodes 
    -  *(see table under All Datasets section in [Correlation_analysis](https://github.com/a-memme/snapchat_correlation_analysis/tree/main/Correlation_analysis))*
- No significant linear or nonlinear correlations with shares
- Strong correlations with screenshots only exist when data is filtered by individual snapchat channel. 
    - *(See table under Data by Individual Snapchat Channel section in [Correlation_analysis](https://github.com/a-memme/snapchat_correlation_analysis/tree/main/Correlation_analysis))*
- Although the strength of correlations/relationships change when analyzing across different datasets, the shape of these relationships remain constant 
    - i.e shares to viewership is always a nonlinear (asymptotic) relationship when looking at all-channel data across different time-frames or banger/overall data, regardless of the correlation strength or performance of the regression model.

## Summary & Insights
- Only metrics that are **consistently** strongly correlated with viewership are:
    - unique topsnap views 
    - unique completers 
    - subscribers added 
- All strongly correlated metrics have a positive linear relationship with viewership with the exception of shares
    - shares is the only metric with a nonlinear (asymptotic) relationship with viewership 
- Correlation strength and the slope of the linear relationship between screenshots and viewership are channel-dependent 
- The shape of metric to viewership relationships remain contsant across timeframes and datasets, regardless of correlation strength or regression performance.

## Future Analyses 
- Regression analyses with a greater wealth of data 
    - the nonlinear relationship with shares and viweership is only statistically satisifed when applied to overall data (not to bangers) - based on the visual representations of these datasets, one may be able to find more adequate models with a larger dataset. 
    - Thus, future inferences will look to perform  the same analyses at a future date when more data is available. 
  
