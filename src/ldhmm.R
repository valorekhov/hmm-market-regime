library(ldhmm)
ts = ldhmm.ts_log_rtn("spx" , on ="days")

m = 2
mu_1 = 0.0006
mu_2 = -0.0007
sigma_1 = 0.01
sigma_2 = 0.02
param0 = matrix ( c (
  mu_1 , sigma_1 ,
  mu_2 , sigma_2 ) , m , 2 , byrow = TRUE )

gamma0 = ldhmm.gamma_init ( m )

h <- ldhmm (m, param0, gamma0, stationary = TRUE)
hd <- ldhmm.mle(h , ts$x , decode = TRUE , print.level =2)
hd