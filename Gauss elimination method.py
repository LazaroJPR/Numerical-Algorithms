#Implementação Método Eliminação de Gauss
#Autor: lazaro jose Pedrosa dos Reis
#2023

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
def eliGauss(A,n,b):
    for k in range(n-1):
        for i in range(k+1, n):
            m = -1*(A[i][k]/A[k][k])
            for j in range(k,n):
                A[i][j] = A[i][j] + m*A[k][j]
            b[i] = b[i] + m*b[k]
    return A,b

def main():
  #Eliminacao de Gauss
  A = [1, -3, 2], [-2, 8, -1], [4, -6, 5]
  B = [11, -15, 29]
  n = 3
  print ("\nEliminacao de Gauss:")
  print ("Matriz inicial:")
  print (A)
  print ("\nVetor independente:")
  print (B)
  print ("\nOrdem:")
  print (n)
  print(eliGauss(A, n, B))
  print ("\nResultado:")
  print(subsRetroativa(n, A, B))
  
  print ("\nSubstituicao retroativa:")
  C = [5, -2, 6, 1], [0, 3, 7, -4], [0, 0, 4, 5], [0, 0, 0, 2]
  D = [1, -2, 28, 8]
  m = 4
  print ("Matriz inicial:")
  print (C)
  print ("\nVetor independente:")
  print (D)
  print ("\nOrdem:")
  print (m)
  print ("\nResultado:")
  print(subsRetroativa(m, C, D))
  
main()