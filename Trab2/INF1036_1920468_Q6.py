# TRABALHO G2 PROBABILIDADE COMPUTACIONAL - 2022.1
# DANIEL STULBERG HUF - 1920468
# QUESTÃO 6

import numpy as np
import math
import matplotlib.pyplot as plt

# 6) Usando simulação, gere um par de variáveis aleatórias Normais independentes entre si 𝑌 e 𝑋 com média 𝜇 = 6 e 𝜎 = 9.(2,0 pontos)

# Utilizarei o método polar para gerar o par de variáveis aleatórias normais e independentes. Porém, como a distribuição
# normal não é padrão, deve-se ajustar os valores de X e Y para os novos parâmetros 𝜇 e 𝜎

# Gera v.a. exponencial a partir da inversa da exponencial
def exponencial(n_samples, taxa):
    x = np.zeros(n_samples)
    u = np.random.sample(n_samples)
    for i in range(n_samples):
        x[i] = -math.log(1.0-u[i])/taxa
    return x

# Gera v.a. uniforme de parâmetros "a" e "b" a partir da inversa da uniforme
def uniform(n_samples, a, b):
    x = np.zeros(n_samples)
    u = np.random.sample(n_samples)
    for i in range(n_samples):
        x[i] = a + (b-a)*u[i]
    return x

def normalPolar(nsamples, mu, sigma):
    x = np.zeros(nsamples)
    y = np.zeros(nsamples)
    d = exponencial(nsamples, 0.5)
    theta = uniform(nsamples, 0, 2*math.pi)
    for i in range(nsamples):
        r = math.sqrt(d[i])
        x[i] = r*math.cos(theta[i])*sigma + mu  # Somando mu e multiplicando sigma ao valor de x[i] e y[i] para gerar a nova média e desvio padrão desejados
        y[i] = r*math.sin(theta[i])*sigma + mu
    return (x, y)

# par[0] contém X, par[1] contém Y
mu = 6
sigma = 9
parVA = normalPolar(50000, mu, sigma)

print('6.\nMédia de X:', np.mean(parVA[0]))
print('Desvio padrão de X:', np.var(parVA[0])**(1/2))
plt.title("Distribuição de X")
plt.hist(parVA[0], bins=100, facecolor='green')
plt.show()

print('\n')

print('Média de Y:', np.mean(parVA[1]))
print('Desvio padrão de Y:', np.var(parVA[1])**(1/2))
plt.title("Distribuição de Y")
plt.hist(parVA[1], bins=100, facecolor='green')
plt.show()