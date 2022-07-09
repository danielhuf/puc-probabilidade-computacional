# TAREFA 2 G2 - DANIEL STULBERG HUF

# Uma empresa, que usa turbinas eólicas instaladas no quintal de residências para produzir energia, coletou
# dados referentes a distância em metros das turbinas à rede elétrica existente nas imediações das casas. 
# Sabe-se que a distância da população de turbinas segue uma distribuição normal com média 10 e desvio padrão 3.
# Para o exposto:

# a) Calcule e exiba, sem utilizar simulação, a probabilidade de se encontrar, a partir de uma seleção
# aleatória, uma turbina cuja distância da rede elétrica seja maior que 12 metros. 

print(1 - pnorm (12, 10, 3))

# b) Calcule e exiba, utilizando simulação, a probabilidade de se encontrar, a partir de uma seleção
# aleatória, uma turbina cuja distância da rede elétrica seja maior que 12 metros. 

nsamples <- 50000;
dist_maior_12 <- 0
for (i in 1:nsamples) {
  dist <- rnorm(1, 10, 3) # uso de rnorm com media=10 e dp=3 e pegando uma observação
  if (dist > 12) {
    dist_maior_12 <- dist_maior_12 + 1
  }
}
prob_maior_12 <- dist_maior_12 / nsamples
print(prob_maior_12)

# c) Plote a curva normal e, sobre esta, o limite de 12 metros.

curve(dnorm(x, 10, 3),
      0, 20, #limites do gráfico
      main = "Distribuição",
      ylab = "Probabilidade")
lines(c (12, 12), 
      c (0, 0.15),
      col = 2) #cor vermelha

# d) Calcule e exiba o valor da distância para o qual a probabilidade de se encontrarem valores menores
# que o desse seja 80%. 

print(qnorm(0.8, 10, 3))

# e) Ao selecionar aleatoriamente 4 turbinas qual a probabilidade de que apenas uma esteja á mais de 11
# metros da rede elétrica?

# Considerando que as distâncias de cada turbina à rede elétrica são eventos independentes:
prob_mais_11 <- 1 - pnorm (11, 10, 3)
dbinom(1, 4, prob_mais_11) 