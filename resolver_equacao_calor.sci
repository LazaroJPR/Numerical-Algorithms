function resolver_equacao_calor(h, B, dt, T, f1, condInicial)
    alpha = dt/h^2;
    
    Nx = (B/h + 1)-2;
    Nt = (T/dt + 1);

    x = 0:h:B;
    t = 0:dt:T;
    
    L = zeros(Nx, Nx);
    U0 = zeros(Nx, 1);
    U = zeros(Nx, Nt);

    L(1, 1) = 1 + (2 * alpha);
    L(1, 2) = -alpha;
    U0(1) = f1_func(x(2), condInicial);
    U0(Nx) = f1_func(x(Nx+1), condInicial);
    L(Nx, Nx-1) = -alpha;
    L(Nx, Nx) = 1 + (2 * alpha);
    
    for i = 2:Nx-1
        L(i, i) = 1 + (2 * alpha);
        L(i, i+1) = -alpha;
        L(i, i-1) = -alpha;
        U0(i) = f1_func(x(i+1), condInicial);
    end
    
    U(:, 1) = U0;

    for j = 2:Nt
        U(:, j) = L \ U(:, j-1);
    end
    
    printf("\n======================================================\n");
    printf("                        Tempo\n");
    for i = 1:length(t)
        mprintf("  %6.2f  ", t(i));
    end
    printf("\n======================================================\n");
    
    [m, n] = size(U);
    for i = 1:m
        for j = 1:n
            printf("   %6.4f ", U(i, j));
        end
        printf("\n");
    end
endfunction

function f1_val = f1_func(x, expr)
    f1_val = evstr(expr);
endfunction

resolver_equacao_calor(0.25, 1, 0.25, 1, f1_func, "x * (1 - x)");
