# TRABALHO G2 PROBABILIDADE COMPUTACIONAL - 2022.1
# DANIEL STULBERG HUF - 1920468
# QUESTÃO 1

import random

# 1) Calcule, utilizando simulação, a probabilidade de que ao gerar, de forma aleatória, três números com cinco dígitos: (1,0 ponto)

# a) os três possuam pelo menos dois dígitos iguais.
n_samples = 10000
todos_pelo_menos_dois_digitos_iguais = 0

for i in range (n_samples):
    
    # Gerando 3 números aletórios com 5 cinco dígitos cada (método randint inclui os limites)
    n1 = random.randint(10000, 99999)
    n2 = random.randint(10000, 99999)
    n3 = random.randint(10000, 99999)
    
    # Verificando se o número de caracteres únicos de cada número (formatado como string) é menor do que de 5, significando que ele possui ao menos um dígito igual
    if len(''.join(set(str(n1)))) < 5 and len(''.join(set(str(n2)))) < 5 and len(''.join(set(str(n3)))) < 5:
        todos_pelo_menos_dois_digitos_iguais += 1
        
prob = todos_pelo_menos_dois_digitos_iguais / n_samples
print('1. a) Probabilidade:', prob) 
# Resposta analítica = [1 - (10/10)*(9/10)*(8/10)*(7/10)*(6/10)]^3 ~ 0.3395

# b) apenas um possua todos os dígitos diferentes.
n_samples = 10000
somente_um_todos_digitos_diferentes = 0

for i in range (n_samples):
    
    # Gerando 3 números aletórios com 5 cinco dígitos cada (método randint inclui os limites)
    n1 = random.randint(10000, 99999)
    n2 = random.randint(10000, 99999)
    n3 = random.randint(10000, 99999)
    
    # Verificando se o número de caracteres únicos de somente 1 dos 3 números é igual a 5, significando que ele contém todos os dígitos diferentes
    l1 = len(''.join(set(str(n1))))
    l2 = len(''.join(set(str(n2))))
    l3 = len(''.join(set(str(n3))))
    
    if (l1 == 5 and l2 < 5 and l3 < 5) or (l1 < 5 and l2 == 5 and l3 < 5) or (l1 < 5 and l2 < 5 and l3 == 5):
        somente_um_todos_digitos_diferentes += 1
        
prob = somente_um_todos_digitos_diferentes / n_samples
print('1. b) Probabilidade:', prob) 
# Resposta analítica = [1 - (10/10)*(9/10)*(8/10)*(7/10)*(6/10)]^2 * [(10/10)*(9/10)*(8/10)*(7/10)*(6/10)] * 3 ~ 0.4415