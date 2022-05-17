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

## Correlation
### Pearson vs Spearman
- Pearson's Rho
    - parametric correlation analysis (most popular), making (at the least) the following assumptions:
        - variables are continuous in nature 
        - relationship between variables is linear 
        - homoscedasticity (to an acceptable degree)
    - not particularily robust to outliers

- Spearman's Rho
    - non-parametric correlation analysis 
        -  does not carry any assumptions about the distribution of the data 
        -  variables should be measured on a scale that is at least ordinal
            - i.e applies correlation analysis to ranks 
    - assesses monotonic relationships
    - more robust to outliers vs. Pearson

*see the following resources from [Survey Monkey](https://www.surveymonkey.com/market-research/resources/pearson-correlation-vs-spearman-correlation/?program=7013A000000mweBQAQ&utm_bu=CR&utm_campaign=71700000063500204&utm_adgroup=58700005673976109&utm_content=39700051703508296&utm_medium=cpc&utm_source=adwords&utm_term=p51703508296&utm_kxconfid=s4bvpi0ju&language=&test=&gclid=Cj0KCQjw_4-SBhCgARIsAAlegrXnjnB1_-0gzSdNUh4GdBfZzxZpA9oD4sGYd_DTvVrxGNzRDFClzSYaAg6PEALw_wcB&gclsrc=aw.ds)
and [Staitics Laerd](https://statistics.laerd.com/statistical-guides/pearson-correlation-coefficient-statistical-guide.php) for further info*


### 2021-2022 Data
#### Pearson Method: Correlations to Viewership (Unique Viewers)
- UVs are most highly correlated with the following metrics within the yearly dataset:
    - Unique completers: 0.95
    - Unique Topsnap Views: 0.98
    - Subscribers: 0.89
 
![Screen Shot 2022-05-16 at 11 21 20 PM](https://user-images.githubusercontent.com/79600550/168722115-b2714e30-db3a-47c2-9a0a-ab8e1ed7f508.png)

#### Spearman Method - 2021-2022 Data
- Shares and subscribers see a substantial increase in correlation to unique viewers (UVs) when appying Spearman correlation matrix vs. Pearson
    - Shares: Pearson = 0.59; Spearman = 0.74
    - Screenshots: Pearson = 0.51; Spearman = 0.88
- indication to explore relationship further to assess potential polynomial/non-linear relationships.

![Screen Shot 2022-05-16 at 11 26 50 PM](https://user-images.githubusercontent.com/79600550/168722905-201fdbd1-be69-4098-8cdd-f054caacc431.png)

#### Visualizing Shares & Screenshots
- Shares 
    - displaying what appears to be a asymptotic relationship with UVs - assessed further through the analysis.
<img width="995" alt="Screen Shot 2022-05-17 at 12 05 22 AM" src="https://user-images.githubusercontent.com/79600550/168727140-4c240317-9e86-4d39-b872-33c5cb331bdc.png">

- Screenshots 
    - displaying what appears to be several linear relationships to different degrees based on channel type - no correlation when assesing data overall, but indication that individual channels may see strong correlations between viewerships and screenshots. Assessed further through the analysis.
<img width="1019" alt="Screen Shot 2022-05-17 at 12 06 38 AM" src="https://user-images.githubusercontent.com/79600550/168727185-9a8426e0-337f-4712-af4b-3484380efaf1.png">


### Correlations on all data sets
<img width="655" alt="Screen Shot 2022-05-17 at 5 28 03 PM" src="https://user-images.githubusercontent.com/79600550/168913175-4293b3d0-4104-4016-babb-ddedfdb025c6.png">

- Top 3 highly correlated metrics for 2021-2022 Data are consistent across all datasets. 
    -   i.e unique completers, unique topsnap views, and subscribers.
- Shares
    - appear to form an asymptotic relationship with UVs
    - are only strongly correlated with UVs when assessing "overall" data (2021-2022 data and 2022 data - i.e data that doesn't isolate for banger episodes)
- Screenshots 
    - not strongly correlated with UVs given the assumption of linearity across all data sets (i.e Pearson correlatin coefficients < 0.7)
        - strong Spearman correlations between these two metrics but plotting the data revealed no apparent non-linear relationship 
        - indication of linear relationships on a individual channel-level 

## Regression 
The purpose of performing regression analyses on the following metrics were to further support their respective correlation coefficients, and see if sufficient models could be built to accurately depcit these relationships. 

*Note multiple regression was not performed due to multicolinearity of predictor variables (i.e those strongly correlated with UVs).*

### Unique Completers 
![Screen Shot 2022-05-17 at 5 58 32 PM](https://user-images.githubusercontent.com/79600550/168916960-c8950414-8164-4b14-96df-64b21a7e5aa5.png)

![Screen Shot 2022-05-17 at 6 01 30 PM](https://user-images.githubusercontent.com/79600550/168917346-01f43a19-8b02-420d-9ea1-fc242b63b496.png)
- Significant p-value < 2e-16
    - as expected given the extremely high correlation coefficient of ~0.95
    - sufficient evidence to reject the 'hypothetical' null hypothesis - i.e there is an extremely low probability that the variance contributed to the model by the unique completer metric is merely due to chance. 
- R2 = 0.90
- Significant intercept value 
    - also expected - statistically significant intercepts indicate that there is substantial variability in y when x=0. This is expected as we assume there to be multiple influencers on viewership, in addition to the contextual understanding of initial social content distribution.
- Approximate normal distribution of the residuals (for validity of the model - see below)

![Screen Shot 2022-05-17 at 5 59 22 PM](https://user-images.githubusercontent.com/79600550/168922690-3a885d77-11c3-4810-a5a5-2bab5ba8b0e7.png)


### Subcribers 
![Screen Shot 2022-05-17 at 6 31 33 PM](https://user-images.githubusercontent.com/79600550/168923062-03ea6dc0-0910-4bb8-93b6-d30e83f8fdff.png)

![Screen Shot 2022-05-17 at 6 30 28 PM](https://user-images.githubusercontent.com/79600550/168923085-19f2e477-da87-48db-8841-882b374c280b.png)
- Significant p-value < 2e-16
- R2 = 0.80
    -  80% of the variability in this model can be explained by subcribers - less than unique completers, but expected based on correlation values & plot.
- Significant intercept 1.05e-15
- Robust comparison 
    - A robust linear regression model is also ran on this relationship to help account for any major sways due to outliers (see [snap_correlation_analysis.R](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/snap_correlation_analysis.R) for code), however fits a slightly less accurate model. 

### Shares 




  
