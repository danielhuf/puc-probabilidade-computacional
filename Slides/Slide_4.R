# SLIDE 4 - PROBABILIDADE

# PROBLEMA DO ANIVERSÁRIO
# Crie um programa para calcular a probabilidade de pelo menos 2 pessoas fazerem
# aniversário no mesmo dia com 𝑛 variando de 1 a 50.
# Ex: n = 3 pessoas. Espaço Amostral (S) = 365^3. Ninguém faz aniversário junto (N) = 365*364*363.
# Prob = 1 - (N/S)

fatorial <- function(n){
  if (n == 0)
    return (1)
  else
    return (n * fatorial(n - 1))
}

arranjo <- function(n, p){
  return (fatorial(n) / fatorial(n - p))
}

n <- 50
p <- c(1:n)
for (k in 1:n)
  p[k] <- 1 - prod(365:(365-k+1))/(365^k)
plot(p, main = "Problema do aniversário", xlab = "Número de alunos", ylab = "Probabilidade")

# SIMULANDO ESCOLHAS
# Lançament de moeda
nsamples <- 20
x <- sample(c("H","T"), nsamples, replace = TRUE)
print(x)
table(x)
table(x)/nsamples
