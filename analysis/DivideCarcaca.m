
%Esta função retorna as coordenadas y de pontos que dividem horizontalmente a carcaça em partes iguais 

function pontosDeDivisao=DivideCarcaca(imagemBinaria,numeroDePartes)

%Detecta todos os pontos extremos da carcaça
propsDorsal=regionprops(imagemBinaria,'extrema');

%Concatena os pontos extremos
extremos=cat(1,propsDorsal.Extrema);

%Calcula qual desses pontos extremos é o máximo
[pontoMax(1,2),indice]=min(extremos(:,2));
pontoMax(1,1)=extremos(indice,1);
pontoMax=round(pontoMax);

%Calcula qual desses pontos extremos é o mínimo
[pontoMin(1,2),indice]=max(extremos(:,2));
pontoMin(1,1)=extremos(indice,1);
pontoMin=round(pontoMin);

%Calcula distância entre as extremidades verticais da carcaça
distanciaMaxMin = pontoMin(1,2) - pontoMax(1,2);

%Intervalo de cada região conforme o número de partes a ser dividido
intervalo=distanciaMaxMin/numeroDePartes;

%Inicializa o vetor que guarda a coordenada y dos pontos de divisão
pontosDeDivisao=zeros((numeroDePartes-1),2);

%Preenche o vetor que guarda os pontos de divisões
for i=1:(numeroDePartes-1)
   
   pontosDeDivisao(i,:)=[pontoMax(1,1) pontoMax(1,2)+i*intervalo];
end

%Arredonda os valores dos pontos de divisão para que possam ser usados como índices de matrizes
pontosDeDivisao=round(pontosDeDivisao);

