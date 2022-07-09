# SLIDE 3 - TÉCNICAS DE CONTAGEM

# PRODUTO CARTESIANO
A = c('a', 'b', 'c')
B = c('p', 'q')
W = list() #W é uma lista
k = 1
for(i in 1: length(A)){
  for(j in 1: length(B)){
    W[[k]] = c(A[i], B[j])
    k = k + 1
  }
}
print(W)

# PERMUTAÇÕES SIMPLES
fatorial <- function(n){
  if (n == 0)
    return (1)
  else
    return (n * fatorial(n - 1))
}
print(fatorial(5))

# PERMUTAÇÕES CAÓTICAS
permutacao_caotica <- function(n){
  retorno = 0
  for(i in 0:n){
    retorno = retorno + (((-1)^i)/fatorial(i))
  }
  retorno = fatorial(n) * retorno
  return(retorno)
}
print(permutacao_caotica(5))

# ARRANJOS
arranjo <- function(n, p){
  return (fatorial(n) / fatorial(n - p))
}
print(arranjo(5,3))

# ARRANJOS COM REPETIÇÃO
Arranjo_com_repeticao <- function(n, p){
  return (n^p)
}
print(Arranjo_com_repeticao(5,3))

# COMBINAÇÕES SIMPLES
combinacao <- function(n, p) {
  return (fatorial(n) / (fatorial(p) * fatorial(n - p)))
}
print(combinacao(5,3))

# COMBINAÇÕES COMPLEMENTARES
combinacao_complementar <- function(n, p) {
  nc = n
  pc = n - p
  return (fatorial(nc) / (fatorial(pc) * fatorial(nc - pc)))
}
print(combinacao_complementar(5,3))

# COMBINAÇÕES COMPLETAS (COM REPETIÇÃO)
combinacao_completa <- function(n, p) {
  nc = n + p - 1
  pc = p
  return (fatorial(nc) / (fatorial(pc) * fatorial(nc - pc)))
}
print(combinacao_completa(5,3))

# CONJUNTO POTÊNCIA
potencia_recursiva <- function (posicao, vetor, vetoruso) {
  subconjunto <- NULL
  if ((posicao - 1) == length(vetor)) { # Montamos o subconjunto
    for (i in 1:length(vetor)) # Escrevemos o subconjunto
      if (vetoruso[i])
        subconjunto <- c(subconjunto, vetor[i])
    print(subconjunto)
  } else { # Se não terminamos, continuar a gerar
    vetoruso[posicao] = T # Subconjuntos que incluem o elemento corrente
    potencia_recursiva(posicao + 1, vetor, vetoruso) # Chamada recursiva
    vetoruso[posicao] = F # Subconjuntos que não incluem o elemento corrente
    potencia_recursiva(posicao + 1, vetor, vetoruso) # Chamada recursiva
  }
}
A <- c("x","y")
uso <- rep(F, length(A))
potencia_recursiva (1, A, uso)

# FUNÇÃO DE EULER
funcao_Euler <- function (n) {
  retorno <- 0
  fator <- 2
  decomposicao <- NULL
  produto <- 1
  nfatorado <- n
  while (nfatorado != 1){
    multiplicidade = 0
    while ((nfatorado %% fator) == 0) {
      nfatorado = nfatorado / fator
      multiplicidade = multiplicidade + 1
    }
    if (multiplicidade != 0)
      decomposicao <- rbind (decomposicao, c(fator, multiplicidade))
    fator = fator + 1
  }
  for (i in seq(1:nrow(decomposicao)))
    produto = produto * ( 1 - (1/decomposicao[i, 1]))
  retorno = n * produto
  return (retorno)
}
funcao_Euler(5)
