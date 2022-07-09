# TRABALHO G2 PROBABILIDADE COMPUTACIONAL - 2022.1
# DANIEL STULBERG HUF - 1920468
# QUESTÃO 2

import numpy as np
import math

# 2) Considerando 𝑔(𝑥) = 𝑥𝑙𝑛(𝑥) uma função, calcule o valor aproximado de 𝜑, onde: 𝜑 = Int(g(x)dx, 1..3) (1,0 ponto)

# De acordo com a observação feita na questão, podemos substituir g(x) por h(y) e substituir os limites de integração por 0 e 1. Temos que:
#  ℎ(𝑦) = 𝑔(𝑎 + [𝑏 − 𝑎]𝑦)(𝑏 − 𝑎). 
# Para a = 1 e b = 3, temos que h(y) = g(1 + 2*y) * 2 = (1 + 2*y) * ln(1 + 2*y) * 2 = (2 + 4*y) * ln(1 + 2*y)

# Utilizarei a função "aproximador", que irá aproximar o resultado da integral através da média de uma soma de variáveis
# aleatórias independentes e uniformemente distribuídas em [0, 1.0).

def aproximador(n_samples):
    U = np.random.sample(n_samples)  # Utilizando o algoritmo Mersenne Twister para gerar um vetor de números pseudo-aleatórios 
    vetor = []
    
    for i in range(n_samples):
        hy = (2 + 4*U[i]) * math.log(1 + 2*U[i]) # cálculo da hy 
        vetor.append(hy)
        
    return np.mean(vetor)

n_samples = 50000
valor_aproximado = aproximador(n_samples)
print('2. Valor aproximado:', valor_aproximado)
# Resposta analítica = [(9/2)*ln(3) - 2] ~ 2.9438