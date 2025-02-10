clear; clc; close all;
syms x;

num_pontos = input('Bem vindo ao método de interpolação de LaGrange.\n Quantos pontos deseja inserir? Digite: ');
vetor_x = [];
vetor_y = [];

for i = 1: num_pontos
    novo_x = input('Digite a coordenada x: ');
    novo_y = input('Digite a coordenada y: ');

    vetor_x = [vetor_x, novo_x];
    vetor_y = [vetor_y, novo_y];

end

P = 0;

for i = 1: num_pontos
    L = 1;

    for j = 1: num_pontos

        if i ~= j
            L = L * (x - vetor_x(j)) / (vetor_x(i) - vetor_x(j));
        end
    end

    P = P + L * vetor_y(i);
end

P = expand(P);

fprintf('\nPolinômio Gerado: %s\n', char(P));

a = input('Digite o valor inicial do intervalo que deseja mostrar: ');
b = input('Digite o segundo valor do intervalo que deseja mostrar: ');

cor = input(['Digite a cor que deseja.\n' ...
    'r para vermelho\n' ...
    'g para verde\n' ...
    'b para azul\n' ...
    'c para ciano\n' ...
    'm para magenta\n' ...
    'y para amarelo\n' ...
    'k para preto\n' ...
    'w para branco\n' ...
    'Digite: '],'s');

figure;
hold on;
grid on;
xlabel('x');
ylabel('f(x)');
title('Função Criada');
fplot(P, [a, b], cor, 'LineWidth', 1.5);
