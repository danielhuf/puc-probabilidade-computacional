# GRÁFICO DE DISPERSÃO
n<-200
x<-1:n
y <-10+3*x
plot(x,y)

y<-y+rnorm(n, sd=50)
plot(x,y)
plot(x,y, type="l")

# HISTOGRAMA
x<-rnorm(500)
hist(x)
hist(x, breaks=6)

# BOXPLOT
idade<-c(8, 9, 12, 20, 22, 18, 21, 18, 35, 23, 10, 12, 17)
summary(idade)
boxplot(idade, main="Boxplot: Idade", col="blue")

# GRÁFICO DE BARRAS
filhos<-c(0, 2, 1, 3, 2, 0, 1, 3, 1, 1, 1, 0, 0)
tabela<-table(filhos)
barplot(tabela, main="Paternidade", xlab="Quantidade de filhos", ylab="Quantidade de pessoas")

# GRÁFICO DE SETORES
pie(tabela, main="Paternidade")

#===============================================================================================
library(ggplot2)
library(DAAG)

ggplot(data=mtcars)  # primeira camada
ggplot(data=ais) + geom_point(mapping=aes(x = wt, y = ht))   # segunda camada (forma geométrica)
ggplot(data=ais) + geom_point(mapping=aes(x = wt, y = ht)) + labs(x = "Peso", y = "Altura")  # terceira camada (rótulos)
ggplot(data=ais) + geom_point(mapping=aes(x = wt, y = ht, color = as.factor(sex))) + labs(x = "Peso", y = "Altura") 
ggplot(data=ais) + geom_point(mapping=aes(x = wt, y = ht, color = pcBfat)) + labs(x = "Peso", y = "Altura") 
ggplot(data=ais) + geom_point(mapping=aes(x = wt, y = ht, color = pcBfat, size=ferr)) + labs(x = "Peso", y = "Altura") 
ggplot(ais, aes(y = wt, x = ht)) + geom_point(color = "red", szie = 5, shape = 4, alpha = 0.2) + labs(x = "Peso", y = "Altura")
   
ggplot(ais) + geom_histogram(aes(x=ht), bins=30)                           
ggplot(ais) + geom_bar(aes(x=as.factor(sport)), bins=30)   
ggplot(ais) + geom_boxplot(aes(x=as.factor(sex), y=ht), bins=30)   
ggplot(ais) + geom_boxplot(aes(x=as.factor(sex), y=ht, fill=as.factor(sex)), bins=30) 
ggplot(data = ais) + geom_point(mapping = aes(x=wt, y=ht)) + facet_grid(sex~.)
ggplot(data = ais) + geom_point(mapping = aes(x=wt, y=ht)) + facet_grid(.~sex)

ggplot(data = mtcars) +
geom_point(mapping = aes(x = hp, y = mpg)) +
labs(x = "Potência", y = "Milhas por galão") +
ggtitle("Gráfico de dispersão") +
theme(plot.title = element_text(hjust = 0.50))

ggplot(data = mtcars) +
geom_bar(mapping = aes(x = cyl)) +
labs(x = "Cilindros", y = "Quantidade") +
ggtitle("Gráfico de barras") +
theme(plot.title = element_text(hjust = 0.50))

ggplot(data = mtcars) +
geom_histogram(mapping = aes(mtcars$mpg), bins = 8) +
labs(x = "Milhas por galão", y = "Frequência") +
ggtitle("Histograma") +
theme(plot.title = element_text(hjust = 0.50))

ggplot(data = mtcars) +
geom_boxplot(mapping = aes(x = as.factor(cyl), y = hp, fill = as.factor(cyl))) +
labs(x = "Cilindros", y = "Potência") +
ggtitle("Boxplot") +
theme(plot.title = element_text(hjust = 0.50))

ggplot(data = mtcars) +
geom_point(mapping = aes(x = hp, y = mpg)) +
facet_grid (cyl~.) +
labs(x = "Potência", y = "Milhas por galão") +
ggtitle("Gráfico de dispersão") +
theme(plot.title = element_text(hjust = 0.50))

