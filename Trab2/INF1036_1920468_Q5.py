# TRABALHO G2 PROBABILIDADE COMPUTACIONAL - 2022.1
# DANIEL STULBERG HUF - 1920468
# QUESTÃO 5

import numpy as np
import matplotlib.pyplot as plt

# 5) Usando o Método da Rejeição, implemente uma função que gere uma amostra de uma variável aleatória 𝑋 com função densidade de probabilidade dada por: (2,0 pontos)
# 𝑝(𝑥) = 30𝑥^4 *(1 − 𝑥), 0 < 𝑥 < 1
# Use uma distribuição Uniforme (0, 1) como ℎ(𝑥). A função implementada deverá receber como parâmetro o tamanho da amostra.

# Temos que p(x)/h(x) = [30*x^4*(1-x)] / [1/(1-0)] = 30*x^4*(1-x)
# Para encontrar o valor de x que maximiza p(x)/h(x), derivamos p(x)/h(x) e igualamos a 0, obtendo x = 0.8 e c = p(0.8)/h(0.8) = 2.4576

def p(x):
    return (30 * x**4 * (1-x))

def h(x):
    return (1/(1-0))

# Inversa da uniforme (0,1) usada para gerar a variável aleatória Y
def inversa_h(x):
    return (0 + (1-0)*x)

def gera_X(n_samples):
    x = np.zeros(n_samples)
    c = 2.4576
    for i in range(n_samples):
        while (True):
            u1 = np.random.sample(1)
            y = inversa_h(u1) # gera Y a partir da inversa
            u2 = np.random.sample(1)
            if (u2 <= p(y)/(c*h(y))):
                x[i] = y  # não estou fazendo simetria em relação à origem pois só estamos interessados no intervalo (0,1)
                break
    return x

n_samples = 50000
X = gera_X(n_samples)
print('5.\nMédia de X:', np.mean(X))
print('Variância de X:', np.var(X))
print('\n')

plt.hist(X, bins=100, color='green')
plt.title('Histograma gerado')
plt.show()

x = np.linspace(0, 1)
y = 30 * x**4 * (1-x)
plt.plot(x, y, color='green')
plt.title('Função de densidade')
plt.show()