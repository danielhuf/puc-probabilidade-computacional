# TRABALHO 1 PROBABILIDADE COMPUTACIONAL - 2022.1
# DANIEL STULBERG HUF - 1920468
# QUESTÃO 1

# Referência L'Ecuyer para parâmetros do LCG -> https://www.iro.umontreal.ca/~lecuyer/myftp/papers/clcg4.ps (pp.6, j=1)

import random
import numpy as np

def LCG(seed, a, c, M, nsamples):
    x = seed
    u = []
    for i in range(nsamples):
        nx = (a * x + c) % M
        u.append(float(nx) / float(M)) # Gerando numero pseudo aleatorio entre 0 e 1
        x = nx
    return u

def LM(n_moedas, nsamples):
    l = []
    for i in range(nsamples):
        soma = 0
        for j in range(n_moedas):
            lancamento = random.choice([1, 0])  # cara ou coroa
            soma += (lancamento * (2**j))
        l.append(soma/((2**n_moedas)-1))  # Gerando numero pseudo aleatorio entre 0 e 1
    return l 

def MT(nsamples):
    return list(np.random.sample(nsamples)) # Retorna lista com n valores no intervalo semiaberto [0.0, 1.0)

# a) Construa um código baseado no LM e LCG para realizar uma simulação com 10.000 lançamentos simultâneos de
# uma moeda e de um dado (6 faces), ambos honestos, e apresentar em quantos lançamentos o resultado obtido foi
# cara e face 4. O LM deve ser utilizado para tratar o lançamento da moeda e o LCG para tratar o lançamento do dado.

cont_cara_face4 = 0
# a = 39373  # exemplo do slide
a = 45991    # L'Ecuyer
c = 0
M = 2147483647 # L'Ecuyer, M = 2^31 - 1
n_lanc = 10000
p_moeda = 0.5
U = LCG(3, a, c, M, n_lanc)
L = LM(10, n_lanc)  # Simulando LM com 10 lançamentos de moedas
for i in range(n_lanc): 
    if (L[i] < p_moeda) and (int(U[i] * 6.0) + 1) == 4:  # Resultado obtido foi cara e face 4
        cont_cara_face4 += 1
print("Quest 1A")
print("Número de lançamentos com cara e face 4 =", cont_cara_face4)
print("Prob(X) = ", cont_cara_face4/n_lanc)  # Resposta analítica = (1/2)*(1/6) = 1/12 ~ 0.08333
print('\n')

# b) Construa um código baseado no Mersenne Twister e LM para realizar uma simulação com 10.000 lançamentos
# simultâneos de uma moeda e de um dado (6 faces), ambos honestos, e apresentar em quantos lançamentos o
# resultado obtido foi cara e face 4. O Mersenne Twister deve ser utilizado para tratar o lançamento da moeda e o LM
# para tratar o lançamento do dado

cont_cara_face4 = 0
n_lanc = 10000
p_moeda = 0.5
U = MT(n_lanc)
L = LM(10, n_lanc)  # Simulando LM com 10 lançamentos de moedas
for i in range(n_lanc):
    if (U[i] < p_moeda) and (int(L[i] * 6.0) + 1) == 4: # Resultado obtido foi cara e face 4
        cont_cara_face4 += 1
        
print("Quest 1B")
print("Número de lançamentos com cara e face 4 =", cont_cara_face4)
print("Prob(X) = ", cont_cara_face4/n_lanc)  # Resposta analítica = (1/2)*(1/6) = 1/12 ~ 0.08333
print('\n')

# c) Construa um código baseado no LCG e no LM para realizar uma simulação com 10.000 lançamentos simultâneos de
# uma moeda viciada (probabilidade de obter cara é 0,4) e de um dado (6 faces) honesto e apresentar a probabilidade
# de se obter pelo menos um dos resultados: cara e face 4; coroa e face 2 ou 6. O LCG deve ser utilizado para tratar o
# lançamento da moeda e o LM para tratar o lançamento do dado.

cont_cara_face4 = 0
cont_coroa_face26 = 0
# a = 39373  # exemplo do slide
a = 45991  # L'Ecuyer
c = 0
M = 2147483647  # L'Ecuyer, M = 2^31 - 1
n_lanc = 10000
p_cara = 0.4
U = LCG(3, a, c, M, n_lanc)
L = LM(10, n_lanc)  # Simulando LM com 10 lançamentos de moedas
for i in range(n_lanc):
    if (U[i] < p_cara) and (int(L[i] * 6.0) + 1) == 4:     # Resultado obtido foi cara e face 4
        cont_cara_face4 += 1
    elif (U[i] >= p_cara) and (int(L[i] * 6.0) + 1) in [2, 6]: # Resultado obtido foi coroa e face 2 ou 6
        cont_coroa_face26 += 1
            
print("Quest 1C")
print("Número de lançamentos com cara e face 4 =", cont_cara_face4)
print("Número de lançamentos com coroa e face 2 ou 6 =", cont_coroa_face26)
print("Prob(X) = ", (cont_cara_face4 + cont_coroa_face26)/n_lanc)   # Resposta analítica = (2/5)*(1/6) + 2*(3/5)*(1/6) = 4/15 ~ 0.2666
print('\n')







