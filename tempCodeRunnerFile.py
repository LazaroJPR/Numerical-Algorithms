def gaussSeidel(A,b,x,n):
    for i in range(n):
        for j in range(n):
            if(i!=j):
                x[i] = x[i] - (A[i][j]*x[j])/A[i][i]
        x[i] = (x[i] + (b[i]/A[i][i]))
    return x