Vetor1 = [9 5 7];

nomr_Vetor1 = norm(Vetor1);
Vetor1_uni = Vetor1 / nomr_Vetor1;
nomr_Vetor1_uni = norm(Vetor1_uni); % é igual a um

figure;
hold on;
    
quiver3(0,0,0, Vetor1(1),Vetor1(2),Vetor1(3),'r','LineWidth',2,'DisplayName','Vetor Original');
quiver3(0,0,0, Vetor1_uni(1),Vetor1_uni(2),Vetor1_uni(3),'b', 'LineWidth',2,'DisplayName','Vetor Unitário');
        
grid on;
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');
legend show;
title('Vetor e sua versão unitária')
view(3);
hold off;

