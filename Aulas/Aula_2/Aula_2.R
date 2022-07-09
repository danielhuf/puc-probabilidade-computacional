# Aula 2 Prob Comp (15/03)

v = runif(10) # Retorna 10 valores no intervalo [0.0, 1.0).
print(v) # (Mersenne Twister)

a = 39373
c = 0
M = 2147483647
LCG <- function (seed, a, c, M, nsamples) {
  x = seed
  u = NULL
  for (i in 1:nsamples) {
    nx = (a * x + c) %% M
    u = c(u, as.double(nx) / as.double(M))
    x = nx
  }
  return (u)
}

CARA_OU_COROA <- function (U, p) {
  n = length(U)
  CC = NULL
  for (i in 1:n)
    if (U[i] < (1.0 - p))
      CC = c(CC, 0) #cara
  else
    CC = c(CC, 1) #coroa
  return (CC)
}
U = LCG(3, a, c, M, 10000)
hist(U, col = 'green')
CC = CARA_OU_COROA(U, 0.5)
print(sum(CC))

DADO <- function (U) {
  n = length(U)
  dado = NULL
  for (i in 1:n) {
    if (U[i] < 1.0 / 6.0)
      dado = c(dado, 1)
    else if (U[i] < 2.0 / 6.0)
      dado = c(dado, 2)
    else if (U[i] < 3.0 / 6.0)
      dado = c(dado, 3)
    else if (U[i] < 4.0 / 6.0)
      dado = c(dado, 4)
    else if (U[i] < 5.0 / 6.0)
      dado = c(dado, 5)
    else
      dado = c(dado, 6)
  }
  return (dado)
}
U = LCG(3, a, c, M, 60000)
dado = DADO(U)
barplot(table(dado), col = 'green')

dado
