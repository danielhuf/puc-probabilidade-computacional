# TRABALHO 1 PROBABILIDADE COMPUTACIONAL - 2022.1
# DANIEL STULBERG HUF - 1920468
# QUESTÃO 5

import random
from operator import add

# 5) Suponha que 3 jogadores, Paulo, Sandra e Caio, com dinheiro para gastar, irão participar de um jogo de apostas que
# consiste na realização de uma sequência de rodadas de apostas onde cada um participa, a cada rodada, com a mesma
# quantia monetária, no caso 𝑅$ 1,00, sendo que o vencedor da rodada fica com o dinheiro apostado por todos na
# rodada. O valor que cada jogador possui para gastar é uma variável discreta e em cada aposta cada jogador tem uma
# probabilidade constante de vencer e se um dos jogadores perder todo o seu dinheiro o jogo termina. Supondo que os
# jogadores Paulo, Sandra e Caio iniciarão o jogo com R$ 120,00, R$ 180,00 e R$ 210,00 respectivamente e que
# apresentam probabilidade de vitória em cada rodada dada por 0,4, 0,4 e 0,2 respectivamente, faça:

# a) Simule um jogo de até 500 rodadas e calcule a quantia final com que cada um ficou.

print("Quest 5A")
n_rodadas = 500
valores = [120, 180, 210]
dic_participantes = {0:"Paulo", 1:"Sandra", 2:"Caio"}
probs = ["P", "P", "S", "S", "C"]
fim = False
for i in range(n_rodadas):
    for pos, v in enumerate(valores):
        valores[pos] -= 1  # Todos apostam no inicio da rodada
        
    venc_rodada = random.choice(probs)  # Vencedor é escolhido baseado em sua probabilidade de vitória
    if venc_rodada == "P":
        valores[0] += 3
    elif venc_rodada == "S":
        valores[1] += 3
    else:
        valores[2] += 3
        
    for pos, v in enumerate(valores): # Checando se algum jogador perdeu
        if v == 0:
            fim = True
    if fim:
        print("Jogo finalizado na rodada", i+1)
        break
if not fim:
    print("Jogo realizado até o final")
    
print("Quantias:")
for pos, v in enumerate(valores):
    print(dic_participantes[pos], "->", v)
    
print("=================================================================\n")

# b) Simule 20 jogos de até 500 rodadas e calcule a quantia final média com que cada um ficou.

print("Quest 5B")
n_jogos = 20
n_rodadas = 500
dic_participantes = {0:"Paulo", 1:"Sandra", 2:"Caio"}
probs = ["P", "P", "S", "S", "C"]
valores_tot = [0, 0, 0]
for i in range(n_jogos):
    valores = [120, 180, 210]
    fim = False
    print("JOGO", i+1)
    for j in range(n_rodadas):
        for pos, v in enumerate(valores):
            valores[pos] -= 1  # Todos apostam no inicio da rodada
            
        venc_rodada = random.choice(probs)  # Vencedor é escolhido baseado em sua probabilidade de vitória
        if venc_rodada == "P":
            valores[0] += 3
        elif venc_rodada == "S":
            valores[1] += 3
        else:
            valores[2] += 3

        for pos, v in enumerate(valores): # Checando se algum jogador perdeu
            if v == 0:
                fim = True
        if fim:
            print("Jogo finalizado na rodada", j+1)
            break
    if not fim:
        print("Jogo realizado até o final")
        
    valores_tot = list(map(add, valores_tot, valores))  # Somando ao vetor total os valores finais do i-ésimo jogo
    print("Quantias:")
    for pos, v in enumerate(valores):
        print(dic_participantes[pos], "->", v)
    print("====================\n")
        
print("QUANTIAS MÉDIAS:")
for pos, v in enumerate(valores_tot):
    print(dic_participantes[pos], "->", v/n_jogos)
