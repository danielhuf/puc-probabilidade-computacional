# Aula 4 Prob Comp (22/03)

x <- 45
print(class(x))

y <- 45
print(class(y))

cor <- c("verde", "amarelo")
cor 
mode(cor)
length(cor)
class(cor)
v <- 1:5
v
mode(v)
length(v)
class(v)

v <- scan() 
v <- scan(what = " ", sep = ",")

v <- c(2, 5, 7, 8, 9, 10, 12, 3, 7, 9)
v
v1 <- v[6]
v1
v2 <- v[3:5]
v2
v3 <- v[c(2, 4, 10)]
v3

z <- 1 + 2i
z
class(z)

v <- 1:12
mat <- matrix(v, ncol = 3, byrow=TRUE)
mat
