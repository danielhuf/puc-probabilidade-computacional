# TRABALHO 1 PROBABILIDADE COMPUTACIONAL - 2022.1
# DANIEL STULBERG HUF - 1920468
# QUESTÃO 3

import random

# 3) Uma prova é composta por questões de múltipla escolha com 5 alternativas e apenas uma correta. Dos alunos de
# uma turma, sabe-se que 50% sabem resolver a questão de número 12. Sabe-se ainda que os que não sabem fazer
# “chutam” a resposta, ou seja, escolhem de forma aleatória uma alternativa.
# Um aluno da turma é escolhido ao acaso. 

# a) Resolva por simulação:

# a.1) Qual é a probabilidade de que ele tenha acertado a questão 12?

n_alunos = 10000 # amostra com 10000 alunos
cont_acertos = 0 # quantidade de acertos atualizada após simulação
for i in range(n_alunos):
    resp = random.choice(["S", "N"]) # aluno sabe ou não sabe responder (50% de chance)
    if resp == "S":
        cont_acertos += 1     # aluno que sabe responder é contabilizado
    else:
        alt = random.choice(["V", "F", "F", "F", "F"]) # 5 alternativas e apenas 1 correta (aleatoriamente)
        if alt == "V":
            cont_acertos += 1 # aluno que não sabe responder, mas que chuta correto, é contabilizado
print("Quest 3A1")
print("P(X) =", cont_acertos/n_alunos)  # Resposta analítica = (1/2)*(1) + (1/2)*(1/5) = 0.6
print('\n')

# a.2) Dado que o aluno acertou a questão 12, qual é a probabilidade de que ele tenha “chutado”?

n_alunos = 10000 # amostra com 10000 alunos
cont_acerto_sabendo = 0
cont_acerto_chutando = 0
for i in range(n_alunos):
    resp = random.choice(["S", "N"]) # aluno sabe ou não sabe responder (50% de chance)
    if resp == "S":
        cont_acerto_sabendo += 1  # aluno que sabe responder é contabilizado
    else:
        alt = random.choice(["V", "F", "F", "F", "F"]) # 5 alternativas e apenas 1 correta (aleatoriamente)
        if alt == "V":
            cont_acerto_chutando += 1 # aluno que não sabe responder, mas que chuta correto, é contabilizado
print("Quest 3A2")
print("P(X) =", cont_acerto_chutando/(cont_acerto_sabendo + cont_acerto_chutando))  # Resposta analítica = (1/2)*(1/5) / ((1/2)*(1) + (1/2)*(1/5)) = 1/6 ~ 0.1666
print('\n')

# a.3) Se a prova é composta por 15 questões e o aluno não sa
# aleatoriamente todas as respostas, qual a probabilidade de ele obter uma nota superior a 4?

# Uma nota 4/10 significa que foram acertadas 6 questões de 15. Logo, deve-se calcular a probabilidade de acertar
# 7 ou mais questões, de um total de 15

n_alunos = 100000 # amostra com 100000 alunos
nota_mais4 = 0
n_quest = 15
gabarito = random.choices(["A", "B", "C", "D", "E"], k=n_quest)  # um gabarito qualquer
for i in range(n_alunos):
    resp = random.choices(["A", "B", "C", "D", "E"], k=n_quest)  # um chute qualquer para cada questão
    acertos = [i for i, j in zip(resp, gabarito) if i == j]      # comparando, questão por questão, a resposta com o gabarito
    if len(acertos) > 6:
        nota_mais4 += 1
print("Quest 3A3")
print("P(X) = {:.5f}".format(nota_mais4/n_alunos))
print('\n')

# b) Refaça o item a.3 de forma analítica.
def fatorial(n):
    if (n == 0):
        return (1)
    else:
        return (n * fatorial(n - 1))
    
def combinacao(n, p):
    return (fatorial(n) / (fatorial(p) * fatorial(n - p)))

def dbinom(n, k, p):
    return (combinacao(15,k) * (p**k) * ((1-p)**(n-k)))

n_quest = 15
p_acerto_quest = 0.2

prob_acertar_0 = dbinom(n_quest, 0, p_acerto_quest)
prob_acertar_1 = dbinom(n_quest, 1, p_acerto_quest)
prob_acertar_2 = dbinom(n_quest, 2, p_acerto_quest)
prob_acertar_3 = dbinom(n_quest, 3, p_acerto_quest)
prob_acertar_4 = dbinom(n_quest, 4, p_acerto_quest)
prob_acertar_5 = dbinom(n_quest, 5, p_acerto_quest)
prob_acertar_6 = dbinom(n_quest, 6, p_acerto_quest)

p_acumulada = prob_acertar_0 + prob_acertar_1 + prob_acertar_2 + prob_acertar_3 + prob_acertar_4 + prob_acertar_5 + prob_acertar_6
# p_acumulada equivale à função acumulada da distribuição binomial (15, 0.2) até k=6, ou seja, P(X <= 6)

prob_tirar_mais_4 = 1 - p_acumulada

print("Quest 3B")
print("P(X) =", prob_tirar_mais_4)
print('\n')



