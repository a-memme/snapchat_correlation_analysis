# Correlation Analysis - Snapchat Video Metrics 

## Purpose 
- Evaluate Snapchat viewership data to uncover insights regarding:
    -  Metric correlations across different dimensions (timeframes, individual snapchat channels, "banger" vs. regular episodes)
        - how do the following KPIs relate to one another: how closely do they follow the same relationships/what are their relationships, and are they more relevant within different contexts (i.e timeframes or types of episodes)?
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
    - several regression models are assesed amongst selected metrics high-correlation coefficients to further assess relationship strength and predictive power between/amongst variables(>0.70 pearson correlation coefficient/spearman in cases on non-linear relationships).

## Results 

### Correlation Analysis - Pearson vs Spearman
Pearson 
- parametric correlation analysis (most popular), making (at the least) the following assumptions:
    - variables are continuous in nature 
    - relationship between variables is linear 
    - homoscedasticity (to an acceptable degree)
- not particularily robust to outliers

Spearman 
- non-parametric correlation analysis 
    -  does not carry any assumptions about the distribution of the data 
    -  variables should be measured on a scale that is at least ordinal
        - i.e applies correlation analysis to ranks 
- assesses monotonic relationships
- more robust to outliers vs. Pearson

*see https://www.surveymonkey.com/market-research/resources/pearson-correlation-vs-spearman-correlation/?program=7013A000000mweBQAQ&utm_bu=CR&utm_campaign=71700000063500204&utm_adgroup=58700005673976109&utm_content=39700051703508296&utm_medium=cpc&utm_source=adwords&utm_term=p51703508296&utm_kxconfid=s4bvpi0ju&language=&test=&gclid=Cj0KCQjw_4-SBhCgARIsAAlegrXnjnB1_-0gzSdNUh4GdBfZzxZpA9oD4sGYd_DTvVrxGNzRDFClzSYaAg6PEALw_wcB&gclsrc=aw.ds and https://statistics.laerd.com/statistical-guides/pearson-correlation-coefficient-statistical-guide.php for more info*

### Pearson Method: Correlations to Viewership (Unique Viewers) - 2021-2022 Data 
- UVs are most highly correlated with the following metrics within the yearly dataset:
    - Unique completers: 0.95
    - Unique Topsnap Views: 0.98
    - Subscribers: 0.89
 
![Screen Shot 2022-05-16 at 11 21 20 PM](https://user-images.githubusercontent.com/79600550/168722115-b2714e30-db3a-47c2-9a0a-ab8e1ed7f508.png)

### Spearman Method - 2021-2022 Data
- Shares and subscribers see a substantial increase in correlation to unique viewers (UVs) when appying Spearman correlation matrix vs. Pearson
    - indication to visualize relationship to explore further.

![Screen Shot 2022-05-16 at 11 26 50 PM](https://user-images.githubusercontent.com/79600550/168722905-201fdbd1-be69-4098-8cdd-f054caacc431.png)
