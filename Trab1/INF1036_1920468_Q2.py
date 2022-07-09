# TRABALHO 1 PROBABILIDADE COMPUTACIONAL - 2022.1
# DANIEL STULBERG HUF - 1920468
# QUESTÃO 2

import numpy as np

# 2) Suponha que há 3 moedas, cada uma de uma cor diferente, mas todas com probabilidades 2/3 de obter cara e 1/3
# de obter coroa.
# Considere um experimento que consiste em lançar, em sequência as moedas.
# Considere também dois eventos:

# 𝐴 = “obter uma cara e uma coroa nos dois primeiros lançamentos, em qualquer ordem”, e
# 𝐵 = “obter duas caras nos dois últimos lançamentos”.

# Considerando o que foi exposto, resolva os itens abaixo:

# a) Utilizando simulação calcule 𝑃(𝐴) e 𝑃(𝐵).

p_cara = (2/3)
cont_cara1_coroa2 = 0
cont_coroa1_cara2 = 0
cont_cara2_cara3 = 0
n_samples = 10000
U1 = list(np.random.sample(n_samples))  # amostras do primeiro lançamento
U2 = list(np.random.sample(n_samples))  # amostras do segundo lançamento
U3 = list(np.random.sample(n_samples))  # amostras do terceiro lançamento
for i in range(n_samples):
    if (U1[i] < p_cara) and (U2[i] >= p_cara):  # cara no lanc 1 e coroa no lanc 2
        cont_cara1_coroa2 += 1
    
    if (U1[i] >= p_cara) and (U2[i] < p_cara):  # coroa no lanc 1 e cara no lanc 2
        cont_coroa1_cara2 += 1
        
    if (U2[i] < p_cara) and (U3[i] < p_cara):   # cara no lanc 2 e cara no lanc 3
        cont_cara2_cara3 += 1
print("Quest 2A")
print("P(A) =", (cont_cara1_coroa2 + cont_coroa1_cara2) / (n_samples))
print("P(B) =", (cont_cara2_cara3) / (n_samples))
print('\n')
# Resposta analítica -> P(A) = P(B) = 4/9 ~ 0.444444

# b) 𝐴 e 𝐵 são eventos independentes?

# "Dois eventos 𝐴 e 𝐵 são ditos estatisticamente independentes se e somente se 𝑃(𝐴 ∩ 𝐵) = 𝑃(𝐴)𝑃(𝐵)
# Possíveis lançamentos:

pCara = (2/3)
pCoroa = (1/3)

Ca_Ca_Ca = pCara * pCara * pCara
Ca_Ca_Co = pCara * pCara * pCoroa
Ca_Co_Ca = pCara * pCoroa * pCara
Ca_Co_Co = pCara * pCoroa * pCoroa
Co_Ca_Ca = pCoroa * pCara * pCara
Co_Ca_Co = pCoroa * pCara * pCoroa
Co_Co_Ca = pCoroa * pCoroa * pCara
Co_Co_Co = pCoroa * pCoroa * pCoroa

# Realizando os cálculos:

prob_A_int_B = Co_Ca_Ca # 𝐴 ∩ 𝐵 = obter uma coroa e uma cara nos dois primeiros lançamentos, respectivamente, e obter duas caras nos dois últimos lançamentos
prob_A_vezes_B = (Ca_Co_Ca + Ca_Co_Co + Co_Ca_Ca + Co_Ca_Co) * (Ca_Ca_Ca + Co_Ca_Ca)
print("Quest 2B")
print("P(𝐴 ∩ 𝐵) =", prob_A_int_B)
print("P(A)*P(B) =", prob_A_vezes_B)
if prob_A_int_B == prob_A_vezes_B:
    print("P(𝐴 ∩ 𝐵) = P(A)*P(B), logo A e B são eventos independentes.")
else:
    print("P(𝐴 ∩ 𝐵) ≠ P(A)*P(B), logo A e B não são eventos independentes.")
print('\n')
# Observa-se que os eventos não são independentes. 
# De fato, saber que foram obtidas duas caras nos dois últimos lançamentos faz com que a probabilidade do evento A seja
# alterada, já que impossibilita o caso em que o resultado foi cara no primeiro lançamento e coroa no segundo.



