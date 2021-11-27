\name{lm_coef}
\alias{lm_coef}
\title{Estimated Coefficients of Linear Regression Model}
\description{
The function \code{lm_coef} is used to fit linear regression models. Compared to the famous \code{lm} function, it provides a faster fitting of linear regression and output its estimated coefficients with testing results, and the quantile of residuals.
}
\usage{
lm_coef(y,x)

lm_coef(y,x)$coefficients

lm_coef(y,x)$residuals
}
\arguments{
\item{Y}{A size N numeric vector containing the response variable. NAs not allowed.}
\item{X}{A size N*M numeric matrix containing the independent variable. M represents the number of covariates. NAs not allowed.}
}
\examples{
# Given the data below:
n = 100
m = 5
y = rnorm(n)
x = matrix(rnorm(n*m),n,m)

# To obtain the coefficients of the MLR model:
est = lm_coef(y,x)$coefficients

# To check the distribution of the residuals:
res = lm_coef(y,x)$residuals
}

