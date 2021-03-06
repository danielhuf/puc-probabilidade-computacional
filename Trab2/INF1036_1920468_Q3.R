# TRABALHO G2 PROBABILIDADE COMPUTACIONAL - 2022.1
# DANIEL STULBERG HUF - 1920468
# QUEST�O 3

# Considerando que qualquer s�lido que esteja dentro do cubo � um evento ???? e sua probabilidade coincide com o seu volume, determine, 
# por simula��o utilizando R, os valores de ????(????), ????(????), ????(???? ??? ????), ????(???? ??? ????), ????(~????) e ????(~????).

# Podemos determinar a probabilidade de cada evento gerando pontos uniformementes distribu�dos
# ao longo do interior do cubo, e verificando se cada ponto independente est� dentro de cada regi�o R
# e T, a fim de simular o volume estimado de cada regi�o.

n_samples <- 50000
dentro_regiao_r <- 0
dentro_regiao_t <- 0
dentro_regiao_r_e_t <- 0

for (i in 1:n_samples) {
  xyz.p <- runif(3) # ponto P de coordenadas (x, y, z)
  # N�o precisamos verificar se o ponto est� dentro ou fora do cubo, pois todas as coordenadas geradas
  # j� s�o automaticamente n�meros no intervalo [0, 1.0), o que equivale ao espa�o amostral limitado pelo volume do cubo
  
  ponto_Dentro_R = sum(xyz.p) > 1     # Verificando se o ponto gerado est� estritamente acima do plano de equa��o x + y + z = 1
  ponto_Dentro_T = sum(xyz.p^2) < 1   # Verificando se o ponto gerado est� estritamente dentro da esfera de equa��o x� + y� + z� = 1
  
  if (ponto_Dentro_R) {
    dentro_regiao_r <- dentro_regiao_r + 1
  }
  
  if (ponto_Dentro_T) {
    dentro_regiao_t <- dentro_regiao_t + 1
  }
  
  if (ponto_Dentro_R & ponto_Dentro_T) {
    dentro_regiao_r_e_t <- dentro_regiao_r_e_t + 1
  }
}

# C�lculo das probabilidades
prob_r = dentro_regiao_r/n_samples
prob_t = dentro_regiao_t/n_samples
prob_r_e_t = dentro_regiao_r_e_t/n_samples

# Utiliza��o das propriedades elementares
prob_n_r = 1 - prob_r
prob_n_t = 1 - prob_t
prob_r_ou_t = prob_r + prob_t - prob_r_e_t

print(paste0("P(R): ", prob_r))
print(paste0("P(T): ", prob_t))
print(paste0("P(R U T): ", prob_r_ou_t))
print(paste0("P(R ??? T): ", prob_r_e_t))
print(paste0("P(~R): ", prob_n_r))
print(paste0("P(~T): ", prob_n_t))
