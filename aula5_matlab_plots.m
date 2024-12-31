x = [0 7]
y = [0 13]
plot(x,y)
% neste caso, o primeiro item de cada vetor representa as partes da origem
% em x e y, e o segundo item de cada vetor representa as partes em x e y do
% vetor que queremos mostrar.

c = [1 5]'
plotv(c)
% não entendi muito bem o pq, mas quando se usa o plotv, que já sai o vetor
% direto, sem utilizar pontos 0,0 igual no teste anterior, tem que utilizar
% a transposta do vetor.

a = [0 0 1]
b = [0 0 2]
d = [0 0 3]
plot3(a,b,d)