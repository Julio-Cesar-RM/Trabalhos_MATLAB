Matriz1 = [3 4 7;12 65 12; 45 1 32] %criando matriz quadrada
Matriz2 = Matriz1' %definindo transposta de matriz quadrada

Matriz3 = (Matriz1 + Matriz2)/2 %achando uma matriz simétrica somando uma matriz quadrada com a sua transposta

Matriz4 = Matriz3 - Matriz3' %comprovando que a matriz achada é simétrica, pois ela menos a sua transposta
% dá uma matriz apenas de zeros.

%----------------------
MatrizA = [12 2 4; 5 67 1]
MatrizB = MatrizA'*MatrizA
MatrizC = MatrizB - MatrizB'
MatreizD = MatrizB == MatrizB'
