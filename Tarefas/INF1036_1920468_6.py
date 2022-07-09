# Temos três mesas laterais idênticas. Cada mesa tem 2 gavetas, cada uma com uma moeda. Uma
# mesa contém 2 moedas de 1 real, a outra 2 moedas de 1 euro e a terceira uma moeda de cada
# tipo. Ao escolher uma mesa de forma aleatória abre-se uma gaveta de forma aleatória e verificase que esta contém uma moeda de 1 euro. Qual é a probabilidade de que a segunda moeda
# dessa cômoda também seja de 1 euro? Encontre o resultado usando simulação

import random

n_samples = 10000
n_mesma_comoda_dois_euros = 0
mesas = [1, 2, 3]

for i in range(n_samples):
    
    moeda = ""
    
    # Forçando a retirada de um euro
    while moeda != "euro":
        
        # Reinicializando as gavetas
        gavetas_1 = ["real", "real"]
        gavetas_2 = ["euro", "euro"]
        gavetas_3 = ["real", "euro"]
        
        # Escolhendo uma mesa aleatoriamente
        mesa = random.choice(mesas)
        
        # Escolhendo a moeda aleatoriamente e tirando ela da gaveta
        if mesa == 1:
            moeda = random.choice(gavetas_1)
            gavetas_1.remove(moeda)
            
        elif mesa == 2:
            moeda = random.choice(gavetas_2)
            gavetas_2.remove(moeda)
            
        else: # mesa == 3
            moeda = random.choice(gavetas_3)
            gavetas_3.remove(moeda)
            
    # Verificando se a outra moeda da mesa escolhida no passo anterior também é um euro
    if mesa == 1:
        moeda = gavetas_1[0]  # pegando o primeiro e único elemento, pois antes eram 2, mas 1 foi removido
        
    elif mesa == 2:
        moeda = gavetas_2[0]
        
    else: # mesa == 3
        moeda = gavetas_3[0]
        
    if moeda == "euro":
        n_mesma_comoda_dois_euros += 1
        
prob = n_mesma_comoda_dois_euros/n_samples
print(prob)