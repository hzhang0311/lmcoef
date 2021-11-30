\name{lm_coef}
\alias{lm_coef}
\title{Estimation of Linear Regression Model}
\description{
The function \code{lm_coef} is used to fit linear regression models. Compared to the famous \code{lm} function, it provides a faster fitting of linear regression and output its estimated coefficients with testing results, ANOVA result, R squared, adjusted R squared, residuals, and fitted values.
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
n = 100
m = 5
y = rnorm(n)
x = matrix(rnorm(n*m),n,m)

# To obtain the coefficients of the MLR model:
lm_coef(y,x)$coefficients

# >                Estimate    Std_Err     t.stat     p.value
# > (intercept) -0.05555479 0.09826747 -0.5653426 0.573187650
# > x1           0.25803447 0.09711817  2.6569124 0.009266161
# > x2          -0.18057879 0.08921766 -2.0240251 0.045805768
# > x3          -0.03610188 0.10541459 -0.3424752 0.732757926
# > x4          -0.05920392 0.11074989 -0.5345731 0.594207248
# > x5           0.10506094 0.09340763  1.1247575 0.263555674

# To obtain the ANOVA table

lm_coef(y,x)$anova
# >           Df     Sum.Sq   Mean.Sq   F.value    p.value
# > x1         1  6.4501796 6.4501796 6.8311334 0.01043229
# > x2         1  4.1420112 4.1420112 4.3866423 0.03891195
# > x3         1  0.1315731 0.1315731 0.1393440 0.70977458
# > x4         1  0.3139103 0.3139103 0.3324502 0.56559806
# > x5         1  1.1945294 1.1945294 1.2650795 0.26355567
# > Residuals 94 88.7578751 0.9442327        NA         NA

# To store the residuals:
res = lm_coef(y,x)$residuals

# To store the fitted values:
Yhat = lm_coef(y,x)$fitted.values

# To store the R squared and adjusted R squared:
lm_coef(y,x)$R2
lm_coef(y,x)$R2_adj
}

