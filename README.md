# Correlation Analysis - Snapchat Video Metrics 

## Purpose 
- Evaluate Snapchat viewership data to uncover insights regarding:
    -  Metric correlations across different dimensions (timeframes, individual snapchat channels, "banger" vs. regular episodes)
        - how do the following KPIs relate to unique viewership?
        - if there is significant relation between variables, what is the shape of this relationship? (i.e linear, polynomial, non-linear, etc.)
        - does these relationships (strength of correlation/direction and shape of relationship) change under different time frames?
    -  Uniquess of "banger" episodes 
        - are there specific sets of metrics that share stronger/weaker relationships when filtering for outlier (banger) episodes?

## Approach 
- Data
    - 4 data samples (based on real-world data) are used and filtered based on the following:
        - **2021-2022 Data (see [data/yearly_updated.csv](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/data/yearly_updated.csv)):** inaugural episode-level data from Sept 2021-Mar 2022
        - **2022 Data (see [data/2022_updated.csv](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/data/2022_updated.csv):** Inaugural episode-level data from Jan 2022-Mar 2022
        - **Bangers 21-22 (see [data/in_bangers.csv](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/data/in_bangers.csv):** data pertaining to episodes individually designated as "bangers" based on pre-determined critera of stakeholders
        - **Bangers 2022 (see [data/bangers_2022.csv](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/data/bangers_2022.csv):** "" filter from Jan 2022-March2022  
- Correlation Analysis
    - correlation matrices are created across different time frames/data samples to assess correlations across episode-level metrics 
- Regression 
    - several regression models are assesed amongst selected metrics with high-correlation coefficients to further assess relationship strength and predictive power between/amongst variables(>0.70 pearson correlation coefficient/spearman in cases on non-linear relationships).

## Results 



  
