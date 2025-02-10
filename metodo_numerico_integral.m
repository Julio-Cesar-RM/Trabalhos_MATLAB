
funcao_str = input('Digite a função que deseja calcular a integral: ','s');
a = input('Digite o primeiro limite da integral: ');
b = input('Digite o segundo limite da integral: ');
tol = input('Digite a tolerância desejada: ');
funcao_func = str2func(['@(x)', funcao_str]);

n = 1;
erro = inf;
i_anterior = 0;

x = linspace(a, b, 500);
y = funcao_func(x);

figure;
plot(x, y, 'b', 'LineWidth', 2); 
hold on;
xlabel('x');
ylabel('f(x)');
title('Cálculo da Integral por Método dos Retângulos');
axis([a b min(y) max(y)]); 
grid on;

while erro > tol
    delta_x = (b - a)/n;
    soma = 0;

    for i = 0: n-1
        xi = a + (i + 0.5) * delta_x;
        soma = soma + funcao_func(xi);

     fill([xi - delta_x/2, xi + delta_x/2, xi + delta_x/2, xi - delta_x/2], ...
            [0, 0, funcao_func(xi), funcao_func(xi)], 'r', 'FaceAlpha', 0.3);

    end

    i_atual = soma * delta_x;

    if i_atual ~= 0
        erro = abs(i_atual - i_anterior) / abs(i_atual);
    else
        erro = abs(i_atual - i_anterior);
    end

    fprintf('Valor da integral: %.10f. Subdivisões: %d.\n', i_atual, n);
    input('...')

    i_anterior = i_atual;
    n = n * 2;
    
end

fprintf('Valor da integral: %.15f.\n', i_atual);
fprintf('Número de subdivisões realizadas: %d.\n', n);


