
%Esta função implementa um algoritmo que segmenta uma imagem de carcaça lateral em três outras

function [imagemSuperior,imagemInferior,imagemDoMeio]=SegmentaCarcacaLateralEm3(imagemLateralBinaria)

%%%%%%% A IMAGEM SERÁ DIVIDIDA EM REGIÕES A SEREM EXPLORADAS
%%%%%%% NA PROCURA POR FAIXAS DE MAIOR E MENOR LARGURA PARA QUE A IMAGEM
%%%%%%% POSSA SER DIVIDIDA EM 3

%Divide a carcaça em 4 partes
regioes=DivideCarcaca(imagemLateralBinaria,6);

%Define terceira região entre as quatro
terceiraRegiao=[regioes(2,2) regioes(3,2)];

%Arredondamento
terceiraRegiao=round(terceiraRegiao);

%Detecta linha menos larga dentro da terceira região definida acima
linha1=DetectaLinhaMenosLarga(imagemLateralBinaria,terceiraRegiao);

%A altura da linha 2 será a média entre as alturas das linhas 2 e 3
linha2(:,2)=round((regioes(4,2) + regioes(5,2))/2);

%A linha 2 é preenchida com suas coordenadas x
k=1;
for i=1:size(imagemLateralBinaria,2)
   
    if imagemLateralBinaria(linha2(1,2),i)==1
       
        linha2(k,1)=i;
        k=k+1;
    end
end

%A linha 2 é preenchida com suas coordenadas y
linha2(:,2)=linha2(1,2);

%As alturas de corte são definidas igualando-as a coordenada y das linhas 1 e 2
alturaLateral1=linha1(1,2);
alturaLateral2=linha2(1,2);

%Efetuam-se os cortes da imagem binária e a função retorna cada uma das partes

% imagemSuperior=imcrop(imagemLateralOriginalSemGancho,[0,0,size(imagemLateralBinaria,2),alturaLateral1]);
% imagemDoMeio=imcrop(imagemLateralOriginalSemGancho,[0,alturaLateral1,size(imagemLateralBinaria,2),alturaLateral2 - alturaLateral1]);
% imagemInferior=imcrop(imagemLateralOriginalSemGancho,[0,alturaLateral2,size(imagemLateralBinaria,2),size(imagemLateralBinaria,1) - alturaLateral2]);

imagemSuperior=imcrop(imagemLateralBinaria,[0,0,size(imagemLateralBinaria,2),alturaLateral1]);
imagemDoMeio=imcrop(imagemLateralBinaria,[0,alturaLateral1,size(imagemLateralBinaria,2),alturaLateral2 - alturaLateral1]);
imagemInferior=imcrop(imagemLateralBinaria,[0,alturaLateral2,size(imagemLateralBinaria,2),size(imagemLateralBinaria,1) - alturaLateral2]);



