\name{lm_coef}
\alias{lmcoef}
\title{Estimated Coefficients of Linear Regression Model}
\usage{
lm_coef()
}
\description{
This package provides a faster fitting of linear regression and output its estimated coefficients with testing results`
}
\examples{
y = rnorm(100)
x = matrix(rnorm(2*100),100,2)
fit = lm_coef(y,x)
}

