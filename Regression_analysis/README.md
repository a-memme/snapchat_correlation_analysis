# Regression 
The purpose of performing regression analyses on the following metrics was to provide supporting insight on their corresponding correlation coefficients, and to investigate whether sufficient linear/non-linear models could be built to accurately depict these relationships. 

**Notes**
- regression was only performed on 2021-2022 Data in this circumstance 
    - due to data sample size 
- multiple regression was not performed due to multicolinearity of predictor variables (i.e those strongly correlated with UVs)

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
    - In order to control for outlier values, a robust linear model is also fitted to the data and compared to the olsr model.(see lines 82-89 in [snap_correlation_analysis.R](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/snap_correlation_analysis.R) for reference).
    - Model provides a slightly more accurate representation when comparing RSE values as well as when visualizing the regression line (See Image Below)
      -  OLS Regression - RSE = 741072 on 252 degrees of freedom
      -  RLM Regression - RSE = 446400 on 252 degrees of freedom

![Screen Shot 2022-05-19 at 10 19 05 PM](https://user-images.githubusercontent.com/79600550/169435666-0ffb3a8b-956e-4ddf-957d-a41bc27f7423.png)


## Shares 
- Different models were fit to the data and compared to assess the most accurate representation of the asymptotic relationship between viewership and shares.


### Polynomial Regression 
- Polynomial models from the 2nd to the 6th degree tried and tested to fit the curved relationship. 
- Polynomial ^4
    -  best visual relationship of the asymptote (see scatterplot highlighted in blue below)
    -  2/4 statistically significant polynomials (first and second)
    -  statistically significant intercept 
    -  R2 = 0.61
    -  RSE = 1025000 on 249 degrees of freedom
- Polynomial ^6
    - overfit visual representation (See scatterplot highlighted in red below)
    - 5/6 statistically significant polynomials (first, second, third, fifth, and sixth)
    - statistically significant intercept 
    - R2 = 0.64
    - RSE = 985900 on 247 degrees of freedom
- Summary 
    -  Bias vs Variance 
        -  The 6th degree polynomial renders the best metrics (lower RSE and higher R2 value), however the curve is obviously overfit (high variance) - the model captures too much noise in the data, and would perform poorly on unseen data. 
            - although the core purpose of the analysis isn't necessarily to build a predictive model, we would like to have confidence in our regression model to support our understanding of how the following two metrics interact with one another. 
        - 4th degree polynomial provides the best visual representation, but is potentially too high in bias as its not as accurate as we would like (based on RSE and R2 values)

![Screen Shot 2022-05-23 at 6 18 09 PM](https://user-images.githubusercontent.com/79600550/169914038-24650332-0228-4dc8-9574-b9302e32f5a7.png)

### GAM - Generalized Additive Model
*(see lines 136-153 in [snap_correlation_analysis.R](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/snap_correlation_analysis.R) for reference)*

- "Middle-ground" model between simple linear models and ML regression
    - i.e offer a fair amount of interpretability (such as in linear regression) while also maintaining an adequate level of complexity (such as in machine learning).
- Consisted of smooths and splines 
    - smooths are functions constructed of many smaller (basis) functions that can take a wide variety of shapes, and ultimately serve as parameters for the model. 
    - k = number of basis functions to use for each smooth term before any additional constraints are applied - (i.e puts a limit on the wiggliness of the function).
*See https://noamross.github.io/gams-in-r-course/chapter1 for more info*

#### R2 in Non-linear regression 
- Although provided in summary statistics, the R2 value is often considered incompatible when dealing with statistically nonlinear regression models:
    - explained variance + error variance != total variance (as it would for linear regression - including polynomial regression). Thus, a value between 0 and 1 would not always be representing a percentage of the whole. (see the following [resource](https://statisticsbyjim.com/regression/r-squared-invalid-nonlinear-regression/) for overview). 
    - Study conducted by Spiess & Neumeyer, 2010 found that you will often experience many of the following issues if relying on R2 to assess nonlinear models:
        - high values for both well-performing and extremely poor performing models 
        - R2 value not always increasing for better models 
        - Model selection will only lead to the correct decision (the best model) approxiamtely 28-43% of the time 
- Given the above information, other model cues are relied on to determine adequacy: in our circumstance, the correlation of actual y to predicted y, and visual representation.
    
**Summary**
- Best performing GAM - k=5
    - better visual representation of the asymptote (vs. polynomials) - see image below
    - correlation of y to predicted y = 0.78

![Screen Shot 2022-05-23 at 7 17 12 PM](https://user-images.githubusercontent.com/79600550/169919388-acc2322b-7f15-41eb-958d-732b73ea3b42.png)

### Michaelis-Menten Model 
*(See lines 162-181 in [snap_correlation_analysis.R](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/snap_correlation_analysis.R) for reference)*
- equation for rectangular hyperbolas/saturation curve 
- originally developed to model the relation between substrate concetration and reaction rate in enzyme activity 

**Summary - Best Model Overall**
- 3 parameter MM Model 
- best visual representation of the asymptote overall - see image below
    -  vs. polynomials and GAM's
- highest correation of y to predicted y = 0.79

![Screen Shot 2022-05-23 at 7 26 52 PM](https://user-images.githubusercontent.com/79600550/169920194-98839ee2-59f4-4759-9d43-ef3c62badedb.png)

### Removing Outliers 
- Extreme outlier appears to be holding substantial weight (x > 150k)
    - interested to see differences in correlation strength/model performance when outlier is removed 
    - (see lines 185-220 in [snap_correlation_analysis.R](https://github.com/a-memme/snapchat_correlation_analysis/blob/main/snap_correlation_analysis.R) for reference). 

![Screen Shot 2022-05-23 at 9 12 19 PM](https://user-images.githubusercontent.com/79600550/169929953-85097a51-2970-47e3-b447-338fcba7141d.png)

**Summary**
- 3 parameter MM Model 
    - best performing model again
    - correlation of predicted y to actual y = 0.74
    - Ony slight changes in regression line after outlier removal
        - great indication of robust nature of MM equation in dealing with outliers 
    - aymptotic relationship still apparent with removal of major outlier **

![Screen Shot 2022-05-23 at 9 30 35 PM](https://user-images.githubusercontent.com/79600550/169930470-51922488-ef1c-4271-9c5c-7eb69fdca275.png)

## References
Spiess, Andrej-Nikolai, Natalie Neumeyer. An evaluation of R2 as an inadequate measure for nonlinear models in pharmacological and biochemical research: a Monte Carlo approach. BMC Pharmacology. 2010; 10: 6.
