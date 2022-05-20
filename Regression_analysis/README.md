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
- Significant intercept value: 6.22e-07
    - also expected - statistically significant intercepts indicate that there is substantial variability in y when x=0. This is expected as we assume there to be multiple influencers on viewership, in addition to the contextual understanding of how variabe the initial distribution window for social content is.
- Approximate normal distribution of the residuals (for validity of the model - see Figure below)

![Screen Shot 2022-05-17 at 5 59 22 PM](https://user-images.githubusercontent.com/79600550/168922690-3a885d77-11c3-4810-a5a5-2bab5ba8b0e7.png)


### Subcribers 
![Screen Shot 2022-05-17 at 6 31 33 PM](https://user-images.githubusercontent.com/79600550/168923062-03ea6dc0-0910-4bb8-93b6-d30e83f8fdff.png)

![Screen Shot 2022-05-17 at 6 30 28 PM](https://user-images.githubusercontent.com/79600550/168923085-19f2e477-da87-48db-8841-882b374c280b.png)
- Significant p-value < 2e-16
- R2 = 0.80
    -  80% of the variability in this model can be explained by subcribers - less than unique completers, but expected based on correlation values.
- Significant intercept value: 1.05e-15
- RLM comparison 
    - A robust linear regression model is also used to fit the linear relationship between UVs and subscribers to help account for outliers (see lines 82-85 in [snap_correlation_analysis.R](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/snap_correlation_analysis.R) for code).
    - Model provides a slightly more accurate representation when comparing RSE values and visual representation 
      -  OLSR Regression - RSE = 741072 on 252 degrees of freedom
      -  RLM Regression - RSE = 446400 on 252 degrees of freedom

![Screen Shot 2022-05-19 at 10 17 43 PM](https://user-images.githubusercontent.com/79600550/169435514-262f5b88-5020-420a-892a-90f33237c3fe.png)


### Shares 
