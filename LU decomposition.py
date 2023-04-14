#Implementação de fatoração em LU (sem pivoteamento)
#Autor: lazaro jose Pedrosa dos Reis
#2023

#A = Matriz | n = ordem | B = vetor independente
def fatoracaoLU(A, n, B):
    LU = eliGauss(A, n, B, 1) #Vetor que contem as matrizes L e U
    print ("_____ Matriz L _____")
    for i in LU[1]: print('\t'.join(map(str, i)))
    y = eliGauss(LU[1], n, B, 0)
    x = subsRetroativa(n, LU[0], y[1])
    
    print ("_____ Vetor B ______")
    print (B)
    print ("_____ Matriz U ______")
    for j in LU[0]: print('\t'.join(map(str, j)))
    print ("_____ Vetor Y ______")
    print (y[1])
    print ("_____ RESULTADO ______")
    print (x)
    return x

# n = ordem | U = matriz triangular superior | d = vetor independente
def subsRetroativa(n, U, d):
    x = [0]*n
    for k in range(len(d)):
      x[k] = U[k][k]/d[k]
    i = n-1
    for i in range(n-1, -1, -1):
      soma = 0
      for j in range(i+1, len(d)):
        soma += U[i][j]*x[j]
      x[i] = (d[i]-soma)/U[i][i]
    return x

# A = matriz | n = ordem | b = vetor independente
def eliGauss(A, n, B, sel): #sel = verificador para fazer a matriz LU ou nao \\1 para matriz LU \\0 para matriz de gauss padrao
    if (sel == 1):
        L = [[0.0]*n for i in range(n)]
        L[0][0] = 1
    for k in range(n-1):
        for i in range(k+1, n):
            m = -1*(A[i][k]/A[k][k])
            for j in range(k,n):
                if (sel == 1):
                    if(j>i): L[i][j] = 0
                    if(j<i): L[i][j] = -m
                    if(j==i): L[i][j] = 1
                A[i][j] = A[i][j] + m*A[k][j]
            if (sel == 0): B[i] = B[i] + m*B[k]
    if (sel == 1): return A,L
    else: return A,B

def main():
    A = [[4, 3],
         [8, 5]]
    B = [6, 5]
    n = 2

    print("\n______ FATORACAO EM LU 1 ______\n")
    fatoracaoLU(A, n, B)
    
    C = [[1, -3, 2],
         [-2, 8, -1],
         [4, -6, 5]]
    D = [11, -15, 29]
    m = 3
    
    print("\n______ FATORACAO EM LU 2 ______\n")
    fatoracaoLU(C, m, D)
    
main()