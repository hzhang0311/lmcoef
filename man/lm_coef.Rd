\name{lmcoef}
\alias{lmcoef}
\title{Estimated Coefficients of Linear Regression Model}
\usage{
lmcoef()
}
\description{
This package provides a faster fitting of linear regression and output its estimated coefficients with testing results`
}
\examples{
y = rnorm(100)
x = matrix(rnorm(2*100),100,2)
fit = lr_coef(y,x)
}

