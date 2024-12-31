vetor1 = [3 5]
vetor2 = [12 4]

prod_esc_f1 = sum(vetor1.*vetor2)
%se eu não colocasse a função sum, iria apenas conseguir
%a multiplicação do termo 1 com o termo 1, e do termo 2
%com o termo 2 de cada vetor. OBS: isto não é a multiplicação nem vetorial,
%nem escalar

prod_esc_f2 = vetor1(:)' * vetor2(:)
%esta segunda forma é o calculo da multiplicação da transposta do vetor 1
%linearizado com o vetor 2 linearizado.
%linearizar é transformar cada valor de cada linha numa única coluna, como
%segue o exemplo a seguir
vetorx = [1 2 3; 4 5 6; 7 8 9]
vetorx_linearizado = vetorx(:)

prod_esc_f3 = 0
for i=1:length(vetor1)

    prod_esc_f3 = vetor1(i)*vetor2(i) + prod_esc_f3

end
% neste caso, há uma multiplicação dos valores de cada primeira posição,
% conforme a contagem i de posição do vetor. Ou seja, multiplicação da
% posição 1 do vetor 1 com a posição 1 do vetor 2, e isto é somado com as
% demais multiplicações de posições, resultando no produto escalar.

prod_esc_f4 = dot(vetor1, vetor2)
%esta é a função mais fácil, que dá direto o produto esc.

theta = acos((dot(vetor1,vetor2))/(norm(vetor1)*norm(vetor2)))
prod_esc_f5 = norm(vetor1)*norm(vetor2)*theta

