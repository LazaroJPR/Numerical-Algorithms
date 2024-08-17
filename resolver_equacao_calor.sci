function resolver_equacao_calor(h, B, dt, T, f1, condInicial)
    alpha = dt/h^2;
    
    Nx = (B/h + 1)-2;
    Nt = (T/dt + 1);

    x = 0:h:B;
    t = 0:dt:T;
    
    printf("\========================================================================");
    printf("\n                          Dados do problema");
    printf("\n========================================================================");
    printf("\nCondição inicial: U(x,0) = %c", condInicial);
    printf("\nh = %0.2f", h);
    printf("\nΔt =%0.2f", dt);
    printf("\nIntervalo: [0,1]");
    printf("\nTamanho da barra: 1");
    
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
    
    printf("\n======================================================\n");
    printf("                    Vetores de erro");
    printf("\n======================================================\n");
    for i = 1:m
        printf("     ");
        for j = 1:(n-1)
            diferenca = U(i, j) - U(i, j+1);
            printf("   %6.4f ", diferenca);
        end
        printf("\n");
    end
    
    for i = 1:size(U, 1)
        plot(t, U(i, :));
    end
    xlabel('Tempo');
    ylabel('Valores de U');
    title('Soluções da Equação do Calor');

    menu_EDO();
endfunction

function f1_val = f1_func(x, expr)
    f1_val = evstr(expr);
endfunction

function menu_EDO()
    printf("\n\n========================================================================");
    printf("\n            Aproximações da solução de equação de calor");
    printf("\n========================================================================");
    
    printf("\nEscolha uma das opções:");
    printf("\n[1] Exibir o exemplo 1");
    printf("\n[2] Exibir o exemplo 2");
    printf("\n[3] Exibir o exemplo 3");

    opcao = input("Digite o número da opção escolhida: ");

    select opcao
        case 1
            clf();
            resolver_equacao_calor(0.25, 1, 0.25, 1, f1_func, "x * (1 - x)");
        case 2
            clf();
            resolver_equacao_calor(0.25, 1, 0.25, 1, f1_func, "x * (2 - x)");
        case 3
            clf();
            resolver_equacao_calor(0.25, 1, 0.25, 1, f1_func, "x * (x + 2)");
        else
            disp("Opção inválida.");
            menu_EDO();
    end
endfunction

menu_EDO();
