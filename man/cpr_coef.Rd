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
p = 5
y = c(1,3,3,3,4,5,3,2,-1)

cpr_res = cpr_coef(p, y)

cpr_res$coefficients

#                 Estimate
# (intercept)  3.452393951
# b1          -1.100167971
# b2          -0.550083985
# b3          -0.183361328
# b4          -0.045840332
# b5          -0.009168066

cpr_res$residuals
# [1]  2.32310324  0.17861859  0.01715603 -0.16327333 -1.36488198 -2.59012461 -0.84171677 -0.12265344  2.56377227

cpr_res$fitted.values
# [1] 3.323103 3.178619 3.017156 2.836727 2.635118 2.409875 2.158283 1.877347 1.563772
}

