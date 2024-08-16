function resolver_EDO(h, a, b, y0, yf, f1, f2, f3, f4, f1_expr, f2_expr, f3_expr, f4_expr)
    n = ((b - a) / h)-1;
    x = a:h:b;
    A = zeros(n, n);
    B = zeros(n, 1);

    printf("\n__________Dados do problema__________\n");
    printf("\nFunção: (%c)y(i-1) + (%cy)(i) + (%cy)(i+1) = %c", f1_expr1, f2_expr, f3_expr, f4_expr);
    printf("\nh = %0.2f", h);
    printf("\ny0 =%0.2f", y0);
    printf("\nx ∈ [%d,%d]", a, b);
 
    if isempty(yf) then
        printf("\n__________Resolvendo Problema de Valor Inicial__________\n");
        
        A(1, 1) = f2_func(x(2), f2_expr); 
        
        for i = 2:n+1
            A(i, i-1) = f1_func(x(i+1), f1_expr);
            A(i, i) = f2_func(x(i+1), f2_expr);
            A(i-1, i) = f3_func(x(i), f3_expr);
            B(i) = f4_func(x(i+1), f4_expr);
        end

        B(1) = f4_func(x(2), f4_expr) - (f1_func(x, f1_expr) * y0);
               
        printf('\nMatriz de coeficientes A:\n');
        disp(A);
        printf('\nVetor de termos independentes B:\n');
        disp(B);

        y = A \ B;
        
        printf('\nResultado:\n');
        disp(' x        y(x)');
        formatted_output = msprintf('%0.1f      %0.4f', a, y0);
        disp(formatted_output);     
        for i = 1:n+1
            formatted_output = msprintf('%0.1f      %0.4f', x(i+1), y(i));
            disp(formatted_output);
        end

        y = [y0; y];

    else
        printf("\n__________Resolvendo Problema de Valor de Contorno__________\n");
        
         A(1, 1) = f2_func(x(2), f2_expr); 
         B(n) = f4_func(x(n+1), f4_expr) - (f3_func(x, f3_expr) * yf);
        
        for i = 2:n
            A(i, i-1) = f1_func(x(i+1), f1_expr);
            A(i, i) = f2_func(x(i+1), f2_expr);
            A(i-1, i) = f3_func(x(i), f3_expr);
            B(i-1) = f4_func(x(i), f4_expr);
        end
               
        printf('\nMatriz de coeficientes A:\n');
        disp(A);
        printf('\nVetor de termos independentes B:\n');
        disp(B);

        y = A \ B;
        
        printf('\nResultado:\n');
        disp(' x        y(x)');
        formatted_output = msprintf('%0.1f      %0.4f', a, y0);
        disp(formatted_output);
        for i = 1:n
            formatted_output = msprintf('%0.1f      %0.4f', x(i+1), y(i));
            disp(formatted_output);
        end
        formatted_output = msprintf('%0.1f      %0.4f', x(i+2), yf);
        disp(formatted_output);

        y = [y0; y; yf];
    end

    plot(x, y);
    xlabel('x');
    ylabel('y(x)');
    title('Soluções das EDOs');
endfunction

function f1_val = f1_func(x, expr)
    execstr("f1_val = " + expr + ";");
endfunction

function f2_val = f2_func(x, expr)
    execstr("f2_val = " + expr + ";");
endfunction

function f3_val = f3_func(x, expr)
    execstr("f3_val = " + expr + ";");
endfunction

function f4_val = f4_func(x, expr)
    execstr("f4_val = " + expr + ";");
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

resolver_EDO(h1, a1, b1, y01, yf1, f1_func, f2_func, f3_func, f4_func, f1_expr1, f2_expr1, f3_expr1, f4_expr1);

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

resolver_EDO(h2, a2, b2, y02, yf2, f1_func, f2_func, f3_func, f4_func, f1_expr2, f2_expr2, f3_expr2, f4_expr2);
