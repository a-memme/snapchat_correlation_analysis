# Regression 
The purpose of performing regression analyses on the following metrics was to provide supporting insight on their corresponding correlation coefficients, and to investigate whether sufficient linear/non-linear models could be built to accurately depict these relationships. 

*(Note multiple regression was not performed due to multicolinearity of predictor variables (i.e those strongly correlated with UVs)*

## Unique Completers 
![Screen Shot 2022-05-17 at 5 58 32 PM](https://user-images.githubusercontent.com/79600550/168916960-c8950414-8164-4b14-96df-64b21a7e5aa5.png)

![Screen Shot 2022-05-17 at 6 01 30 PM](https://user-images.githubusercontent.com/79600550/168917346-01f43a19-8b02-420d-9ea1-fc242b63b496.png)
- Significant p-value < 2e-16
    - Expected given the extremely high correlation coefficient of ~0.95
    - Sufficient evidence to reject the 'hypothetical' null hypothesis - i.e there is an extremely low probability that the variance contributed to the model by the unique completer metric is merely due to chance. 
- R2 = 0.90
- Significant intercept value: 6.22e-07
    - also expected - statistically significant intercepts indicate that there is substantial variability in y when x=0. This is expected as we assume there to be multiple influencers on viewership, in addition to the contextual understanding of how variabe the initial distribution window for social content is.
- Approximate normal distribution of the residuals (for validity of the model - see Figure below)

![Screen Shot 2022-05-19 at 10 20 24 PM](https://user-images.githubusercontent.com/79600550/169435780-55340dab-2974-4c67-b366-fd0fabad4d1f.png)

## Subcribers 
- Significant p-value < 2e-16
- R2 = 0.80
    -  80% of the variability in this model can be explained by subcribers - less than unique completers, but expected based on correlation values.
- Significant intercept value: 1.05e-15
- RLM comparison 
    - In order to control for a couple of outlier values, a robust linear model is fitted to the data as well and compared to ols regression.(see lines 82-89 in [snap_correlation_analysis.R](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/snap_correlation_analysis.R) for reference).
    - Model provides a slightly more accurate representation when comparing RSE values as well as when visualizing the regression line (See Image Below)
      -  OLS Regression - RSE = 741072 on 252 degrees of freedom
      -  RLM Regression - RSE = 446400 on 252 degrees of freedom

![Screen Shot 2022-05-19 at 10 19 05 PM](https://user-images.githubusercontent.com/79600550/169435666-0ffb3a8b-956e-4ddf-957d-a41bc27f7423.png)


## Shares 
- Different models were fit to the data and compared to assess the most accurate representation of the asymptotic relationship between viewership and shares.


### Polynomial Regression 
- 
