fprintf('Bem vindo ao problema de Monty Hall! ');
num_sim = input('Quantas simulações quer que eu faça para você? Digite: ');

vitoria_trocando = 0;
vitoria_mantendo = 0;

for i=1:num_sim
    portas = [1 2 3];
    premio = randi(3); %porta com o prêmio
    escolha1 = randi(3); %escolha inicial
    
    %determinar porta que será revelada
    if escolha1 == premio
        porta_revelada = randsample(setdiff(portas,premio),1);
    else
        porta_revelada = setdiff(portas,[escolha1, premio]);
    end
    
    %determinar portas restantes
    portas_restantes = setdiff(portas, porta_revelada);

    %(considerando sempre trocar)
    escolha_final = portas_restantes(portas_restantes ~= escolha1);
    
    if escolha1 == premio
        vitoria_mantendo = vitoria_mantendo + 1;
    end

    if escolha_final == premio
        vitoria_trocando = vitoria_trocando + 1;
    end
end

%exibir resultados
fprintf('\nResultados das Simulações:\n');
fprintf('Vencendo ao trocar: %.2f%%. De %d tentativas, houve %d vitórias\n', ...
    ((vitoria_trocando / num_sim) * 100), num_sim, vitoria_trocando);
fprintf('Vencendo ao manter: %.2f%%. De %d tentativas, houve %d vitórias\n', ...
    ((vitoria_mantendo / num_sim) * 100), num_sim, vitoria_mantendo);
