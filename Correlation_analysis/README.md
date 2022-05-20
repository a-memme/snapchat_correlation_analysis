
# Correlation Analysis 

## Pearson vs Spearman
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


## 2021-2022 Data 

### Pearson's Rho - Correlation to Viewership 
- UVs are most highly correlated with the following metrics within the yearly dataset:
    - Unique completers: 0.95
    - Unique Topsnap Views: 0.98
    - Subscribers: 0.89
 
![Screen Shot 2022-05-16 at 11 21 20 PM](https://user-images.githubusercontent.com/79600550/168722115-b2714e30-db3a-47c2-9a0a-ab8e1ed7f508.png)

### Spearman's Rho
- Shares and subscribers see a substantial increase in correlation to unique viewers (UVs) when appying Spearman correlation matrix vs. Pearson
    - Shares: Pearson = 0.59; Spearman = 0.74
    - Screenshots: Pearson = 0.51; Spearman = 0.88
- indication to explore relationship further to assess potential polynomial/non-linear relationships.

![Screen Shot 2022-05-16 at 11 26 50 PM](https://user-images.githubusercontent.com/79600550/168722905-201fdbd1-be69-4098-8cdd-f054caacc431.png)

### Visualizing Shares & Screenshots
- Shares 
    - displaying what appears to be a asymptotic relationship with UVs - assessed further through the analysis.
<img width="995" alt="Screen Shot 2022-05-17 at 12 05 22 AM" src="https://user-images.githubusercontent.com/79600550/168727140-4c240317-9e86-4d39-b872-33c5cb331bdc.png">

- Screenshots 
    - displaying what appears to be several linear relationships with substantially different slope values based on channel type - no correlation when assesing data overall, but indication that individual channels may see strong linear relationships between viewership and screenshots. Assessed further through the analysis.
<img width="1019" alt="Screen Shot 2022-05-17 at 12 06 38 AM" src="https://user-images.githubusercontent.com/79600550/168727185-9a8426e0-337f-4712-af4b-3484380efaf1.png">


## All Datasets
<img width="655" alt="Screen Shot 2022-05-17 at 5 28 03 PM" src="https://user-images.githubusercontent.com/79600550/168913175-4293b3d0-4104-4016-babb-ddedfdb025c6.png">

- Metrics that share the strongest correlation coefficients with viewership in 2021-2022 data, also share similar correlation values across all other data samples (21-22 Bangers, 2022 Data, and 2022 Bangers)
    -   i.e unique completers, unique topsnap views, and subscribers.
- Shares
    - appear to form an asymptotic relationship with UVs
    - are only strongly correlated with UVs when assessing "overall" data (2021-2022 data and 2022 data - i.e data that doesn't isolate for banger episodes)
- Screenshots 
    - not strongly correlated with UVs given the assumption of linearity across all data sets (i.e Pearson correlatin coefficients < 0.7)
        - strong Spearman correlations between these two metrics but plotting the data revealed no apparent non-linear relationship 
        - indication of linear relationships on a individual channel-level 
