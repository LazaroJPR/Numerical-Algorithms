function f1_val = f1_func(x, expr)
    f1_val = evstr(expr);
endfunction

function resultado = calculaFx(f_expr, x)
    [nRows, nCols] = size(f_expr);
    resultado = zeros(nRows, 1);

    for linha = 1:nRows
        soma = 0;
        for col = 1:nCols-1
            soma = soma + f1_func(x(col), f_expr(linha, col));
        end
        soma = soma + f1_func(x(1), f_expr(linha, col+1));
        resultado(linha) = soma;
    end
endfunction

function matriz_calculada = calculaWx(f_expr, x)
    [nRows, nCols] = size(f_expr);
    matriz_calculada = zeros(nRows, nCols);

    for linha = 1:nRows
        for col = 1:nCols
            matriz_calculada(linha, col) = f1_func(x(col), f_expr(linha, col));
        end
    end
endfunction

function metodoDeNewton(f_expr, df_expr, x0, tol)
    maxIter = 1000;
    iter = 0;
    erro = tol + 1;
    erros = [];

    while erro > tol & iter < maxIter
        fx0 = calculaFx(f_expr, x0);
        printf("\n========================================================================");
        printf("\n                          Iteração %d", iter);
        printf("\n========================================================================");
        printf("\nfx%d:\n", iter);
        disp(fx0);

        wx0 = calculaWx(df_expr, x0);
        printf("\nwx%d:\n", iter);
        disp(wx0);

        x1 = x0 - (wx0 \ fx0);
        
        printf("\nx%d: \n", iter+1);
        disp(x1);

        erro = norm(x1 - x0, %inf);
        erros = [erros, erro];
        printf("\nErro: %f\n", erro);

        x0 = x1;
        iter = iter + 1;
        printf("\nfx%d:\n", iter);
        disp(x0);
    end

    printf("\n========================================================================");
    if iter == maxIter then
        printf("\nAtingido o número máximo de iterações sem convergência.");
    else
        printf("\nConvergência alcançada após %d iterações.", iter);
        printf("\n\nSolução aproximada:\n");
        disp(x1);
    end

    clf;
    plot2d(1:iter, erros, style=2);
    xlabel("Iterações");
    ylabel("Erro");
    title("Convergência do Método de Newton");
    menu_Newton();
endfunction

function metodoDeNewtonInexato(f_expr, df_expr, x0, tol)
    maxIter = 1000;
    iter = 0;
    erro = tol + 1;
    erros = [];

    wx0 = calculaWx(df_expr, x0);
    printf("\nwx%d:\n", iter);
    disp(wx0);

    while erro > tol & iter < maxIter
        fx0 = calculaFx(f_expr, x0);
        printf("\n========================================================================");
        printf("\n                          Iteração %d", iter);
        printf("\n========================================================================");
        printf("\nfx%d:\n", iter);
        disp(fx0);

        s = - wx0 \ fx0;
        
        printf("\S%d: \n", iter);
        disp(s);

        x1 = s + x0;
        erro = norm(x1 - x0, %inf);
        erros = [erros, erro];
        printf("\nErro: %f\n", erro);

        x0 = x1;
        iter = iter + 1;
        printf("\nx%d:\n", iter);
        disp(x0);
    end

    printf("\n========================================================================");
    if iter == maxIter then
        printf("\nAtingido o número máximo de iterações sem convergência.");
    else
        printf("\nConvergência alcançada após %d iterações.", iter);
        printf("\n\nSolução aproximada:\n");
        disp(x1);
    end

    clf;
    plot2d(1:iter, erros, style=2);
    xlabel("Iterações");
    ylabel("Erro");
    title("Convergência do Método de Newton Inexato");
    menu_Newton();
endfunction

sistemaA = ["x^2", "x^2", "x^2", "-1";
            "2*x^2", "x^2", "-4*x", "0";
            "3*x^2", "-4*x", "x^2", "0"];

derivadaA = ["2*x", "2*x", "2*x";
            "4*x", "2*x", "-4";
            "6*x", "-4", "2*x"];

sistemaB = ["x^3", "2*x", "x", "-4";
            "2*x^2", "x^2", "-4*x", "1";
            "3*x^2", "-4*x", "x", "0"];

derivadaB = ["3*x^2", "2", "1";
            "4*x", "2*x", "-4";
            "6*x", "-4", "1"];

sistemaC = ["x^2", "x^2", "x^2", "-1";
            "2*x^2", "x^2", "-4*x", "0";
            "3*x^2", "-4*x", "x", "0"];

derivadaC = ["2*x", "2*x", "2*x";
            "4*x", "2*x", "-4";
            "6*x", "-4", "1"];


function menu_Newton()
    printf("\n\n========================================================================");
    printf("\n        Resolução de Sistemas de Equações pelo Método de Newton");
    printf("\n========================================================================");

    printf("\nEscolha uma das opções:");
    printf("\n[1] Exibir o exemplo 1 do Método de Newton");
    printf("\n[2] Exibir o exemplo 1 do Método de Newton Inexato");
    printf("\n[3] Exibir o exemplo 2 do Método de Newton");
    printf("\n[4] Exibir o exemplo 2 do Método de Newton Inexato");
    printf("\n[5] Exibir o exemplo 3 do Método de Newton");
    printf("\n[6] Exibir o exemplo 3 do Método de Newton Inexato");
    printf("\n[7] Solucionar seu próprio sistema usando o Método de Newton");
    printf("\n[8] Solucionar seu próprio sistema usando o Método de Newton Inexato");
    printf("\n[9] Sair");

    opcao = input("Digite o número da opção escolhida: ");

    select opcao
        case 1
            metodoDeNewton(sistemaA, derivadaA, [0.5; 0.5; 0.5], 0.005);
        case 2
            metodoDeNewtonInexato(sistemaA, derivadaA, [0.5; 0.5; 0.5], 0.005);
        case 3
            metodoDeNewton(sistemaB, derivadaB, [1; 1; 2], 0.0001);
        case 4
            metodoDeNewtonInexato(sistemaB, derivadaB, [1; 1; 2], 0.0001);
        case 5
            metodoDeNewton(sistemaC, derivadaC, [0.5; 0.5; 0.5], 0.0001);
        case 6
            metodoDeNewtonInexato(sistemaC, derivadaC, [0.5; 0.5; 0.5], 0.0001);
        case 7
            criar_sistema_Newton();
        case 8
            criar_sistema_NewtonInexato();
        case 9
            printf("\nSaindo do programa...\n");
            return;
        else
            disp("Opção inválida.");
            menu_Newton();
    end
endfunction

function criar_sistema_Newton()
    f_expr = input("Entre com a matriz de expressões (linha por linha, separadas por ponto e vírgula): ", "string");
    df_expr = input("Entre com a matriz de derivadas (linha por linha, separadas por ponto e vírgula): ", "string");
    x0 = input("Entre com o vetor inicial x0: ");
    tol = input("Entre com a tolerância: ");

    metodoDeNewton(evstr(f_expr), evstr(df_expr), x0, tol);
endfunction

function criar_sistema_NewtonInexato()
    f_expr = input("Entre com a matriz de expressões (linha por linha, separadas por ponto e vírgula): ", "string");
    df_expr = input("Entre com a matriz de derivadas (linha por linha, separadas por ponto e vírgula): ", "string");
    x0 = input("Entre com o vetor inicial x0: ");
    tol = input("Entre com a tolerância: ");

    metodoDeNewtonInexato(evstr(f_expr), evstr(df_expr), x0, tol);
endfunction

menu_Newton();