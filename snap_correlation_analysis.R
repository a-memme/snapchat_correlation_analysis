#Importing/Donwloading libraries
library(readr)
library(tidyverse)
library(ggplot2)
install.packages('olsrr')
library(olsrr)

install.packages('Hmisc')
library(Hmisc)
library(plyr)
library(dplyr)
library(MASS)

install.packages('gam')
install.packages('mgcv')
library(gam)
library(mgcv)

install.packages('drc')
library(drc)
library(nlme)
library(broom)

install.packages("devtools")
library(devtools)
install_github("OnofriAndreaPG/aomisc")
install_github("OnofriAndreaPG/agriCensData")
install_github("OnofriAndreaPG/drcSeedGerm")
install_github("OnofriAndreaPG/lmDiallel")
library(aomisc)

#Reading in data 
# "Yearly Data" - Sept 2021-Mar2022
yearly_updated <- read_csv("Documents/Data_Analytics/Projects/snapchat_correlation_analysis/yearly_updated.csv")
# Yearly banger data 
inaugural_bangers_2 <- read_csv("Documents/Data_Analytics/Projects/snapchat_correlation_analysis/in_bangers.csv")
#2022 Data 
inaugural_Mar8cutoff <- read_csv("Documents/Data_Analytics/Projects/snapchat_correlation_analysis/in_2022.csv")
# 2022 Bangers 
bangers_2022 <- read_csv("Documents/Data_Analytics/Projects/snapchat_correlation_analysis/bangers_2022.csv")



#Yearly Data 

#Pearson correlation matrix for linear relationships 
yearly_matrix <- as.matrix(yearly_updated[, c('unique_viewers_diff', 'avg_time_spent_per_user', 'unique_topsnaps_peruser', 'completion_rate', 'drop_off_rate', 'unique_completers_diff', 'unique_topsnap_views_diff', 'shares_diff', 'screenshots_diff', 'subscribers_diff')])
cor(yearly_matrix)

#Spearman correlation to catch potential non-linear relationships
rcorr(yearly_matrix, type='spearman')

#Linear Regression - UVs~unique completers (0.92 correlation)
#LR Completers
yearly_comp <- lm(unique_viewers_diff ~ unique_completers_diff, yearly_updated)
summary(yearly_comp)
#Check error rate (to help gauge RSE)
sigma(yearly_comp)/mean(yearly_updated$unique_viewers_diff)

#Visualize using ggplot2
yvals <- yearly_comp$coefficients['unique_completers_diff']*yearly_updated$unique_completers_diff + yearly_comp$coefficients['(Intercept)']
plt <- ggplot(yearly_updated, aes(x=unique_completers_diff, y= unique_viewers_diff))
plt + geom_point() + geom_line(aes(y=yvals), color='orange')

#Check normality of residuals
ols_plot_resid_hist(yearly_comp)
ols_plot_resid_qq(yearly_comp)


# Linear regression - UVs~subscribers (0.89 correlation)
yearly_subs <- lm(unique_viewers_diff ~ subscribers_diff, yearly_updated)
summary(yearly_subs)
#Check error rate
sigma(yearly_subs)/mean(yearly_updated$unique_viewers_diff)

#Visualize regression line
yvals <- yearly_subs$coefficients['subscribers_diff']*yearly_updated$subscribers_diff + yearly_subs$coefficients['(Intercept)']
plt <- ggplot(yearly_updated, aes(x=subscribers_diff, y= unique_viewers_diff))
plt + geom_point() + geom_line(aes(y=yvals), color='blue')

#Robust Regression (to help account better for outliers )
yearly_subs_robust <- rlm(unique_viewers_diff ~ subscribers_diff, data=yearly_updated)
summary(yearly_subs_robust)
#Error rate
sigma(yearly_subs_robust)/mean(yearly_updated$unique_viewers_diff)

#Compare RSE of ols vs robust linear regression
summary(yearly_subs)$sigma
summary(yearly_subs_robust)$sigma

#Visualize RLM
yvals <- yearly_subs_robust$coefficients['subscribers_diff']*yearly_updated$subscribers_diff + yearly_subs_robust$coefficients['(Intercept)']
plt <- ggplot(yearly_updated, aes(x=subscribers_diff, y= unique_viewers_diff))
plt + geom_point() + geom_line(aes(y=yvals), color='blue')




#Shares - lower Pearson correlation (0.59) but significant Spearman correlation coefficient (0.89)
#indicating potential non-linear relationship 

#Plot data to visualize relationship
plot(unique_viewers_diff~shares_diff, data=yearly_updated)

#Try polynomial regression to fit a curve
#polynomial regression ^2
poly_regress2 <- lm(unique_viewers_diff ~ poly(shares_diff, 2), data=yearly_updated)
summary(poly_regress2)
#Polynomial Regression ^3
poly_regress3 <- lm(unique_viewers_diff ~ poly(shares_diff, 3), data=yearly_updated)
summary(poly_regress3)
#Polynomial Regression ^4
poly_regress4 <- lm(unique_viewers_diff ~ poly(shares_diff, 4, raw=TRUE), data=yearly_updated)
summary(poly_regress4)
#Polynomial Regression ^5
poly_regress5 <- lm(unique_viewers_diff ~ poly(shares_diff, 5), data=yearly_updated)
summary(poly_regress)
#Polynomial Regression ^6
poly_regress6 <- lm(unique_viewers_diff ~ poly(shares_diff, 6), data=yearly_updated)
summary(poly_regress6)

#Visualize 
#Assign variable to Shares
shares = yearly_updated$shares_diff

#Plot model in highlighted points
plot(unique_viewers_diff~shares_diff, data=yearly_updated)
#Highlight points based on different polynomial levels
points(shares, fitted(poly_regress2), col='red', pch=20)
points(shares, fitted(poly_regress3), col='blue', pch=20)
points(shares, fitted(poly_regress4), col='blue', pch=20)
points(shares, fitted(poly_regress5), col='purple', pch=20)
points(shares, fitted(poly_regress6), col='red', pch=20)


#Try Non-linear regression methods 

# Generalized additive model (GAM)
gam_model <- gam(unique_viewers_diff ~ s(shares_diff), data=yearly_updated)
gam_model5 <- gam(unique_viewers_diff ~ s(shares_diff, k=5), data=yearly_updated)

#Assess models with different k values
uvs = yearly_updated$unique_viewers_diff
summary(gam_model)
summary(gam_model5)
sigma(gam_model)
sigma(gam_model5)
cor(uvs, predict(gam_model))
cor(uvs, predict(gam_model5))

#Visualize 
ggplot(data=yearly_updated, aes(shares_diff, unique_viewers_diff)) + geom_point() + stat_smooth(method='gam', formula = y~s(x), size=1, se=FALSE)
ggplot(data=yearly_updated, aes(shares_diff, unique_viewers_diff)) + geom_point() + stat_smooth(method='gam', formula = y~s(x, k=5), size=1, se=FALSE)

#Asymptotic Regression
model <- drm(unique_viewers_diff ~ shares_diff, fct = DRC.asymReg(), data = yearly_updated)
cor(uvs, predict(model))
summary(model)
#Visualize
plot(model, log="", main = "Asymptotic regression")

##Michaelis Menten Regression***
#2 self starting function - 2 parameters
mm_model <- drm(unique_viewers_diff ~ shares_diff, fct = MM.2(), data = yearly_updated)
cor(uvs, predict(mm_model))
summary(mm_model)

#3 self-starting function - 3 parameters
mm_model3 <- drm(unique_viewers_diff ~ shares_diff, fct = MM.3(), data = yearly_updated)
cor(uvs, predict(mm_model3))
summary(mm_model3)

#Visualize 
#2 parameters
mmdf <- data.frame(S=seq(0, max(shares))) #length.out=165946
mmdf$v <- predict(mm_model, newdata=mmdf)
ggplot(data=yearly_updated, aes(shares_diff, unique_viewers_diff)) + geom_point() + geom_line(data=mmdf, aes(x=S, y=v), colour='purple')
#3 parameters
mmdf <- data.frame(S=seq(0, max(shares))) #length.out=165946
mmdf$v <- predict(mm_model3, newdata=mmdf)
ggplot(data=yearly_updated, aes(shares_diff, unique_viewers_diff)) + geom_point() + geom_line(data=mmdf, aes(x=S, y=v), colour='purple')



# Removing the outlier - Shares relationship 
#Visualize outlier/extreme outliers 
boxplot(yearly_updated$shares_diff, main='Shares', col='orange', horizontal = TRUE, notch = TRUE)
ggplot(yearly_updated, aes(x="", y=shares_diff)) + geom_boxplot(outlier.colour="red",outlier.size=2)

#Subset 
no_eggs <- subset(yearly_updated, yearly_updated$shares_diff < 150000)
#Correlation Matrix (Pearson)
no_eggs_matrix <- as.matrix(no_eggs[, c('unique_viewers_diff', 'avg_time_spent_per_user', 'unique_topsnaps_peruser', 'completion_rate', 'drop_off_rate', 'unique_completers_diff', 'unique_topsnap_views_diff', 'shares_diff', 'screenshots_diff', 'subscribers_diff')])
cor(no_eggs_matrix)
#Spearman correlation
rcorr(no_eggs_matrix, type='spearman')

#GAM
gam_model_noeggs <- gam(unique_viewers_diff ~ s(shares_diff, k=4), data=no_eggs)
#Visualize
ggplot(data=no_eggs, aes(shares_diff, unique_viewers_diff)) + geom_point() + stat_smooth(method='gam', formula = y~s(x, k=4), size=1, level=0.95, se=FALSE)
#Assess
cor(no_eggs$unique_viewers_diff, predict(gam_model_noeggs))
summary(gam_model_noeggs)

#2 self starting function - 2 parameters
mm_model_noeggs <- drm(unique_viewers_diff ~ shares_diff, fct = MM.2(), data = no_eggs)
mmdf <- data.frame(S=seq(0, max(shares))) #length.out=165946
mmdf$v <- predict(mm_model_noeggs, newdata=mmdf)
ggplot(data=no_eggs, aes(shares_diff, unique_viewers_diff)) + geom_point() + geom_line(data=mmdf, aes(x=S, y=v), colour='purple')

cor(no_eggs$unique_viewers_diff, predict(mm_model_noeggs))

#3 self starting function - 3 parameters
mm_model_noeggs3 <- drm(unique_viewers_diff ~ shares_diff, fct = MM.3(), data = no_eggs)
mmdf <- data.frame(S=seq(0, max(shares))) #length.out=165946
mmdf$v <- predict(mm_model_noeggs3, newdata=mmdf)
ggplot(data=no_eggs, aes(shares_diff, unique_viewers_diff)) + geom_point() + geom_line(data=mmdf, aes(x=S, y=v), colour='purple')

cor(no_eggs$unique_viewers_diff, predict(mm_model_noeggs3))
