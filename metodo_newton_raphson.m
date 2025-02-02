clc; clear; close all;
syms x;

f_str = input('Digite a função para o método de Newtow-Raphson: ', 's');
f_sym = str2sym(f_str);
d_f_sym = diff(f_sym, x);

f_func = matlabFunction(f_sym);
d_f_func = matlabFunction(d_f_sym);

x0 = input('\nDigite um valor para x0: ');
tol = input('\nDigite um valor para a tolerância em x: ');
max_ite = input('\nDigite um valor máximo de iterações: ');
ite = 0;

figure;
hold on;
fplot(f_func,[x0 - 100, x0 + 100], 'r', 'LineWidth', 1.5);
xlabel('x');
ylabel('f(x)');
title('Método de Newton - Raphson');
grid("on");

while ite <= max_ite
    x_novo = x0 - (f_func(x0) / d_f_func(x0));

    if abs(x_novo - x0) < tol
        fprintf('\nRaiz encontrada: %.20f.', x_novo);
        break
    end
    
    plot([x0, x_novo], [f_func(x0), f_func(x_novo)], 'g--', 'LineWidth', 2);

    x0 = x_novo;
    ite = ite + 1;

    fprintf('x0 = %.6f. ite: %d\n', x0, ite);
    input('Pressione para continuar...')

    plot(x_novo, f_func(x_novo), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
    
end 

if ite >= max_ite
    disp('\nMáximo de iterações atingido.');
end

hold off;