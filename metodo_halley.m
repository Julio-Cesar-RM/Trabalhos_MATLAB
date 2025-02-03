clc; clear; close all;
syms x;

f_str = input('Digite a função para o método de Halley: ', 's');
f_sym = str2sym(f_str);
primeira_d_f_sym = diff(f_sym);
segunda_d_f_sym = diff(f_sym, 2);
f_func = str2func(['@(x)', f_str]);
primeira_d_f_func = matlabFunction(primeira_d_f_sym);
segunda_d_f_func = matlabFunction(segunda_d_f_sym);

x0 = input('Digite o seu palpite inicial x0: ');
tol = input('Digite a tolerância que deseja: ');
max_ite = input('Digite a quantidade máxima de iterações que deseja: ');

figure;
hold on;
fplot(f_func,[x0 - 20, x0 + 20], 'r','LineWidth', 1.5);
xlabel('x');
ylabel('f(x)');
title('Método de Halley');
grid on;

for ite = 1: max_ite
    fx = f_func(x0);
    fdx = primeira_d_f_func(x0);
    fddx = segunda_d_f_func(x0);

    if abs(fdx) < tol
        disp('Erro, derivada muito pequena.')
        break
    end

    deltax = (2 * fx * fdx) / (2 * fdx^2 - fx * fddx);
    x0 = x0 - deltax;

    plot(x0 , f_func(x0), 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');

    fprintf('ite: %d. x: %.10f\n', ite, x0);
    input('Pressione para continuar...')

    if abs(deltax) < tol
        fprintf('Convergência encontrada: %.20f', x0);
        break
    end
end

if ite >= max_ite
    fprintf('Máximo de iterações atingido: %d. Resultado: %.20f', ite, x0);
end

hold off;