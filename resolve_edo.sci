function resolver_EDO(h, a, b, y0, yf, f1_expr, f2_expr, f3_expr, f4_expr)
    n = ((b - a) / h)-1;
    x = a:h:b;
    A = zeros(n, n);
    B = zeros(n, 1);

    printf("\========================================================================");
    printf("\n                          Dados do problema");
    printf("\n========================================================================");
    printf("\nFunção: (%c)y(i-1) + (%c)y(i) + (%cy)(i+1) = %c", f1_expr1, f2_expr, f3_expr, f4_expr);
    printf("\nh = %0.2f", h);
    printf("\ny0 = %0.2f", y0);
    printf("\nx ∈ [%d,%d]", a, b);
 
    if isempty(yf) then
        printf("\n========================================================================");
        printf("\n               Resolvendo Problema de Valor Inicial");
        printf("\n========================================================================");
        
        A(1, 1) = f1_func(x(2), f2_expr); 
        
        for i = 2:n+1
            A(i, i-1) = f1_func(x(i+1), f1_expr);
            A(i, i) = f1_func(x(i+1), f2_expr);
            A(i-1, i) = f1_func(x(i+1), f3_expr);
            B(i) = f1_func(x(i+1), f4_expr);
        end

        B(1) = f1_func(x(2), f4_expr) - (f1_func(x, f1_expr) * y0);
               
        printf('\nMatriz de coeficientes A:\n');
        disp(A);
        printf('\nVetor de termos independentes B:\n');
        disp(B);

        y = A \ B;
        
        printf('\nResultado:\n');
        disp(' x        y(x)');
        formatted_output = msprintf('%0.2f      %0.4f', a, y0);
        disp(formatted_output);     
        for i = 1:n+1
            formatted_output = msprintf('%0.2f      %0.4f', x(i+1), y(i));
            disp(formatted_output);
        end

        y = [y0; y];

    else
        printf("\n__________Resolvendo Problema de Valor de Contorno__________\n");
        
         A(1, 1) = f1_func(x(2), f2_expr); 
         B(n) = f1_func(x(n+1), f4_expr) - (f1_func(x, f3_expr) * yf);
        
        for i = 2:n
            A(i, i-1) = f1_func(x(i+1), f1_expr);
            A(i, i) = f1_func(x(i+1), f2_expr);
            A(i-1, i) = f1_func(x(i+1), f3_expr);
            B(i-1) = f1_func(x(i), f4_expr);
        end
               
        printf('\nMatriz de coeficientes A:\n');
        disp(A);
        printf('\nVetor de termos independentes B:\n');
        disp(B);

        y = A \ B;
        
        printf('\nResultado:\n');
        disp(' x        y(x)');
        formatted_output = msprintf('%0.2f      %0.4f', a, y0);
        disp(formatted_output);
        for i = 1:n
            formatted_output = msprintf('%0.2f      %0.4f', x(i+1), y(i));
            disp(formatted_output);
        end
        formatted_output = msprintf('%0.2f      %0.4f', x(i+2), yf);
        disp(formatted_output);

        y = [y0; y; yf];
    end

    plot(x, y);
    xlabel('x');
    ylabel('y(x)');
    title('Soluções das EDOs');

    menu_EDO();
endfunction

function f1_val = f1_func(x, expr)
    f1_val = evstr(expr);
endfunction

// Exemplo 1: PVI
h1 = 0.5;
a1 = 0;
b1 = 3;
y01 = 2;
yf1 = [];
f1_expr1 = "-1"
f2_expr1 = "1.5"
f3_expr1 = "0"
f4_expr1 = "0.5*x"

// Exemplo 2: PVC
h2 = 0.2;
a2 = 0;
b2 = 1;
y02 = 0;
yf2 = 2.7183;
f1_expr2 = "2.2"
f2_expr2 = "0.08 * x - 4"
f3_expr2 = "1.8"
f4_expr2 = "0.08 * exp(x) * (x^2 + 1)"

// Exemplo 3: PVI
h3 = 0.25;
a3 = 0;
b3 = 1;
y03 = 0;
yf3 = 0;
f1_expr3 = "1"
f2_expr3 = "-1.9375"
f3_expr3 = "1"
f4_expr3 = "0.0625 * x"

function menu_EDO()
    printf("\n\n========================================================================");
    printf("\nResolução de EDO pelo método das diferenças finitas para PVI e PVC");
    printf("\n========================================================================");
    
    printf("\nEscolha uma das opções:");
    printf("\n[1] Exibir o exemplo 1");
    printf("\n[2] Exibir o exemplo 2");
    printf("\n[3] Exibir o exemplo 3");
    printf("\n[4] Solucionar sua EDO");

    opcao = input("Digite o número da opção escolhida: ");

    select opcao
        case 1
            resolver_EDO(h1, a1, b1, y01, yf1, f1_expr1, f2_expr1, f3_expr1, f4_expr1);
        case 2
            resolver_EDO(h2, a2, b2, y02, yf2, f1_expr2, f2_expr2, f3_expr2, f4_expr2);
        case 3
            resolver_EDO(h3, a3, b3, y03, yf3, f1_expr3, f2_expr3, f3_expr3, f4_expr3);
        case 4
            criar_EDO();
        else
            disp("Opção inválida.");
            menu_EDO();
    end
endfunction

function criar_EDO()
    h = input("Entre com o valor de h (passo): ");
    a = input("Entre com o valor de a (limite inferior): ");
    b = input("Entre com o valor de b (limite superior): ");
    y0 = input("Entre com o valor de y(0): ");
    
    has_yf = input("Existe um valor para y(f)? (1 = Sim, 0 = Não): ");
    if has_yf == 1 then
        yf = input("Entre com o valor de y(f): ");
    else
        yf = [];
    end
    
    f1_expr = input("Entre com a expressão para y(i-1): ", "string");
    f2_expr = input("Entre com a expressão para y(i): ", "string");
    f3_expr = input("Entre com a expressão para y(i+1): ", "string");
    f4_expr = input("Entre com a expressão que não contém o y: ", "string");

    resolver_EDO(h, a, b, y0, yf, f1_expr, f2_expr, f3_expr, f4_expr);

endfunction

menu_EDO();
