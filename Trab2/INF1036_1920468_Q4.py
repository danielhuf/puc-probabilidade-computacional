# TRABALHO G2 PROBABILIDADE COMPUTACIONAL - 2022.1
# DANIEL STULBERG HUF - 1920468
# QUESTÃO 4

import numpy as np
import matplotlib.pyplot as plt

# 4) Usando o Método da Inversa, implemente uma função para gerar uma variável aleatória contínua 𝑋 cuja função densidade é dada por: (2,0 pontos)

# a) 𝑓(𝑥) = 3𝑥^2, 0 ≤ 𝑥 ≤ 1

# A função de distribuição acumulada de f(x) é dada por F(x) = Int(3t^2 dt, 0..x) = x^3, 0 <= x <=1. 
# A inversa de F(x) é dada por F^-1(u) = u^(1/3)

def geraX_1(n_samples):
    X = np.zeros(n_samples) # n_samples posições com 0
    U = np.random.sample(n_samples) # n_samples valores em [0.0, 1.0)
    for i in range(n_samples):
        X[i] = U[i]**(1/3)
    return X

print('4. a)')
n_samples = 50000
X = geraX_1(n_samples)
plt.hist(X, bins=100, color='green')
plt.title('Histograma gerado')
plt.show()

x = np.linspace(0, 1)
y = 3 * x**2
plt.plot(x, y, color='green')
plt.title('Função de densidade')
plt.show()

# b) 𝑓(𝑥) = { 5𝑥,         0 ≤ 𝑥 ≤ 0,4
#         (10/3)*(1-x),  0,4 < 𝑥 ≤ 1 }

# A função de distribuição acumulada de f(x) é dada por F(x) = Int(5t dt, 0..x), 0 <= x <= 0.4, e Int(5t dt, 0..0.4) + Int((10/3)*(1-t) dt, 0.4..x), 0.4 < x <= 1
# Segue que F(x) = (5*x^2)/2, 0 <= x <= 0.4, e 0.4 + (10/3)*(-0.5*x^2 + x - 0.32), 0.4 < x <= 1

# A inversa de F(x) é dada por F^-1(u) = (2*u/5)^(1/2), 0 <= x <= 0.4, e -(-10 + (-60*u + 60)^(1/2))/10, 0.4 < x <= 1

def f(x):
    if x <= 0.4:
        return 5*x
    elif x<=1:
        return (10/3)*(1-x)
    else:
        return 0

def geraX_2(n_samples):
    X = np.zeros(n_samples) # n_samples posições com 0
    U = np.random.sample(n_samples) # n_samples valores em [0.0, 1.0)
    for i in range(n_samples):
        if U[i] <= 0.4:
            X[i] = (2*U[i]/5)**(1/2)
        else:
            X[i] = -(-10+(-60*U[i]+60)**(1/2))/10
    return X

print('\n\n\n4. b)')
n_samples = 50000
X = geraX_2(n_samples)
plt.hist(X, bins=100, color='green')
plt.title('Histograma gerado')
plt.show()

x = np.linspace(0, 1)
y = np.vectorize(f)(x)
plt.plot(x, y, color='green')
plt.title('Função de densidade')
plt.show()