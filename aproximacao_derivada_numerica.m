
funcao_str = input('Digite a função para realizar sua derivada aproximada: ','s');
funcao_func = str2func(['@(x)', funcao_str]);
x0 = input('Digite o valor em x desejado: ');
tol = input('Digite um valor de tolerância h: ');


dif_frente = (funcao_func(x0+tol) - funcao_func(x0))/tol;
dif_tras = (funcao_func(x0) - funcao_func(x0+tol))/tol;
dif_central = (funcao_func(x0+tol) - funcao_func(x0-tol))/(tol*2);
funcao_secante = @(x) dif_central*(x - x0) + funcao_func(x0);

fprintf('\nDiferença para frente: %.5f.\n', dif_frente);
fprintf('Diferença para trás: %.5f\n', dif_tras);
fprintf('Diferença central: %.5f\n', dif_central);

figure;
hold on;
fplot(funcao_func, [x0-20 , x0+20], 'r', 'LineWidth', 1.5);
fplot(funcao_secante, [x0-20, x0+20], 'g', 'LineWidth', 1.5);
plot(x0, funcao_func(x0), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
xlabel('x');
ylabel('y');
title('Aproximação Derivada Numérica');
grid('on');
hold off;
