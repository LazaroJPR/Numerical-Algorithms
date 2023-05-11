#Implementação do algoritmo dos quadrados minimos para o ajuste de uma função linear
#Autor: lazaro jose Pedrosa dos Reis
#2023

import matplotlib.pyplot as plt

def quadradosMinimos(pontos):
    somatorioX = somatorioY = somatorioXY = somatorioX2 = somatorioY2 = somatorioQualidade = 0
    tam = len(pontos[0])

    plt.plot(pontos[0], pontos[1],'o')
    plt.title("Pontos")
    plt.show()
    
    for i in range(tam):                #Calculo da somatoria de X 
        somatorioX += pontos[0][i] 
    for i in range(tam):                #Calculo da somatoria de Y
        somatorioY += pontos[1][i]
    for i in range(tam):                #Calculo da somatoria de X * Y
        somatorioXY += pontos[0][i] * pontos[1][i]
    for i in range(tam):                #Calculo da somatoria dos quadrados dos pontos de X
        somatorioX2 += pontos[0][i] ** 2
    for i in range(tam):                #Calculo da somatoria dos quadrados dos pontos de Y
        somatorioY2 += pontos[1][i] ** 2
    
    b = (somatorioX*somatorioY - tam * somatorioXY)/(somatorioX**2 - tam * somatorioX2)
    a = (somatorioY - b * somatorioX)/tam
    
    #Calculo da somatoria da qualidade do ajuste
    for i in range(tam):
        somatorioQualidade += (pontos[1][i] - a -(b*pontos[0][i])) ** 2
    
    #Calculo dos pontos da reta
    x = [0, pontos[0][tam-1]+1]
    y = [a, a + b * pontos[0][tam-1]+1]
    
    plt.title("Reta e Pontos")
    plt.plot(pontos[0], pontos[1],'o')
    plt.plot(x,y)
    plt.show()
    
    #Calculo da qualidade do ajuste
    qualidadeDoAjuste = 1 -(somatorioQualidade/(somatorioY2 -((somatorioY**2)/tam)))
    
    print("Deseja avaliar o valor da função (reta) em algum ponto especifico? (S/N)")
    escolha = input()
    
    if(escolha == "S" or escolha == "s"):
        print("Digite o valor de x:")
        respX = float(input())
        print("O valor da funcao (reta) no ponto",  respX, "é:", a + b * respX)
    
    return qualidadeDoAjuste

def main():
    pontos = [[1.2, 2.5, 3.0, 4.1, 6.2, 7.1, 8.8, 9.5], [6.8, 6.1, 9.9, 9.7, 12.1, 17.9, 18.0, 21.5]]
    resultado = quadradosMinimos(pontos)
    print("Qualidade do Ajuste:", resultado)

main()