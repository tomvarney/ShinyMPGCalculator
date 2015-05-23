---
title       : Shiny App - MPG Calculator
subtitle    : 
author      : Tom Varney
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---


## Shiny App: MPG Calculator

1. My Shiny application is an MPG calculator.

2. The MPG Calculator will estimate the MPG of your car based on the weight of your car. it will give you an expected MPG value and will provide a plot indicating the confidence interval for the estimate. The confidence estimate is based on the user's selection below. 
3. To use the MPG calculator, the user will use the slider to enter the wieght of hte car, and then use the dropdown box to choose a confidence level of 90%, 95% or 99%.

--- .class #id 

## Linear Model
The calculator is based on a linear regression model using the "mtcars" dataset, and fitting a model of MPG based on weight (WT):


```
## 
## Call:
## lm(formula = mpg ~ wt, data = mtcars)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -4.5432 -2.3647 -0.1252  1.4096  6.8727 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  37.2851     1.8776  19.858  < 2e-16 ***
## wt           -5.3445     0.5591  -9.559 1.29e-10 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.046 on 30 degrees of freedom
## Multiple R-squared:  0.7528,	Adjusted R-squared:  0.7446 
## F-statistic: 91.38 on 1 and 30 DF,  p-value: 1.294e-10
```

--- .class #id 

## Chart
Based on the user's selections, a prediction is calculated a ggplot chart is displayed as below:

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png) 

--- .class #id 

## Notes

This application is based on a very simple linear model and in fact if they weight is chosen to be 
too high then the MPG goes negative -- so it definitely has its limitations.




