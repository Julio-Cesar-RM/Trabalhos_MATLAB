clc; clear; close all;

f_str = input('Digite a função para o método da bisseção: ', 's');
f = str2func(['@(x)', f_str]);

a = input('Digite o valor de A: ');
b = input('Digite o valor de B: ');
tol = input('Digite a tolerância em x: ');
max_ite = input('Digite o número máximo de iterações: ');

if f(a) * f(b) > 0
    error('A função não tem intervalos válidos.')
end

figure;
hold on;
fplot(f, [a-10, b+10], 'b', 'LineWidth', 1.5); % Plota f(x)
xlabel('x');
ylabel('f(x)');
title('Método da Bisseção');
grid on;

for ite = 1:max_ite
    c = (a + b) / 2;

    fprintf('C = %.6f. Iteração = %d\n', c, ite);

    plot(c, f(c), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');

    input('Pressione Enter para continuar...');

    if abs(b - a) < tol
        fprintf('Raiz encontrada: %.20f após %d iterações.\n', c, ite);
        break;
    end

    if f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
end

if ite >= max_ite
    fprintf('Máximo de iterações atingido. Raiz aproximada: %.20f. Número de iterações: %d.\n', c, ite);
end

hold off;