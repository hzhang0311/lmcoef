#' A faster implementation of linear regression that output its estimated coefficients
#' @param Y A size n numeric vector containing the response variable. NAs not allowed.
#' @param X A size n*m numeric matrix containing the independent variable. NAs not allowed.
#' @return A data frame containing estimated coefficient, standard error, t-stistics, and p.value; A vector containing quantiles of residuals
#' @examples
#' y = rnorm(100)
#' x = matrix(rnorm(2*100),100,2)
#' fit = lm_coef(y,x)
#' @importFrom stats pt
#' @export

lm_coef = function(Y,X){
  X = cbind(1, X) # design matrix
  n = nrow(X)
  p = ncol(X)
  #### Estimation: betahat and var(betahat) ####
  betahat = solve(t(X)%*%X)%*%t(X)%*%Y
  Yhat = X%*%betahat
  epsilonhat = Y - Yhat ## residual
  ## estimated sigma^2
  sigma_squared = t(epsilonhat)%*%epsilonhat/(n-p)
  ## variance of betahat
  var_betahat = diag( solve(t(X)%*%X) )*c(sigma_squared)
  se_betahat = sqrt(var_betahat) ## se of betahat
  #### Inference: t statistic and p val for H0: beta=0 ####
  t_statistic = c(betahat/se_betahat)
  p_value = c(2*( 1-pt(q=abs(t_statistic),df=n-p) ))

  if (is.null(colnames(X)) == TRUE){
    variables = c()
    variables = sapply(c(1:(p-1)), function(i) append(variables,paste0("x", i)))
    variables = append("(intercept)", variables)
  } else {
    variables = append("(intercept)", colnames(X)[-1])
  }

  rst = data.frame("Estimate" = betahat ,
                   "Std_Err" = se_betahat,
                   "t.stat" = t_statistic,3,
                   "p.value" = p_value,3,
                   row.names = variables)

  return(list(coeffients = rst,
              residuals = quantile(epsilonhat)))
}
