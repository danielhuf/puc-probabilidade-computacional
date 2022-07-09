# TRABALHO 1 PROBABILIDADE COMPUTACIONAL - 2022.1
# DANIEL STULBERG HUF - 1920468
# QUESTÃO 4

import numpy as np

# 4) A função de densidade 𝑓(𝑥) de uma variável aleatória 𝑋 é dada por:
# 𝑓(𝑥) = { 
#         𝑐(𝑥^3 - 𝑥^4), 𝑠𝑒 0 ≤ 𝑥 ≤ 1
#         0,  𝑐𝑎𝑠𝑜 𝑐𝑜𝑛𝑡𝑟á𝑟𝑖o
#        }
# Usando simulação, faça:

# a) Determine o valor de 𝑐, sabendo que 𝑐 é inteiro e pertence ao intervalo [15, 25].

# Utilizarei a função "aproximador", que irá aproximar o resultado da integral através da média de uma soma de variáveis
# aleatórias independentes e uniformemente distribuídas em [0, 1]. Irei iterar a função aproximador com os possíveis valores de c,
# e a resposta será aquela que retornar o valor mais próximo de 1 (resultado analítico da integração de f(x) no intervalo [0, 1])

def aproximador(U, c):
    retorno = 0
    vetor = []
    for i in range(len(U)):
        gx = c * ((U[i]**3) - (U[i]**4))
        vetor.append(gx)
    return np.mean(vetor)

nsamples = 10000
U = np.random.sample(nsamples)
resps = []
for c in range(15, 26):       # iterando os possíveis valores de c
    r = aproximador(U, c)     # encontrando o resultado aproximado da integral
    resps.append(r)
mais_proximo = min(resps, key=lambda x:abs(x-1))     # encontrando o valor mais próximo de 1
for pos, val in enumerate(resps):
    if val == mais_proximo:
        c = (pos + 15)                               # encontrando o valor de c referente ao valor mais próximo
        break
print("Quest 4A")
print("O valor de c é", c)
print('\n')  

# b) Calcule 𝐸(𝑋) e 𝑉𝑎𝑟(𝑋).

# Sabemos que E(X) = int(x*c*(x^3 - x^4)*dx, range=0..1) e que Var(X) = E(X^2) - [E(X)]^2.
# Utilizando as funções "aproximador2" e "aproximador3" para resolver as integrais, e passando como parâmetro o valor c descoberto no item anterior:

def aproximador2(U, c):
    retorno = 0
    vetor = []
    for i in range(len(U)):
        gx = c * U[i] * ((U[i]**3) - (U[i]**4))
        vetor.append(gx)
    return np.mean(vetor)

def aproximador3(U, c):
    retorno = 0
    vetor = []
    for i in range(len(U)):
        gx = c * (U[i]**2) * ((U[i]**3) - (U[i]**4))
        vetor.append(gx)
    return np.mean(vetor)

nsamples = 10000
U = np.random.sample(nsamples)
E_X = aproximador2(U, c)     # encontrando o resultado aproximado da integral (resposta analítica = 2/3 ~ 0.666)

# Primeiro termo da subtração de Var(x)
E_X2 = aproximador3(U, c)    # encontrando o resultado aproximado da integral (resposta analítica = 10/21 ~ 0.476)

# Segundo termo da subtração de Var(x)
E_X_2 = E_X**2

Var_X = E_X2 - E_X_2  # (resposta analítica = (10/21 - 4/9) ~ 0.0317)
print("Quest 4B")
print("E(X) =", E_X) 
print("Var(X) =", Var_X)
print('\n')


