clc; clear; close all;

f_str = input('Digite a função para o método de Muller: ','s');
x0 = input('Digite o valor para x0: ');
x1 = input('Digite o valor para x1: ');
x2 = input('Digite o valor para x2: ');
tol = input('Digite o valor para a tolerância em x: ');
max_ite = input('Digite o valor máximo de iterações do código: ');
ite = 0;

f_func = str2func(['@(x)', f_str]);

figure;
hold on;
fplot(f_func,[x0 - 20, x2 + 20], 'r','LineWidth', 1.5);
xlabel('x');
ylabel('f(x)');
title('Método de Muller');
grid on;

while ite < max_ite
    fx0 = f_func(x0);
    fx1 = f_func(x1);
    fx2 = f_func(x2);

    h0 = x1 - x0;
    h1 = x2 - x1;
    d0 = (fx1 - fx0)/h0;
    d1 = (fx2 - fx1)/h1;

    a = (d1 - d0)/(h1 + h0);
    b = d1 + h1 * a;
    c = fx2;

    delta = (b^2 -4*a*c)^0.5;

    if abs(b + delta) > abs(b - delta)
        denominador = b + delta;
    else
        denominador = b - delta;
    end

    x3 = x2 - (2*c / denominador);

    if abs(x3 - x2) < tol
        fprintf('Raiz: %.20f', x3);
        break
    end

    fprintf('x0: %.10f. x1 = %.10f. x2 = %.10f. x3 = %.10f. Iteração = %d.', x0, x1, x2, x3, ite);

    plot(x3 , f_func(x3), 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');

    input('Pressione para continuar...')

    x0 = x1;
    x1 = x2;
    x2 = x3;
    ite = ite + 1;

end
    
    if ite >= max_ite
        fprintf('Máximo de Iterações atingido.\nRaíz achada = %.10f.', x3);
    end
    
hold off