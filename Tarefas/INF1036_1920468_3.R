# TAREFA 3 G1 - DANIEL STULBERG HUF

# Quest 1
# Considere que a probabilidade de configuração de um software financeiro ser feita de forma correta por
# um funcionário recém contratado de uma empresa de consultoria é igual a 0,7. Considere que esse funcionário
# configura 8 máquinas por vez.

# a) Obtenha e exiba a distribuição de probabilidade do número de instalações corretas feitas pelo
# funcionário em 8 instalações.
vetor.probabilidade <- dbinom (0:8, 8, 0.7)
vetor.probabilidade

# b) A seguir, plote a distribuição de probabilidade do número de instalações.
intervalo <- 0:8
plot(intervalo,
     vetor.probabilidade,
     type="h",
     xlab='x',
     ylab='Probabilidades de x',
     main='Distribuição de probabilidade de X') 

# Quest 2
# Seja X o nível de TSH em um indivíduo. Assume-se que X tem distribuição exponencial com média 3 µUI/mL.
# Toma-se uma amostra de 12 trabalhadores de uma empresa madeireira. Se mais da metade dos indivíduos da
# amostra tem níveis de TSH maiores que 4,88 µUI/mL, realiza-se um programa de intervenção com o total de
# trabalhadores da empresa. Qual a probabilidade de ocorrer o programa de intervenção?

# Probabilidade de nivel de TSH maior que 4.88 para um individuo
prob <- 1 - pexp(4.88, rate = 1/3)

# Seja Y o numero de individuos com niveis de TSH maiores que 4.88, a probabilidade de Y ser maior do que 6 é igual a:
1 - pbinom(6, 12, prob)

# Quest 3
# Uma empresa, que empacota farinha, sabe que o peso dos pacotes segue uma distribuição normal com
# média 950g e desvio padrão 50g. Para o exposto:

# a) Calcule e exiba a probabilidade de se encontrar um pacote cujo peso seja de mais de 1000g. 
1 - pnorm(1000, mean = 950, sd = 50)

# b) Plote a curva normal e, sobre esta, o limite de 1010g. 
curve(dnorm(x, 950, 50),
      50, 1010,
      main = "Distribuição",
      ylab = "Probabilidade")
lines(c (1010, 1010), c (0, 0.03), col = 2)

# c) Calcule e exiba o valor do peso para o qual a probabilidade de se encontrar valores menores que o
# deste seja 75%.
qnorm(0.75, 950, 50)