# SLIDE 7 - VARIÁVEIS ALEATÓRIAS CONTÍNUAS

# DISTRIBUIÇÃO NORMAL
# Exercício 1) Uma pesquisa contratada por uma oficina mecânica indica que, para cada ida à
# oficina, um cliente gasta uma média de 45 minutos com um desvio padrão de 12 minutos. O
# tempo gasto na oficina é normalmente distribuído e representado pela variável aleatória 𝑥.
# Encontre o que é pedido para as seguintes situações:

# a) A probabilidade de um cliente, ao entrar na oficina, demorar entre 24 e 54 minutos.
pnorm (54, 45, 12) - pnorm (24, 45, 12)
# b) A probabilidade de um cliente, ao entrar na oficina, demorar mais de 39 minutos.
1 - pnorm (39, 45, 12)
# c) Se 15 clientes entram na oficina, quantos deles devem permanecer por mais de 39 minutos?
15 * (1 - pnorm (39, 45, 12))

# Exemplo 2) Para uma distribuição normal padrão, calcule:
# a) A função de probabilidade acumulada 𝐹(𝑥) até −1.
pnorm (-1)
# b) O valor de 𝑎 tal que 𝑃(𝑋 ≤ 𝑎) = 0,975.
qnorm (0.975)
# c) Uma amostra de 5 elementos.
rnorm (5)

# Exemplo 3) Qual a probabilidade de ocorrência de um valor menor que 20 em uma distribuição
# normal de média 50 e desvio padrão igual a 15?
valor.referencia <- 20
media <- 50
desvio.padrao <- 15
pnorm (valor.referencia, media, desvio.padrao)
# Qual seria o resultado esperado se o valor de referência fosse 50?
pnorm (50, 50, 15)
# Qual seria o resultado esperado se o valor de referência fosse 20 e o desvio padrão 30?
pnorm (20, 50, 30)

# Exemplo 4) Desenhe uma curva de uma distribuição normal padrão entre −5 e 5.
curve (dnorm (x), -5, 5) 

# Exercício 2) Um time de futebol coletou dados referentes ao peso de seus jogadores inscritos
# em um campeonato. Sabendo-se que o peso da população de jogadores segue uma distribuição
# normal com média 82 e desvio padrão 13, calcule:
# a) A probabilidade de se encontrar um jogador com mais de 93 quilos.
1 - pnorm (93, 82, 13)
# b) O valor do peso para o qual a probabilidade de se encontrar valores menores que o deste
# seja de 70%.
qnorm (0.7, 82, 13)

# Exemplo 5) Plote o gráfico do exercício anterior: 
curve (dnorm (x, 82, 13),
       50, 110, #limites do gráfico
       main = "Distribuição",
       ylab = "Probabilidade")
lines (c (93, 93), #início e fim da linha em relação ao eixo x
       c (0, 0.03), #início e fim da linha em relação ao eixo y
       col = 2) #cor vermelha

# FUNÇÃO DE DENSIDADE DE PROBABILIDADE
funcao.normal <- function (x, mu, s) {
  fx <- 1/(2*s**2*pi)**0.5 * exp(-(x-mu)**2/(2*s**2))
  return (fx)
}

x <- seq (60, 140, length.out = 100)
fx <- funcao.normal (x, 100, 10)
plot (x, fx, type = "l")
vx <- c (60, 60, x[x < 90], 90, 90)
vy <- c (0, funcao.normal(60, 100, 10), fx[x < 90], funcao.normal(90, 100, 10), 0)
plot (x, fx, type = "l")
polygon (vx, vy, dens = 50)

# SOLUÇÃO POR PNORM
pnorm(90, 100, 10)
pnorm(105,100,10) - pnorm(90,100,10)

# SOLUÇÃO POR INTEGRAL
integrate(funcao.normal, -Inf, 90, mu=100, s=10)
integrate (funcao.normal, 90, 105, mu=100, s=10)

# DISTRIBUIÇÃO T DE STUDENT
#Exercício 1) Determine o valor 𝑥 de uma distribuição t de Student com 12 graus de liberdade,
# que garante, com probabilidade de 99% de um valor aleatório, ser abaixo de 𝑥.
qt (0.99, 12)

# DISTRIBUIÇÃO EXPONENCIAL
# Exercício 1) Uma ferramenta produzida em uma fábrica apresenta uma vida média de 90 horas.
# Considerando o comportamento segundo a distribuição exponencial, qual a probabilidade de
# essa ferramenta durar mais de 100 horas?
1 - pexp(100, rate = 1/90)

# Exercício 2) Uma fábrica utiliza dois métodos para a produção de sensores eletrônicos. 80% dos
# sensores são produzidos pelo método A, e os demais, pelo método B. A duração do sensor
# depende do método pelo qual ele foi produzido: os produzidos pelo método A seguem uma
# distribuição exponencial com parâmetro 1/90; e os produzidos pelo método B seguem uma
# exponencial de parâmetro 1/110. Qual a probabilidade de que, se escolhermos um sensor ao
# acaso, ele dure mais de 100 horas?

# Considere os eventos C (um sensor durar mais de 100 horas), A (o sensor ter sido produzido
# pelo método A) e B (o sensor ter sido produzido pelo método B).

# 𝑃(𝐶) = 𝑃(𝐴)𝑃(𝐶|𝐴) + 𝑃(𝐵)𝑃(𝐶|𝐵) = 0,80*𝑃(𝑋𝐴 > 100) + 0,20*𝑃(𝑋𝐵 > 100)
0.8*(1 - pexp(100, rate = 1/90)) + 0.2*(1 - pexp(100, rate = 1/110))

# EXPONENCIAL -> SOLUÇÃO POR INTEGRAL
funcao.exponencial <- function (x, lambda) {
  fx <- ifelse (x < 0, 0, (lambda) * exp(-x*lambda))
  return (fx)
}

1 - pexp(300, rate=1/600)
integrate (funcao.exponencial, 300, +Inf, lambda=1/600)

# DISTRIBUIÇÃO WEIBULL
# Exercício 1) O tempo de falha (em horas) de uma determinada peça em um tipo de freio de
# carro é satisfatoriamente modelado como uma variável aleatória de Weibull com 𝛽 = 1/2 e
#𝛿 = 6000.
# a) Determine a probabilidade de uma peça durar no mínimo 6500 h.
1 - pweibull (6500, 0.5, 6000)
# b) Verifique a probabilidade de uma peça ter problemas nas primeiras 6500 h e plote o
# resultado.
pweibull (6500, 0.5, 6000)
x <- 0:8000
curve (dweibull (x, 0.5, 6000), 0, 8000)

# DISTRIBUIÇÃO GAMA
# Exercício 1) A renda doméstica mensal em uma cidade é uma variável aleatória com
#distribuição Gama com média R$ 2.000 e desvio padrão R$ 400.
# a) Calcule os parâmetros α, 𝛽 e 𝜃 desta densidade.
# 𝛼𝜃 = 2000
# raiz de 𝛼𝜃^2 = 400
# 𝛼 = 25 𝜃 = 80 𝛽 = 1/80
# b) Calcule a probabilidade da renda média mensal de um domicílio exceder R$ 2.300.
1 - pgamma (2300, shape = 25, rate = 1/80)
# c) Qual a mediana desta distribuição Gama? 𝛼𝜃
qgamma (0.5, shape = 25, rate = 1/80)

# DISTRIBUIÇÃO QUI-QUADRADA
# Exercício 1) Suponha agora que 𝑋 segue uma distribuição qui-quadrada com 10 graus de
# liberdade. Encontre 𝑥1 e 𝑥2 tais que 𝑃 𝑥1 ≤ 𝑋 ≤ 𝑥2 = 0,95.

# Pelo exposto, temos que:
# 𝑃 (𝑥1 ≤ 𝑋 ≤ 𝑥2) = 𝑃 (𝑋 ≤ 𝑥2) − 𝑃 (𝑋 ≤ 𝑥1) = 0,95

# Suponha que 𝑃(𝑋 ≤ 𝑥2) = 0,98, o que implica 𝑃(𝑋 ≤ 𝑥1) = 0,03 
# (outros valores poderiam ter sido escolhidos), logo:
# 𝑃 (𝑥1 ≤ 𝑋 ≤ 𝑥2) = 0,98 − 0,03 = 0,95

qchisq (0.98, df = 10)  #possivel valor de x1
qchisq (0.03, df = 10)  #valor de x2 correspondente

# Para testar, podemos usar:
pchisq (21.16077, df=10) - pchisq (3.412069, df=10)

# TEOREMA CENTRAL DO LIMITE
# Exemplo 1) As contas de energia dos moradores de uma cidade apresentam média de $81 e um
# desvio padrão de $16. Amostragens aleatórias de 49 contas são selecionadas dessa população,
# e a média de cada amostragem é determinada. Encontre a média e o erro padrão da média da
# distribuição amostral. Então, esboce um gráfico da distribuição das médias amostrais.

# A média da distribuição de amostras é igual à média da população.
# 𝜇x = 𝜇 = 81

# O erro padrão da média é igual ao desvio padrão populacional dividido pela raiz quadrada de 𝑛.
# 𝜎x = 16/raiz de 49 = 2.29

# Já que o tamanho da amostra é maior que 30, a distribuição das
# amostras pode ser aproximada por uma distribuição normal com:
curve (dnorm (x, 81, 2.29), 70, 90,
       main = "Distribuição",
       ylab = "Probabilidade", col = 2)
