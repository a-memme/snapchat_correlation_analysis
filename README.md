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
    - several regression models are assesed amongst selected metrics high-correlation coefficients to further assess relationship strength and predictive power between/amongst variables(>0.70 pearson correlation coefficient/spearman in cases on non-linear relationships).

## Results 


## Regression 
The purpose of performing regression analyses on the following metrics was to provide supporting insight on their strong correlation values, and to investigate whether sufficient linear/non-linear models could be built to accurately depict these relationships. 

*Note multiple regression was not performed due to multicolinearity of predictor variables (i.e those strongly correlated with UVs).*

### Unique Completers 
![Screen Shot 2022-05-17 at 5 58 32 PM](https://user-images.githubusercontent.com/79600550/168916960-c8950414-8164-4b14-96df-64b21a7e5aa5.png)

![Screen Shot 2022-05-17 at 6 01 30 PM](https://user-images.githubusercontent.com/79600550/168917346-01f43a19-8b02-420d-9ea1-fc242b63b496.png)
- Significant p-value < 2e-16
    - as expected given the extremely high correlation coefficient of ~0.95
    - sufficient evidence to reject the 'hypothetical' null hypothesis - i.e there is an extremely low probability that the variance contributed to the model by the unique completer metric is merely due to chance. 
- R2 = 0.90
- Significant intercept value: 
    - also expected - statistically significant intercepts indicate that there is substantial variability in y when x=0. This is expected as we assume there to be multiple influencers on viewership, in addition to the contextual understanding of how social content is initially distributed.
- Approximate normal distribution of the residuals (for validity of the model - see below)

![Screen Shot 2022-05-17 at 5 59 22 PM](https://user-images.githubusercontent.com/79600550/168922690-3a885d77-11c3-4810-a5a5-2bab5ba8b0e7.png)


### Subcribers 
![Screen Shot 2022-05-17 at 6 31 33 PM](https://user-images.githubusercontent.com/79600550/168923062-03ea6dc0-0910-4bb8-93b6-d30e83f8fdff.png)

![Screen Shot 2022-05-17 at 6 30 28 PM](https://user-images.githubusercontent.com/79600550/168923085-19f2e477-da87-48db-8841-882b374c280b.png)
- Significant p-value < 2e-16
- R2 = 0.80
    -  80% of the variability in this model can be explained by subcribers - less than unique completers, but expected based on correlation values.
- Significant intercept value: 1.05e-15
- Robust comparison 
    - A robust linear regression model is also ran on this relationship to help account for interference due to outliers (see [snap_correlation_analysis.R](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/snap_correlation_analysis.R) for code), however fits a slightly less accurate model vs olsr.  

### Shares 




  
