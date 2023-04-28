#Implementação Método Iterativo Gauss Seidel
#Autor: lazaro jose Pedrosa dos Reis
#2023

#Funcao que calcula o resultado do metodo de Gauss Seidel
#A = matriz | b = vetor de termos independentes | e = valor de tolerancia | iteracoes = numero de iteracoes
def gaussSeidel(A,b,e,iteracoes):
    n = len(b)
    x = [0]*n
    xa = x.copy()   #Vetor anterior ao vetor x, serve para armazenar os valores de x antes de serem atualizados
                    #para que os valores possam ser recuperados para executar o metodo de Gauss Seidel
    for i in range(iteracoes):
        for j in range(len(A)):
            soma = 0
            for k in range(len(A)):
                if j > k:
                    soma = soma + A[j][k] * xa[k]
                elif j < k:
                    soma = soma + A[j][k] * x[k]
            xa[j] = (b[j] - soma) / A[j][j]
        if e > abs(xa[0] - x[0]) and e > abs(xa[1] - x[1]) and e > abs(xa[2] - x[2]): #Teste de parada
            x = xa.copy()
            return x
        x = xa.copy()
    return x
        
def main():
    A = [[5,1,1],
         [3,4,1],
         [3,3,6]]
    b = [5,6,0]
    e = 0.05
    iteracoes = 1000
    print("____ALGORITMO DE GAUSS SEIDEL_____\n")
    print("Matriz A: ")
    for k in A: print('\t'.join(map(str, k)))
    print("\nVetor b: ")
    print(b)
    print("\nValor de tolerância: ")
    print(e)
    print("\nNúmero de iterações: ")
    print(iteracoes)
    print("\nResultado: ")
    res = gaussSeidel(A,b,e,iteracoes)
    print(res)
    print("\nResultado com arredondamento: ")
    print(round(res[0],2),round(res[1],2),round(res[2],2))
    print("\n____________________________________")

main()