#Implementação dos métodos de zeros da funcao
#Autor: lazaro jose Pedrosa dos Reis
#2023

#Funcao que estima os zeros de uma funcao atravez do metodo de bissecao
def metodoBissecao(f, a, b, tol):
    print("Intervalo:", a, "-", b)
    print("Tolerancia:", tol)
    print("Resultado: ")
    
    if (f(a)*f(b) >= 0):
        print("Nao existe raiz no intervalo")
        return
    
    while (abs(f(a)-f(b)) > tol):
        if(abs(f(a)) < abs(f(b))):
            b = (a+b)/2
        else: 
            a = (a+b)/2
    #Retorna o menor valor
    return min(a, b)

#Funcao que estima os zeros de uma funcao atravez do metodo de Newton
def metodoNewton(f, df, x0, tol):
    print("Ponto inicial:", x0)
    print("Tolerancia:", tol)
    print("Resultado:")
    
    x = x0
    while abs(f(x)) > tol:
        x = x - f(x)/df(x)
    return x

#Funcao que estima os zeros de uma funcao atravez do metodo de Secante
def metodoSecante(f, x0, x1, tol):
    print("Ponto inicial:", x0)
    print("Ponto final:", x1)
    print("Tolerancia:", tol)
    print("Resultado:")
    
    x = (x0*f(x1)-x1*f(x0))/(f(x1)-f(x0))
    while abs(f(x)) > tol:
        x0 = x1
        x1 = x
        x = (x0*f(x1)-x1*f(x0))/(f(x1)-f(x0))
    
    return x

def main():
    print("___MÉTODO DA BISSEÇÃO___\n")
    print("Funcao: x^3-9x+3")
    print(metodoBissecao(lambda x: x**3-9*x+3, 0, 1, 0.1))
    
    print("\n___MÉTODO DO NEWTON___\n")
    print("Funcao: x^3-9x+3")
    print("Derivada: 3x^2-9")
    print(metodoNewton(lambda x: x**3-9*x+3, lambda x: 3*x**2-9, 0, 0.01))
    
    print("\n___MÉTODO DA SECANTE___\n")
    print("Funcao: x^2+x-6")
    print(metodoSecante(lambda x: x**2+x-6, 1.5, 1.7, 2))
    return 0

main()