# SLIDE 8 - GERANDO VARIÁVEIS ALEATÓRIAS

# VARIÁVEL ALEATÓRIA DISCRETA

# Exemplo 1) Seja 𝑋 uma variável aleatória discreta, tal que:
# 𝑃 𝑋 = 𝑥𝑗 = 𝑝𝑗
# 𝑗 = 1,2,3,4; 𝑝1= 0,2 𝑝2 = 0,15 𝑝3 = 0,25 𝑝4 = 0,4
# Implemente uma função que possa gerar 𝑋.

gera.variavel <- function (nsamples, taxa) {
  X <- rep(0, nsamples) # nsamples posições com 0
  U <- runif(nsamples) # nsamples valores em [0.0, 1.0)
  for (i in 1:nsamples) {
    if (U[i] < 0.2)
      X[i] = 1
    else if (U[i] < 0.35) # 0.2 + 0.15
      X[i] = 2
    else if (U[i] < 0.6) # 0.2 + 0.15 + 0.25
      X[i] = 3
    else
      X[i] = 4
  }
  return (X)
}
nsamples = 50000
X <- gera.variavel(nsamples)
hist(X, breaks = 100, col = 'green')

# VARIÁVEL ALEATÓRIA CONTÍNUA: MÉTODO DA INVERSA

# Exemplo 2) Implemente uma função que gere uma variável aleatória contínua 𝑋
# cuja função de distribuição acumulada é uma Exponencial de parâmetro 𝜆 = 2:
exponencial <- function (nsamples, taxa) {
  X <- rep(0, nsamples) # nsamples posições com 0
  U <- runif(nsamples) # nsamples valores em [0.0, 1.0)
  for (i in 1:nsamples) {
    X[i] = - log(1.0 - U[i])/taxa # Inversa da exponencial
  }
  return (X)
}
taxa = 2.0
nsamples = 50000
X <- exponencial(nsamples, taxa)
hist(X, breaks = 100, col = 'green')

# Exercício 1) Implemente uma função que gere uma variável aleatória contínua 𝑋
# cuja função de distribuição acumulada é uma Weibull de parâmetros 𝛼 = 2 e β = 1/2
weibull <- function (nsamples, a, b) {
  X <- rep(0, nsamples)
  U <- runif(nsamples)
  for (i in 1:nsamples) {
    X[i] = b * ((-log(1 - U[i]))^(1.0 / a))
  }
  return (X)
}
a = 2.0
b = 0.5
nsamples = 50000
X = weibull(nsamples, a, b)
hist(X, breaks = 100, col = 'green')

# MÉTODO POLAR

# Exercício 4) Gere um par de variáveis aleatórias 𝑌 e 𝑋 com função densidade 
# de probabilidade 𝑁𝑜𝑟𝑚𝑎𝑙 (0, 1).
exponencial <- function (nsamples, taxa) {
  X <- rep(0, nsamples) # nsamples posições com 0
  U <- runif(nsamples) # nsamples valores em [0.0, 1.0)
  for (i in 1:nsamples) {
    X[i] <- - log(1.0 - U[i])/taxa # Inversa da Exponencial
  }
  return (X)
}

uniform <- function (nsamples, a, b) {
  X <- rep(0, nsamples) # nsamples posições com 0
  U <- runif(nsamples) # nsamples valores em [0.0, 1.0)
  for (i in 1:nsamples) {
    X[i] <- a + (b-a)*U[i] #Inversa da Uniforme
  }
  return (X)
}

normalPolar <- function (nsamples) {
  X <- rep(0, nsamples)
  Y <- rep(0, nsamples)
  d <- exponencial(nsamples, 0.5)
  theta = uniform(nsamples, 0, 2*pi)
  for (i in 1:nsamples) {
    r = sqrt(d[i])
    X[i] <- r*cos(theta[i])
    Y[i] <- r*sin(theta[i])
  }
  return (data.frame(X, Y))
}

parVA <- normalPolar(10000);
par(mfrow = c(1,2)) #uma linha com duas colunas de gráficos
hist(parVA$X, breaks = 100, col = 'green')
hist(parVA$Y, breaks = 100, col = 'green')

# VARIÁVEL ALEATÓRIA CONTÍNUA: MÉTODO DA REJEIÇÃO

# Exercício 1) Suponha que deseja-se gerar amostras de uma variável aleatória 𝑋 com função
# densidade de probabilidade Normal (0, 1). (use ℎ(x) = e^-x, sendo p(x) = (2/sqrt(2*pi)) * e^(-x^2/2) )

p <- function(x) {
  return ((2.0/sqrt(2*pi))*exp((-x^2)/2))
}

h <- function(x) {
  return (exp(-x))
}

# Inversa da exponencial com 𝜆=1 usada para gerar a variável aleatória Y
inversa_h <- function(x) {
  return (-log(1.0-x))
}

normal <- function (nsamples) {
  x <- rep(0, nsamples)
  c <- sqrt((2*(exp(1)))/pi)
  for (i in 1:nsamples) {
    while (T) {
      u1 <- runif(1)
      y <- inversa_h(u1) # gera Y a partir da inversa
      u2 <- runif(1)
      if (u2 <= p(y)/(c*h(y))){
        u3 <- runif(1) #simetria da normal
        if (u3 < 0.5)
          x[i] <- -y
        else
          x[i] <- y
        break()
      }
    }
  }
  return (x)
}

X <- normal(10000)
print(mean(X))
print(var(X))
hist(X, breaks = 100, col = 'green')