# Correlation Analysis - Snapchat Video Metrics 

## Purpose 
- Evaluate Snapchat viewership data to uncover insights regarding:
    -  Metric correlations across different dimensions (timeframes, individual snapchat channels, "banger" vs. regular episodes)
    -  Uniquess of "banger" episodes 
        - are there specific sets of metrics that share stronger/weaker relationships when filtering for outlier (banger) episodes?

## Approach 
- Data
    - 4 data samples (based on real-world data) are used and filtered based on the following:
        - 2021-2022 Data (see [yearly_updated.csv](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/data/yearly_updated.csv)): inaugural episode-level data from Sept 2021-Mar 2022
        - 2022 Data: Inaugural episode-level data from Jan 2022-Mar 2022
        - Bangers 21-22: data pertaining to episodes individually designated as "bangers" based on pre-determined critera of stakeholders
        - Bangers 2022: "" filter from Jan 2022-March2022  
- Correlation Analysis
    - correlation matrices are created across different time frames/data samples to assess correlation in episode-level metrics 
- Regression 
    - a number of regression methods are tried and tested on selected high-correlation relationships (>0.70 pearson correlation coefficient - spearman in cases on non-linear relationships).   
