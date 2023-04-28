#Implementação Método Iterativo Gauss Jacobi
#Autor: lazaro jose Pedrosa dos Reis
#2023

#Função que calcula o resultado de uma iteração do método de Gauss-Jacobi
#A = matriz de coeficientes| b  = vetor de termos independentes| x = vetor de termos iniciais| iteracoes = nÃmero de iteraçÕes| e = tolerância
def gaussJacobi(A,b,x,iteracoes,e):
    for i in range(iteracoes):
        for j in range(len(A)):
            soma = 0
            for k in range(len(A)):
                if k != j:
                    soma += A[j][k] * x[k]
            x[j] = (b[j] - soma) / A[j][j]
        if e > abs(x[0] - x[1]) and e > abs(x[1] - x[2]): #Teste de parada
            return x
    return x
        
def main():
    A = [[10, 2, 1], 
         [1, 5, 1], 
         [2, 3, 10]]
    b = [7, -8, 6]
    x = [0.7, -1.6, 0.6]
    e = 0.05
    iteracoes = 10
    print("____ALGORITMO DE GAUSS JACOBI_____\n")
    print("Matriz A: ")
    for k in A: print('\t'.join(map(str, k)))
    print("\nVetor b: ")
    print(b)
    print("\nVetor x inicial: ")
    print(x)
    print("\nValor de tolerância: ")
    print(e)
    print("\nNúmero de iterações: ")
    print(iteracoes)
    print("\nResultado: ")
    res = gaussJacobi(A,b,x,iteracoes,e)
    print(res)
    print("\nResultado com arredondamento: ")
    print(round(res[0],2),round(res[1],2),round(res[2],2))
    print("\n____________________________________")

main()