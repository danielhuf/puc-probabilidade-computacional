cria_cupom <- function(){
  d1 <- sample(c('A', 'B', 'C', 'D', 'E', 'F'), 1, replace=T)
  d2 <- sample(c('A', 'B', 'C', 'D', 'E', 'F'), 1, replace=T)
  d3 <- sample(c('A', 'B', 'C', 'D', 'E', 'F'), 1, replace=T)
  return(paste(d1, d2, d3, sep=""))
}

nsamples <- 100000;
sem_letra_comum <- 0;
letras_posicoes_diferentes <- 0;
comecam_vogal <- 0;
for (i in 1:nsamples) {
  cupom_samuel <- cria_cupom()
  cupom_catarina <- cria_cupom()
  while (cupom_catarina == cupom_samuel) { # os cupons são unicos
    cupom_catarina <- cria_cupom()
  }
  
  if (!grepl(substr(cupom_samuel,1,1), cupom_catarina, fixed = TRUE) & !grepl(substr(cupom_samuel,2,2), cupom_catarina, fixed = TRUE) & !grepl(substr(cupom_samuel,3,3), cupom_catarina, fixed = TRUE) & !grepl(substr(cupom_catarina,1,1), cupom_samuel, fixed = TRUE) & !grepl(substr(cupom_catarina,2,2), cupom_samuel, fixed = TRUE) & !grepl(substr(cupom_catarina,3,3), cupom_samuel, fixed = TRUE)) {
    sem_letra_comum <- sem_letra_comum + 1
    # nenhuma letra do cupom de samuel esta em catarina e vice-versa
  }
  
  mesmas_letras <- sort(strsplit(cupom_samuel, "")[[1]]) == sort(strsplit(cupom_samuel, "")[[1]])
  if (all(mesmas_letras) == TRUE) {
    if (substr(cupom_samuel,1,1) != substr(cupom_catarina,1,1) & substr(cupom_samuel,2,2) != substr(cupom_catarina,2,2) & substr(cupom_samuel,3,3) != substr(cupom_catarina,3,3)) {
      letras_posicoes_diferentes <- letras_posicoes_diferentes + 1
      # letras sao iguais mas estao em posições diferentes
    }
  }
  
  primeira_letra_samuel <- substr(cupom_samuel,1,1)
  primeira_letra_catarina <- substr(cupom_catarina,1,1)
  if ((primeira_letra_samuel=="A" & primeira_letra_catarina=="A") | (primeira_letra_samuel=="A" & primeira_letra_catarina=="E") | (primeira_letra_samuel=="E" & primeira_letra_catarina=="A") | (primeira_letra_samuel=="E" & primeira_letra_catarina=="E")) {
    comecam_vogal <- comecam_vogal + 1
    # cupons dos dois começam por vogal
  }
}

#a
print(sem_letra_comum/nsamples)

#b
print(letras_posicoes_diferentes/nsamples)

#c
print(comecam_vogal/nsamples)

