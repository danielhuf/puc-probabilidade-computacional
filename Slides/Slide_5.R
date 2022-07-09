# SLIDE 5 - PROBABILIDADE CONDICIONAL

# DADO NÃO VICIADO
nsamples <- 1000
S <- sample(c(1,2,3,4,5,6), nsamples, replace = T)
A <- S [(S == 2) | (S == 4) | (S == 6)]
PA <- (length(A)/nsamples)
print(PA)

nsamples <- 1000
S <- sample(c(1,2,3,4,5,6), nsamples, replace = T)
B <- S [(S == 1) | (S == 2) | (S == 5)]
PB <- (length(B)/nsamples)
print(PB)

# SABENDO QUE A OCORREU
nsamples <- 100000; cont.2 <- 0; cont.a <- 0
for (i in 1:nsamples) {
  face <- sample(c(1,2,3,4,5,6), 1, replace = T)
  if ((face == 2) | (face == 4) | (face == 6)) {
    cont.a <- cont.a + 1
  }
  if (face == 2) {
    cont.2 <- cont.2 + 1
  }
}
PBdadoA <- (cont.2 / cont.a)
print(PBdadoA)

#Em uma instituição 20% dos funcionários tem problemas visuais, 8% 
# tem problemas auditivos e 4% tem problemas visuais e auditivos.
# a) Os eventos “ter problemas auditivos” e “ter problemas visuais” são independentes?
nsamples <- 1000000
contvisualauditivo <- 0
for (i in 1:nsamples) {
  visual <- sample(c(T, F), 1, prob = c(0.2, 0.8))
  auditivo <- sample(c(T, F), 1, prob = c(0.08, 0.92))
  if (visual & auditivo) {
    contvisualauditivo <- contvisualauditivo + 1
  }
}
print(contvisualauditivo/nsamples)

# b) Ao selecionar um funcionário ao acaso qual a probabilidade dele ter problemas auditivos se
# ele tem problemas visuais?

nsamples <- 1000000
contvisual <- 0
contvisualauditivo <- 0
for (i in 1:nsamples) {
  visual <- sample(c(T, F), 1, prob = c(0.2, 0.8))
  if (visual) {
    contvisual <- contvisual + 1
    visualauditivo <- sample(c(T, F), 1, prob = c(0.04, 0.96))
    if (visualauditivo) {
      contvisualauditivo <- contvisualauditivo + 1
    }
  }
}
print(contvisualauditivo/contvisual)

# c) Ao selecionar um funcionário ao acaso qual a probabilidade dele não ter problemas visuais
# ou ter problemas auditivos?
nsamples <- 1000000; contnvisual <- 0; contauditivo <- 0; contvisualauditivo <- 0
for (i in 1:nsamples) {
  visual <- sample(c(T, F), 1, prob = c(0.2, 0.8))
  auditivo <- sample(c(T, F), 1, prob = c(0.08, 0.92))
  visualauditivo <- sample(c(T, F), 1, prob = c(0.04, 0.96))
  if (visual == F) {
    contnvisual <- contnvisual + 1
  }
  if (auditivo) {
    contauditivo <- contauditivo + 1
  }
  if (visualauditivo) {
    contvisualauditivo <- contvisualauditivo + 1
  }
}
print((contnvisual + contauditivo - contvisualauditivo)/nsamples)
# ou print((contnvisual + contvisualauditivo)/nsamples)

# 3) Um aluno realiza uma prova com 10 questões do tipo verdadeiro-falso. Calcule a
# probabilidade dele:

# a) acertar todas as questões ao escolher aleatoriamente as respostas
nsamples <- 1000000
cont.gabaritou <- 0
nquestao <- 10
gabarito <- c("V","F","V","V","F","V","F","V","F","F") # um gabarito qualquer
for (i in 1:nsamples) {
  respostas <- sample(c("V","F"), nquestao, replace = T) # monta vetor de respostas
  acertos <- (respostas == gabarito) # retorna um vetor com T onde respostas[i] é igual ao gabarito[i]
  cont.acerto <- length(acertos[(acertos == T)]) # filtra elementos com T e pega o tamanho do vetor
  if (cont.acerto == nquestao) { # verifica a quantidade de acertos
    cont.gabaritou <- cont.gabaritou + 1
  }
}
prob <- (cont.gabaritou/nsamples)
print(prob)

# b) acertar todas as questões sabendo que há mais respostas “verdadeiras” do que “falsas”
nsamples <- 1000000
cont.gabarito.v <- 0
cont.gabaritou <- 0
nquestao <- 10
for (i in 1:nsamples) {
  ngabarito.v <- 0
  while (ngabarito.v <= 5) { # gabarito com mais "V" do que "F"
    gabarito <- sample(c("V","F"), nquestao, replace = T)
    ngabarito.v <- length(gabarito[(gabarito == "V")])
  }
  nresposta.v <- 0
  while (nresposta.v <= 5) { # devido à regra do gabarito, as respostas possuem também mais "V" do que "F"
    resposta <- sample(c("V","F"), nquestao, replace = T)
    nresposta.v <- length(resposta[(resposta == "V")])
  }
  acertos <- (resposta == gabarito) # retorna um vetor com T onde a resposta[i] é igual ao gabarito[i]
  nacerto <- length(acertos[(acertos == T)]) # filtra T e pega o tamanho do vetor
  if (nacerto == nquestao) { # verifica a quantidade de acertos
    cont.gabaritou <- cont.gabaritou + 1
  }
}
print(cont.gabaritou/nsamples)

# c) errar pelo menos uma questão.
nsamples <- 1000000
cont.ngabaritou <- 0
nquestao <- 10
gabarito <- c("V","F","V","V","F","V","F","V","F","F")
for (i in 1:nsamples) {
  respostas <- sample(c("V","F"), nquestao, replace = T)
  acertos <- (respostas == gabarito) # retorna um vetor com T onde são iguais
  cont.acerto <- length(acertos[(acertos == T)]) # filtra T e pega o tamanho do vetor
  if (cont.acerto != nquestao) { # diferença na lógica para o item a
    cont.ngabaritou <- cont.ngabaritou + 1
  }
}
prob <- (cont.ngabaritou/nsamples)
print(prob)

# d) errar pelo menos uma questão sabendo que há mais respostas “verdadeiras” do que
# “falsas”.
nsamples <- 1000000
cont.gabarito.v <- 0
cont.gabaritou <- 0
nquestao <- 10
for (i in 1:nsamples) {
  ngabarito.v <- 0
  while (ngabarito.v <= 5) { # gabarito com mais "V" do que "F"
    gabarito <- sample(c("V","F"), nquestao, replace = T)
    ngabarito.v <- length(gabarito[(gabarito == "V")])
  }
  nresposta.v <- 0
  while (nresposta.v <= 5) { # devido à regra do gabarito, as respostas possuem também mais "V" do que "F"
    resposta <- sample(c("V","F"), nquestao, replace = T)
    nresposta.v <- length(resposta[(resposta == "V")])
  }
  acertos <- (resposta == gabarito) # retorna um vetor com T onde são iguais
  nacerto <- length(acertos[(acertos == T)]) # filtra T e pega o tamanho do vetor
  if (nacerto != nquestao) { # diferença na lógica para o item b
    cont.gabaritou <- cont.gabaritou + 1
  }
}
print(cont.gabaritou/nsamples)
