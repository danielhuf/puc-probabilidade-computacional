# Daniel Stulberg Huf
grande_amostra <- rgeom(10000, 0.2)  #distribuição geometrica com prob 0.2
media_reamostras <- rep(0, 500)
for (i in 1:500) {
  reamostra <- sample(grande_amostra, 50);
  media <- mean(reamostra);
  media_reamostras[i] <- media
}
media_reamostras<- sort(media_reamostras)
plot (media_reamostras, type = "l")
hist(media_reamostras, breaks=50)

x <- 0:105
y <- dbinom(x, 105, 0.6)
plot(x,y)
# Para n grande, a binomial tende a uma distribuição de Poisson
