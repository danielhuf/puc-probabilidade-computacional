# Aula 3 Prob Comp (15/03)

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

num = 3 * 4 * (5**3) # potenciação ** ou ^
print(num) 
