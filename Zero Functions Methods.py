#Implementação dos métodos de zeros da funcao
#Autor: lazaro jose Pedrosa dos Reis
#2023

import sympy

#Funcao que estima os zeros de uma funcao atravez do metodo de bissecao
def metodoBissecao(polinomio, a, b, tol):
    print("_____________________________________________")
    print("Intervalo:", a, "-", b, "Tolerancia:", tol, "Polinomio:", polinomio) 
    print("_____________________________________________")
    
    if (f(polinomio, a)*f(polinomio, b) >= 0):
        print("Nao existe raiz no intervalo")
        return
    
    ite = 0
    while (abs(f(polinomio, a)-f(polinomio, b)) > tol):
        if(abs(f(polinomio, a)) < abs(f(polinomio, b))):
            b = (a+b)/2
        else: 
            a = (a+b)/2
        ite += 1
        print("Passo:", ite, "Epsilon:", tol,"Valor de a:", a, "Valor de b:", b)
        
    print("_____________________________________________")
    print("Numero de iteracoes:", ite, "Epsilon:", tol, "Resultado:")
    return min(a, b)

#Funcao que estima os zeros de uma funcao atravez do metodo de Newton
def metodoNewton(polinomio, df, x0, tol):
    print("_____________________________________________")
    print("Polinomio:", polinomio, "Ponto inicial:", x0, "Tolerancia:", tol)
    print("_____________________________________________")
    
    x = x0
    ite = 0
    while abs(f(polinomio, x)) > tol:
        x = x - f(polinomio, x)/f(df, x)
        ite += 1
        print("Passo:", ite, "Epsilon:", tol, "Valor de X:", x,  "Valor de f(x):", f(polinomio, x))
    
    print("_____________________________________________")
    print("Numero de iteracoes:", ite, "Epsilon:", tol, "Resultado:")
    return x

#Funcao que retorna o valor de f(x)
def f(f, valor):
    x = sympy.symbols('x')
    funcao = f.subs(x, valor)
    return funcao.evalf()

#Funcao que estima os zeros de uma funcao atravez do metodo de Secante
def metodoSecante(polinomio, x0, x1, tol):
    print("_____________________________________________")
    print("Ponto inicial:", x0, "Ponto final:", x1, "Tolerancia:", tol)
    print("_____________________________________________")
    
    ite = 0
    x = (x0*f(polinomio,x1)-x1*f(polinomio,x0))/(f(polinomio,x1)-f(polinomio,x0))
    while abs(f(polinomio,x)) > tol:
        x0 = x1
        x1 = x
        x = (x0*f(polinomio,x1)-x1*f(polinomio,x0))/(f(polinomio,x1)-f(polinomio,x0))
        ite += 1
        print("Passo:", ite, "Epsilon:", tol, "Valor de X:", x,  "Valor de f(x):", f(polinomio, x))
        
    
    print("_____________________________________________")
    print("Numero de iteracoes:", ite, "Epsilon:", tol, "Resultado:")
    return x

def menu(resp):
    print("Digite o grau do polinomio: ")
    grau = int(input())
        
    print("Digite os coeficientes do polinomio: ")
    coeficientes = []
    for i in range(grau+1):
        coeficientes.append(float(input()))
    x = sympy.symbols('x')
    polinomio = 0
    for i in range(grau+1):
        polinomio = polinomio + coeficientes[i]*x**(grau-i)
            
    print("Digite o Epsilon desejado: ")
    tol = float(input())
    
    if(resp == 1):
        print("Digite o intervalo desejado: ")
        a = float(input())
        b = float(input())
        return metodoBissecao(polinomio, a, b, tol)
    if(resp == 2):
        print("Digite o ponto inicial: ")
        a = float(input())
        return metodoNewton(polinomio, sympy.diff(polinomio), a, tol)
    if(resp == 3):
        print("Digite o Epsilon desejado: ")
        tol = float(input())
        print("Digite o valor de X0: ")
        x0 = float(input())
        print("Digite o valor de X1: ")
        x1 = float(input())
        return metodoSecante(polinomio, x0, x1, tol)

def main():
    print("___IMPLEMENTAÇÃO DOS MÉTODOS DE ZEROS DA FUNÇÃO___\n")
    print("[1] Método da Bisseção\n[2] Método do Newton\n[3] Método da Secante\n")
    opcao = int(input("Escolha uma opção: "))
    
    if (opcao == 1):
        print("___MÉTODO DA BISSEÇÃO___\n")
        print(menu(1))
        
    if (opcao == 2):
        print("___MÉTODO DO NEWTON___\n")
        print(menu(2))
        
    if (opcao == 3):
        print("___MÉTODO DA SECANTE___\n")
        print(menu(3))

main()