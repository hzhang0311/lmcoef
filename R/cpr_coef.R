#' cpr_coef
#'
#' An implementation of fitting a constrained polynomial regression that output its estimated coefficients and quantile residuals
#'
#' @param Y A size n numeric vector containing the response variable. NAs not allowed.
#' @param X A size n*m numeric matrix containing the independent variable. NAs not allowed.
#'
#' @return A numeric vector containing estimated coefficient; A numeric vector containing residuals.
#'
#' @examples
#' y = c(1,3,3,3,4,5,3,2,-1)
#' p = 5
#' fit = cpr_coef(p,y)
#'
#' @importFrom stats pt
#'
#' @export
#' A list containing a numeric vector containing estimated coefficient and a numeric vector containing quantiled residuals for constrained polynomial regression.
#'
cpr_coef <- function(p, y){

  n = length(y)
  x = (1:n) / n
  x_final = x / p
  ## apply Horner's rule to compute polynomial ##
  if(p > 1){
    for(j in seq(p-1, 1, by = -1)){
      x_final = x_final + 1
      x_final = x / j * x_final
    }
  }

  y_mod = y - mean(y)
  x_mod = x_final - mean(x_final)

  s2y = sum(y_mod * y_mod) / (n - 1)
  s2x = sum(x_mod * x_mod) / (n - 1)
  sxy = sum(x_mod * y_mod) / (n - 1)
  rxy = sxy / sqrt(s2y * s2x)

  b1 = rxy * sqrt(s2y / s2x)
  b0 = mean(y) - b1 * mean(x_final)

  beta_n = c(b1)
  for (k in 1:(p-1)){
    beta_n = append(beta_n, beta_n[k] / (k+1))
  }
  beta = c(b0, beta_n)

  x_fit = cbind(1, sapply(c(1:p), function(j) x^j))
  y_hat = as.vector(beta %*% t(x_fit))
  e_hat = y - y_hat

  variables = c()
  variables = sapply(c(1:(length(beta)-1)), function(i) append(variables,paste0("b", i)))
  variables = append("(intercept)", variables)

  rst = data.frame("Estimate" = beta ,
                   row.names = variables)
  rst = as.matrix(rst)

  return(list(coefficients = rst,
              fitted.values = y_hat,
              residuals = e_hat))
}
