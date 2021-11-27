# lmcoef
<!-- badges: start -->
[![R-CMD-check](https://github.com/hzhang0311/lmcoef/workflows/R-CMD-check/badge.svg)](https://github.com/hzhang0311/lmcoef/actions)
<!-- badges: end -->

## Overview
`lmcoef` is a package for statistical analysis that allows users to obtain estimation results from linear regression model with better efficiency. As **a good substitution** for the well-known `lm` function, this package aims to elevate efficiency by allowing users to seperately obtain different estimates that are more useful for them adjusting for different scenrios when analyzing larger datasets. 

So far, this package includes one function:

* `lm_coef()`: Compute estimated coefficients of linear regression model with testing results, and returns alongside with quantile values of residuals. 

## Installation
Github installation is used to insatll `lmcoef`:

```r
# install.packages("devtools")
devtools::install_github("hzhang0311/lmcoef")
```

## Usage
```r
## SKIP: Download & Installation
# install.packages("devtools")
# devtools::install_github("hzhang0311/lmcoef")

library(lmcoef)

## Simulated data
# n = 100
# m = 5
# y = rnorm(n)
# x = matrix(rnorm(n*m),n,m)

# To obatin both estimated coefficients and quantiled residuals
lm_coef(y,x)

#> $coefficients
#>                Estimate    Std_Err     t.stat   p.value
#>                   <num>      <num>      <num>     <num>
#> (intercept) -0.11161361 0.09525374 -1.1717504 0.2442587
#> x1           0.15156149 0.09368936  1.6177022 0.1090777
#> x2          -0.08187926 0.09525251 -0.8596021 0.3921954
#> x3          -0.02033290 0.09324961 -0.2180481 0.8278643
#> x4           0.05336594 0.09686270  0.5509442 0.5829791
#> x5           0.07745192 0.10141040  0.7637473 0.4469306

#> $residuals
#>          0%         25%         50%         75%        100% 
#>        <num>      <num>       <num>       <num>       <num>
#> -1.67210902 -0.71892641  0.03148926  0.63096596  2.15498647 

# To obatin estimated coefficients alone
lm_coef(y,x)$coefficients

#>                Estimate    Std_Err     t.stat   p.value
#>                   <num>      <num>      <num>     <num>
#> (intercept) -0.11161361 0.09525374 -1.1717504 0.2442587
#> x1           0.15156149 0.09368936  1.6177022 0.1090777
#> x2          -0.08187926 0.09525251 -0.8596021 0.3921954
#> x3          -0.02033290 0.09324961 -0.2180481 0.8278643
#> x4           0.05336594 0.09686270  0.5509442 0.5829791
#> x5           0.07745192 0.10141040  0.7637473 0.4469306

# To obatin quantiled residuals alone
lm_coef(y,x)$residuals

#>          0%         25%         50%         75%        100% 
#>        <num>      <num>       <num>       <num>       <num>
#> -1.67210902 -0.71892641  0.03148926  0.63096596  2.15498647 
```
