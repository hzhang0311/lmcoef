\name{lm_coef}
\alias{lm_coef}
\title{Estimation of Linear Regression Model}
\description{
The function \code{lm_coef} is used to fit linear regression models. Compared to the famous \code{lm} function, it provides a more overall fitting of linear regression and output its estimated coefficients with testing results, ANOVA result, R squared, adjusted R squared, residuals, and fitted values.
}
\usage{
lm_coef(y,x)$coefficients

lm_coef(y,x)$anova

lm_coef(y,x)$residuals

lm_coef(y,x)$fitted.values

lm_coef(y,x)$R2

lm_coef(y,x)$R2_adj
}
\arguments{
\item{Y}{A size N numeric vector containing the response variable. NAs not allowed.}
\item{X}{A size N*M numeric matrix or data frame containing the independent variable. M represents the number of covariates. NAs not allowed.}
}
\examples{
# Given the data below:
y = c(78.5, 74.3, 104.3, 87.6, 95.9, 109.2, 102.7, 72.5, 93.1, 115.9, 83.8, 113.3, 109.4)
x = data.frame(X1 = c(7, 1, 11, 11, 7, 11, 3, 1, 2, 21, 1, 11, 10),
                     X2 = c(26, 29, 56, 31, 52, 55, 71, 31, 54, 47, 40, 66, 68),
                     X3 = c(6, 15, 8, 8, 6, 9, 17, 22, 18, 4, 23, 9, 8),
                     X4 = c(60, 52, 20, 47, 33, 22, 6, 44, 22, 26, 34, 12, 12))

# To obtain the coefficients of the MLR model:
lm_coef(y,x)$coefficients

# >               Estimate    Std_Err     t.stat    p.value
# > (intercept) 62.4053693 70.0709592  0.8906025 0.39913356
# > X1           1.5511026  0.7447699  2.0826603 0.07082169
# > X2           0.5101676  0.7237880  0.7048577 0.50090110
# > X3           0.1019094  0.7547090  0.1350314 0.89592269
# > X4          -0.1440610  0.7090521 -0.2031741 0.84407147

# To obtain the ANOVA table

lm_coef(y,x)$anova
# >           Df       Sum.Sq      Mean.Sq      F.value      p.value
# > X1         1 1450.0763281 1450.0763281 242.36791816 2.887559e-07
# > X2         1 1207.7822656 1207.7822656 201.87052753 5.863323e-07
# > X3         1    9.7938691    9.7938691   1.63696188 2.366003e-01
# > X4         1    0.2469747    0.2469747   0.04127972 8.440715e-01
# > Residuals  8   47.8636394    5.9829549           NA           NA

# To store the residuals:
res = lm_coef(y,x)$residuals

# To store the fitted values:
Yhat = lm_coef(y,x)$fitted.values

# To store the R squared and adjusted R squared:
lm_coef(y,x)$R2
lm_coef(y,x)$R2_adj
}

