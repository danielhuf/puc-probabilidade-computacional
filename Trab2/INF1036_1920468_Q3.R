# TRABALHO G2 PROBABILIDADE COMPUTACIONAL - 2022.1
# DANIEL STULBERG HUF - 1920468
# QUESTÃO 3

# Considerando que qualquer sólido que esteja dentro do cubo é um evento ???? e sua probabilidade coincide com o seu volume, determine, 
# por simulação utilizando R, os valores de ????(????), ????(????), ????(???? ??? ????), ????(???? ??? ????), ????(~????) e ????(~????).

# Podemos determinar a probabilidade de cada evento gerando pontos uniformementes distribuídos
# ao longo do interior do cubo, e verificando se cada ponto independente está dentro de cada região R
# e T, a fim de simular o volume estimado de cada região.

n_samples <- 50000
dentro_regiao_r <- 0
dentro_regiao_t <- 0
dentro_regiao_r_e_t <- 0

for (i in 1:n_samples) {
  xyz.p <- runif(3) # ponto P de coordenadas (x, y, z)
  # Não precisamos verificar se o ponto está dentro ou fora do cubo, pois todas as coordenadas geradas
  # já são automaticamente números no intervalo [0, 1.0), o que equivale ao espaço amostral limitado pelo volume do cubo
  
  ponto_Dentro_R = sum(xyz.p) > 1     # Verificando se o ponto gerado está estritamente acima do plano de equação x + y + z = 1
  ponto_Dentro_T = sum(xyz.p^2) < 1   # Verificando se o ponto gerado está estritamente dentro da esfera de equação x² + y² + z² = 1
  
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

# Cálculo das probabilidades
prob_r = dentro_regiao_r/n_samples
prob_t = dentro_regiao_t/n_samples
prob_r_e_t = dentro_regiao_r_e_t/n_samples

# Utilização das propriedades elementares
prob_n_r = 1 - prob_r
prob_n_t = 1 - prob_t
prob_r_ou_t = prob_r + prob_t - prob_r_e_t

print(paste0("P(R): ", prob_r))
print(paste0("P(T): ", prob_t))
print(paste0("P(R U T): ", prob_r_ou_t))
print(paste0("P(R ??? T): ", prob_r_e_t))
print(paste0("P(~R): ", prob_n_r))
print(paste0("P(~T): ", prob_n_t))
