# Correlation Analysis - Snapchat Video Metrics 

## Purpose 
- Evaluate Snapchat viewership data to uncover insights regarding:
    -  Metric correlations across different dimensions (timeframes, individual snapchat channels, "banger" vs. regular episodes)
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
    - correlation matrices are created across different time frames/data samples to assess correlation in episode-level metrics 
- Regression 
    - a number of regression methods are tried and tested on selected high-correlation relationships (>0.70 pearson correlation coefficient - spearman in cases on non-linear relationships).

## Results 

### Correlations to Viewership (Unique Viewers) - 2021-2022 Data 
- UVs are most highly correlated with the following metrics within the yearly dataset:
    - Unique completers: 0.95
    - Unique Topsnap Views: 0.98
    - Subscribers: 0.89!
![Screen Shot 2022-05-16 at 11 21 20 PM](https://user-images.githubusercontent.com/79600550/168722115-b2714e30-db3a-47c2-9a0a-ab8e1ed7f508.png)



   
