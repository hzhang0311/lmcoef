\name{cpr_coef}
\alias{cpr_coef}
\title{Estimated Coefficients of Constrained Polynomial Regression}
\description{
The function \code{cpr_coef} is used to fit the following Polynomial Regression model with the parameter constraints and returns the estimated coefficients \eqn{\beta's}:

for \code{i = 1,2,...,n},\deqn{Y_i = \beta_0 + \sum_{j=1}^p { \beta_j * (X_i) ^ j } + \epsilon_i} \deqn{\epsilon_i ~ N(0,\sigma^2)} where coefficient \eqn{\beta_j = \beta_{j-1} / j} for \code{j = 2,...,p}, and predictor \eqn{X_i = i / n}
}

\usage{
cpr_coef(p,y)
}

\arguments{
\item{p}{A positive integer indicates the polynomial degree. Larger or equal to 2. NA is not allowed}
\item{y}{A numeric vector that contains the true outcomes. NA is not allowed}
}

\examples{
cpr_coef(p = 5, y = c(1,3,3,3,4,5,3,2,-1))

# $coefficients
#                 Estimate
# (intercept)  3.452393951
# b1          -1.100167971
# b2          -0.550083985
# b3          -0.183361328
# b4          -0.045840332
# b5          -0.009168066

# $residuals
#         0%        25%        50%        75%       100%
# -2.5637723 -0.1786186  0.1226534  0.8417168  2.5901246
}

