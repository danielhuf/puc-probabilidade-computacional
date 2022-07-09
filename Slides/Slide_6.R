# SLIDE 6 - VARIÁVEIS ALEATÓRIAS

# DISTRIBUIÇÕES DISCRETAS
x <- 0:5
y <- c (0, 0.3, 0.7, 0, 0, 0)
plot (x, y, type = 'h')
points (1, 0.3)
points (2, 0.7)

# PROBABILIDADE ACUMULADA
x <- 0:5
y <- c (0, 0.3, 1, 1, 1, 1)
plot (x, y, type ='s')

# USO DA SAMPLE
n <- 100000 #100000 escolhas a realizar, ou seja, um número muito grande
bolinhas <- 1:10 #bolinhas de 1 a 10
caixa <- bolinhas #caixa com 10 bolinhas
numero.bolinhas <- length(bolinhas)
total.bolinha.escolhida <- rep (0, numero.bolinhas)
probabilidade.bolinha.escolhida <- rep (0, numero.bolinhas)
#n escolhas de bolinhas com repetição
for (i in 1:n) {
  bolinha <- sample (caixa, 1)
  total.bolinha.escolhida [bolinha] <- total.bolinha.escolhida [bolinha] + 1
}
#probabilidade de escolha de cada bolinha
for (i in 1:numero.bolinhas) {
  probabilidade <- total.bolinha.escolhida [i] / n
  print (paste ('Probabilidade da bolinha [', i, '] = ', probabilidade))
}

#Exemplo 2) Suponha que, para uma máquina que produz peças automotivas, a probabilidade
#de se obter uma peça defeituosa (sucesso) é 𝑝 = 0,1. Das peças produzidas por esta máquina,
#seleciona-se uma amostra de 10 peças para análise. Qual a probabilidade de se obter:
#  a) Uma peça defeituosa?
dbinom(1, 10, 0.1)
#  b) Nenhuma peça defeituosa?
dbinom(0, 10, 0.1)
#  c) Duas peças defeituosas?
dbinom(2, 10, 0.1)
#d) No mínimo duas peças defeituosas?
1 - pbinom(1, 10, 0.1)
# e) No máximo duas peças defeituosas?
pbinom(2, 10, 0.1)

# DISTRIBUIÇÃO BINOMIAL
nsamples <- 1000000
namostra <- 10; 
npeca.sem.defeito <- 0; 
npeca.defeituosa <- rep(0, 10)
for (i in 1:nsamples) {
  cont.defeituosa <- 0
  for (j in 1:namostra) { # seleciono 10 peças
    peca.selecionada.defeituosa <- sample(c(T, F), 1, prob = c(0.1, 0.9))
    if (peca.selecionada.defeituosa) {
      cont.defeituosa <- cont.defeituosa + 1
    }
  }
  if (cont.defeituosa > 0) { # npeca.defeituosa[i] contém o total de peças i defeituosas
    npeca.defeituosa[cont.defeituosa] <- npeca.defeituosa[cont.defeituosa] + 1
  } else {
    npeca.sem.defeito <- npeca.sem.defeito + 1
  }
}
prob.nenhuma.defeituosa <- npeca.sem.defeito/nsamples
print(prob.nenhuma.defeituosa)
prob.uma.defeituosa <- npeca.defeituosa[1]/nsamples
print(prob.uma.defeituosa)
prob.duas.defeituosas <- npeca.defeituosa[2]/nsamples
print(prob.duas.defeituosas)
prob.minimo.duas.defeituosas <- sum(npeca.defeituosa[2:10])/nsamples # filtro no vetor
print(prob.minimo.duas.defeituosas)
prob.maximo.duas.defeituosas <- (npeca.sem.defeito + sum(npeca.defeituosa[1:2]))/nsamples
print(prob.maximo.duas.defeituosas)

# Exemplo 3) Considere que a probabilidade de certa peça artesanal ser produzida com perfeição
# por uma pessoa que está em treinamento é igual a 0,5. Considere que a pessoa produza 6
# peças por vez. 

# a) Obter a distribuição de probabilidades do número de peças perfeitas produzidas pela
# pessoa em 6 peças.
# PROCESSO ANALÍTICO
vetor.probabilidade <- dbinom (0:6, 6, 0.5)
vetor.probabilidade
intervalo <- 0:6
intervalo

# b) Construir o gráfico de distribuição de probabilidade obtida no item a.
plot(intervalo, #intervalo desejado
     vetor.probabilidade, #valores de probabilidade
     type="h", #traço do eixo ao ponto
     xlab='x',
     ylab='Probabilidades de x',
     main='Distribuição de probabilidade de X') 

# SIMULAÇÃO
nsamples <- 1000000
namostra <- 6; 
npeca.sem.defeito <- 0;
npeca.defeituosa <- rep(0, 6)
for (i in 1:nsamples) {
  cont.defeituosa <- 0
  for (j in 1:namostra) { # são produzidas 6 peças
    peca.selecionada.defeituosa <- sample(c(T, F), 1, prob = c(0.5, 0.5))
    if (peca.selecionada.defeituosa) {
      cont.defeituosa <- cont.defeituosa + 1
    }
  }
  if (cont.defeituosa > 0) { # npeca.defeituosa[i] contém o total de peças i defeituosas
    npeca.defeituosa[cont.defeituosa] <- npeca.defeituosa[cont.defeituosa] + 1
  } else {
    npeca.sem.defeito <- npeca.sem.defeito + 1
  }
}
vetor.probabilidade <- c(npeca.sem.defeito, npeca.defeituosa)
vetor.probabilidade <- vetor.probabilidade / nsamples
intervalo <- 0:6
plot(intervalo,
     vetor.probabilidade, #valores de probabilidade
     type="h", #traço do eixo ao ponto
     xlab='x',
     ylab='Probabilidades de x',
     main='Distribuição de probabilidade de X') 

# DISTRIBUIÇÃO POISSON
# Exemplo 2) A análise das estradas feita por uma empresa aponta que ocorrem, em média, 4
# buracos por Km. A análise aponta, ainda, que a quantidade de buracos segue uma distribuição
# Poisson. Qual a probabilidade de que um Km qualquer contenha:
#  a) Um buraco?
dpois (1, 4)
#  b) Dois buracos?
dpois (2, 4)
#  c) Nenhum buraco?
dpois (0, 4)
#  d) Pelo menos um buraco?
1 - dpois (0, 4)

# por simulação...
nsamples <- 1000000; 
nkm.sem.buraco <- 0; 
nkm.com.buraco <- rep(0, 30)
for (i in 1:nsamples) {
  buraco <- rpois(1, 4) # uso de rpois com lambda = 4 e pegando uma observação
  if (buraco > 0) {
    nkm.com.buraco[buraco] <- nkm.com.buraco[buraco] + 1
  } else {
    nkm.sem.buraco <- nkm.sem.buraco + 1
  }
}
prob.um.buraco <- nkm.com.buraco[1] / nsamples
print(prob.um.buraco)
prob.dois.buracos <- nkm.com.buraco[2] / nsamples
print(prob.dois.buracos)
prob.nenhum.buraco <- nkm.sem.buraco / nsamples
print(prob.nenhum.buraco)
prob.pelo.menos.um.buraco <- sum(nkm.com.buraco) / nsamples
print(prob.pelo.menos.um.buraco)

# DSITRIBUIÇÃO GEOMÉTRICA
# Exemplo 2) Suponha que a probabilidade de um equipamento eletrônico ser defeituoso é de
# 0,2. Realizaram-se testes na produção de um determinado lote. Determine a probabilidade do
# primeiro defeito encontrado:
#  a) Ocorrer no sétimo equipamento do teste:
dgeom(6, 0.2)
#  b) Não ocorrer no quarto equipamento testado:
1 - dgeom(3, 0.2)

 # por simulação...
nsamples <- 10000000
n.sem.defeito <- 0; 
n.com.defeito <- rep(0, 100)
for (i in 1:nsamples) {
  defeito <- rgeom(1, 0.2) # uso de rgeom com prob = 0.2 e pegando uma observação
  if (defeito > 0) {
    n.com.defeito[defeito] <- n.com.defeito[defeito] + 1
  } else {
    n.sem.defeito <- n.sem.defeito + 1
  }
}
prob.ocorrer.setimo <- n.com.defeito[6] / nsamples # seis sem defeito e o sétimo com defeito
print(prob.ocorrer.setimo)
# para não ocorrer no quarto não há três sucessos seguido de um erro
prob.nao.ocorrer.quarto <- (n.sem.defeito + sum(n.com.defeito) - n.com.defeito[3]) / nsamples
print(prob.nao.ocorrer.quarto)

# Exemplo 3) A probabilidade de uma regulagem bem sucedida na montagem de um
# determinado tipo de produto é de 0.80. Assuma que as tentativas são independentes.
# a) Qual é a probabilidade de que a primeira regulagem bem sucedida requeira exatamente
# quatro tentativas?
dgeom (3, 0.8)
#  b) Qual é a probabilidade de que a primeira regulagem bem sucedida requeira no máximo
# quatro tentativas ?
dgeom (0, 0.8) + dgeom (1, 0.8) + dgeom (2, 0.8) + dgeom (3, 0.8)
#  c) Qual é a probabilidade de que a primeira regulagem bem sucedida requeira ao menos
# quatro tentativas ?
1 - (dgeom (0, 0.8) + dgeom (1, 0.8) + dgeom (2, 0.8))

# por simulação...
nsamples <- 10000000
n.bem.sucedida <- 0; 
n.mal.sucedida <- rep(0, 100)
for (i in 1:nsamples) {
  regulagem <- rgeom(1, 0.8) # uso de rgeom com prob = 0.8 e pegando uma observação
  if (regulagem > 0) {
    n.mal.sucedida[regulagem] <- n.mal.sucedida[regulagem] + 1
  } else {
    n.bem.sucedida <- n.bem.sucedida + 1
  }
}
prob.quatro.tentativas <- n.mal.sucedida[3] / nsamples
print(prob.quatro.tentativas)
prob.no.maximo.quatro <- (n.bem.sucedida + sum(n.mal.sucedida[1:3])) / nsamples
print(prob.no.maximo.quatro)
prob.ao.menos.quatro <- (sum(n.mal.sucedida[3:100])) / nsamples
print(prob.ao.menos.quatro)

# DISTRIBUIÇÃO HIPERGEOMÉTRICA
# Exemplo 1, continuação) Um banco de investimentos possui 20 clientes com mais de
# 𝑅$ 100 𝑚𝑖𝑙ℎõ𝑒𝑠 aplicados. Destes, 5 moram fora do Brasil:
#  a) Ao retirar 3 ao acaso, qual a probabilidade de que 2 deles morem fora do Brasil?
dhyper(2, 5, 15, 3)

# por simulação...
nsamples <- 10000000
nobservacao <- 20
n.obs.fora <- 5
n.obs.Brasil <- 15
n.extraido <- 3
n.mora.fora <- rep(0, 100)
n.mora.brasil <- 0
for (i in 1:nsamples) {
  cliente <- rhyper(1, n.obs.fora, n.obs.Brasil, n.extraido) # uma observação
  if (cliente > 0) {
    n.mora.fora[cliente] <- n.mora.fora[cliente] + 1
  } else {
    n.mora.brasil <- n.mora.brasil + 1
  }
}
prob.dois.mora.fora <- n.mora.fora[2] / nsamples
print(prob.dois.mora.fora)

#  b) Ao retirar 5 ao acaso, qual a probabilidade de que todos morem no Brasil?
dhyper(0, 5, 15, 5)

# por simulação...
nsamples <- 10000000
nobservacao <- 20
n.obs.fora <- 5
n.obs.Brasil <- 15
n.extraido <- 5
n.mora.fora <- rep(0, 100)
n.mora.brasil <- 0
for (i in 1:nsamples) {
  cliente <- rhyper(1, n.obs.fora, n.obs.Brasil, n.extraido) # uma observação
  if (cliente > 0) {
    n.mora.fora[cliente] <- n.mora.fora[cliente] + 1
  } else {
    n.mora.brasil <- n.mora.brasil + 1
  }
}
prob.todos.mora.Brasil <- n.mora.brasil / nsamples
print(prob.todos.mora.Brasil)

# Exemplo 2) Uma urna contém 15 bolas, sendo 10 brancas e 5 vermelhas. Uma amostra de
# extensão 4, não ordenada e sem reposição, é retirada ao acaso da urna. Determine qual é a
# probabilidade de que três bolas sejam vermelhas.
dhyper (3, 5, 10, 4)

# por simulação...
nsamples <- 10000000
nobservacao <- 15
n.obs.branca <- 10
n.obs.vermelha <- 5
n.extraido <- 4
n.bola.vermelha <- rep(0, 100)
n.bola.branca <- 0
for (i in 1:nsamples) {
  bola <- rhyper(1, n.obs.vermelha, n.obs.branca, n.extraido) # uma observação
  if (bola > 0) {
    n.bola.vermelha[bola] <- n.bola.vermelha[bola] + 1
  } else {
    n.bola.branca <- n.bola.branca + 1
  }
}
prob.tres.bola.vermelha <- n.bola.vermelha[3] / nsamples
print(prob.tres.bola.vermelha)
