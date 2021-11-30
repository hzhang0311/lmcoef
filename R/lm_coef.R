#' lm_coef
#'
#' A new implementation of fitting linear regression that output its estimated coefficients, ANOVA table, R squared, adjusted R squared, fitted values, and residuals
#'
#' @param Y A size n numeric vector containing the response variable. NAs not allowed.
#' @param X A size n*m numeric matrix or data frame containing the independent variable. NAs not allowed.
#'
#' @return A matrix containing estimated coefficient, standard error, t-stistics, and p.value; A matrix contains ANOVA table; Two scalars that separately contains R squared and adjusted R squared; A vector containing residuals; A vector containing fitted values.
#'
#' @examples
#' y = rnorm(100)
#' x = matrix(rnorm(2*100),100,2)
#' fit = lm_coef(y,x)
#'
#' @importFrom stats pt
#'
#' @export
#' A list containing a data frame of estimated coefficients for linear regression and a vector containing the quantile of residuals.
#'
lm_coef = function(Y,X){
  X = as.matrix(X)
  X = cbind(1, X) # design matrix
  n = nrow(X)
  p = ncol(X)

  #### Estimation: betahat and var(betahat) ####
  betahat = solve(t(X) %*% X) %*% t(X) %*% Y
  Yhat = X %*% betahat
  epsilonhat = Y - Yhat ## residual

  ## estimated sigma^2
  sigma_squared = t(epsilonhat) %*% epsilonhat/(n-p)

  ## variance of betahat
  var_betahat = diag( solve(t(X) %*% X) )*c(sigma_squared)
  se_betahat = sqrt(var_betahat) ## se of betahat

  #### Inference: t statistic and p value ####
  t_statistic = c(betahat / se_betahat)
  p_value = c(2*( 1 - pt(q = abs(t_statistic),df = n-p) ))

  if (is.null(colnames(X)) == TRUE){
    variables = c()
    variables = sapply(c(1:(p-1)), function(i) append(variables,paste0("x", i)))
    variables = append("(intercept)", variables)
  } else {
    variables = append("(intercept)", colnames(X)[-1])
  }

  rst = data.frame("Estimate" = betahat ,
                   "Std_Err" = se_betahat,
                   "t.stat" = t_statistic,
                   "p.value" = p_value,
                   row.names = variables)
  rst = as.matrix(rst)

  #### ANOVA table ####
  SSR_all = c()
  for (i in 2:p){
    Yhat_x = X[,c(1:i)] %*% solve(t(X[,c(1:i)]) %*% X[,c(1:i)]) %*% t(X[,c(1:i)]) %*% Y
    SSR_x = sum((Yhat_x - mean(Y)) ^ 2)
    SSR_all = c(SSR_all, SSR_x)
  }
  SS = sapply(c(2: (p-1)), function(i) SSR_all[i] - SSR_all[i - 1])
  SS = c(SSR_all[1], SS, (sum((Yhat - Y) ^ 2)))
  Df = c(rep(1, p - 1), n - p)
  MS = (SS / Df)
  F_statistic = (MS / (sum((Yhat - Y) ^ 2)/(n - p)))[-p]
  p_value2 = pf(F_statistic, Df[-p], Df[p], lower.tail = FALSE)
  variables_2 = c(variables[-1], "Residuals")

  ANOVA = data.frame("Df" = Df ,
                   "Sum Sq" = SS,
                   "Mean Sq" = MS,
                   "F value" = c(F_statistic, NA),
                   "p.value" = c(p_value2, NA),
                   row.names = variables_2)
  ANOVA = as.matrix(ANOVA)

  R2 = sum((Yhat - mean(Y)) ^ 2) / sum((Y - mean(Y)) ^ 2)
  R2_adj = 1 - (sum((Yhat - Y) ^ 2)/(n - p)) / (sum((Y - mean(Y)) ^ 2)/(n - 1))

  return(list(coefficients = rst,
              anova = ANOVA,
              R2 = R2,
              R2_adj = R2_adj,
              fitted.values = Yhat,
              residuals = epsilonhat))
}
