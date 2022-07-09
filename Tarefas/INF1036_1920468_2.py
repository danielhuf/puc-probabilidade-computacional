import random

def calcula_prob(nCasais):
    
    prob1 = 0
    prob2 = 0
    nSamples = 1000

    for s in range(nSamples):
    
        l_pessoas_dia1 = []  #Lista circular com as pessoas 
        l_pessoas_dia2 = []
        l_pessoas_dia3 = []
    
        for i in range(nCasais):
            l_pessoas_dia1.append("H")
            l_pessoas_dia1.append("M")
            l_pessoas_dia2.append("H")
            l_pessoas_dia2.append("M")
            l_pessoas_dia3.append("H")
            l_pessoas_dia3.append("M")
    
        # Simulação
        ta_ok1 = False
        ta_ok2 = False
        ta_ok3 = False
    
        while (ta_ok1 == False or ta_ok1 == False or ta_ok1 == False):
    
            l_num_1 = []   #Numeros a serem sorteados
            l_num_2 = []
            l_num_3 = []
    
            l_teste_dia1 = []   #Numeros sorteados sao colocados aqui para serem testados
            l_teste_dia2 = []
            l_teste_dia3 = []
    
            for i in range(nCasais):  #Colocando as possibilidades de numeros sorteados
                l_num_1.append(i+1)
                l_num_1.append(i+1)
                l_num_2.append(i+1)
                l_num_2.append(i+1)
                l_num_3.append(i+1)
                l_num_3.append(i+1)
        
            for i in range(nCasais*2):   #Sorteando os numeros e passando eles para a lista de verificacao
            
                num = random.choice(l_num_1)
                l_num_1.remove(num)
                l_teste_dia1.append(num)
                
                num = random.choice(l_num_2)
                l_num_2.remove(num)
                l_teste_dia2.append(num)
                
                num = random.choice(l_num_3)
                l_num_3.remove(num)
                l_teste_dia3.append(num)
    
            ta_ok1 = True
            ta_ok2 = True
            ta_ok3 = True
        
            # Checando se as sequencias sao validas
            for i in range(nCasais):
                if (abs(l_teste_dia1[2*(i+1)-1] - l_teste_dia1[2*i]) == 0):
                    # algum casal esta sentado junto
                    ta_ok1 = False
                    
                if (abs(l_teste_dia2[2*(i+1)-1] - l_teste_dia2[2*i]) == 0):
                    # algum casal esta sentado junto
                    ta_ok2 = False
                    
                if (abs(l_teste_dia3[2*(i+1)-1] - l_teste_dia3[2*i]) == 0):
                    # algum casal esta sentado junto
                    ta_ok3 = False
            
            # Checando as extremidades da lista circular
            if (abs(l_teste_dia1[0] - l_teste_dia1[-1]) == 0):
                ta_ok1 = False
                
            if (abs(l_teste_dia2[0] - l_teste_dia2[-1]) == 0):
                ta_ok2 = False
                
            if (abs(l_teste_dia3[0] - l_teste_dia3[-1]) == 0):
                ta_ok3 = False
            
        for i in range(nCasais*2):  #Atualizando a lista circular de pessoas com as condicoes verificadas
            l_pessoas_dia1[i] += str(l_teste_dia1[i])
            l_pessoas_dia2[i] += str(l_teste_dia2[i])
            l_pessoas_dia3[i] += str(l_teste_dia3[i])
            
        if l_pessoas_dia1 == l_pessoas_dia2 and l_pessoas_dia2 != l_pessoas_dia3:  #primeiro evento calculado
            prob1 += 1
        
        if l_pessoas_dia1 != l_pessoas_dia2 and l_pessoas_dia2 != l_pessoas_dia3 and l_pessoas_dia1 != l_pessoas_dia3:  #segundo evento calculado
            prob2 += 1
            
    print(prob1/nSamples)
    print(prob2/nSamples)
    
calcula_prob(3)  #TESTANDO A CHAMADA DA FUNÇÃO COM 3 CASAIS

