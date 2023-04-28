#Implementação Método Iterativo Gauss Seidel
#Autor: lazaro jose Pedrosa dos Reis
#2023
import math

#Funcao que determina se o sistema deve parar de ser resolvido
#x = vetor solucao | anterior = vetor solucao anterior | e = tolerancia
def parada(x,anterior,e):
    for i in range(len(x)):
        if math.fabs(x[i] - anterior[i]) > e:
            return False
    return True

#Funcao principal da resolucao do Gauss Seidel
#A = Matriz | b = vetor independente | e = tolerancia | iteracoes = numero de iteracoes
def gaussSeidel(A,b,e,iteracoes):
    n = len(b)
    x = [0]*n
    k = 0
    for i in range(n):
        x[i] = 0
    anterior = x.copy() #vetor solucao anterior
    
    while k < iteracoes:
        k = k+1
        for i in range(n):
            s = 0
            for j in range(n):
                if i != j:
                    s = s + A[i][j]*x[j]
            x[i] = (b[i] - s)/A[i][i]
        if parada(x,anterior,e):
            break
        anterior = x.copy()
    return x
        
def main():
    A = [[5,1,1],
         [3,4,1],
         [3,3,6]]
    b = [5,6,0]
    e = 0.05
    iteracoes = 1000
    print(gaussSeidel(A,b,e,iteracoes))

main()