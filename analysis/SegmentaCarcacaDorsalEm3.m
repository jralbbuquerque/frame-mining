
%Esta função implementa um algoritmo que segmenta uma imagem de carcaça dorsal em três outras

function [imagemSuperior,imagemInferior,imagemDoMeio]=SegmentaCarcacaDorsalEm3(imagemDorsalBinaria)

%%%%%%% A IMAGEM SERÁ DIVIDIDA EM REGIÕES A SEREM EXPLORADAS
%%%%%%% NA PROCURA POR FAIXAS DE MAIOR E MENOR LARGURA PARA QUE A IMAGEM
%%%%%%% POSSA SER DIVIDIDA EM 3

%%% DIVISÃO EM 3 PARTES, DETECTA DUAS LINHAS HORIZONTAIS %%%

%Divide a carcaça em 4 partes
regioes=DivideCarcaca(imagemDorsalBinaria,4);

%Define a 2ª região (contando de cima pra baixo)
segundaRegiao=[regioes(1,2) regioes(2,2)];

%Arredonda
segundaRegiao=round(segundaRegiao);

%Explora a segunda região a procura do ponto mais largo
linhaMaisLarga1=DetectaLinhaMaisLarga(imagemDorsalBinaria,segundaRegiao);

%Define a 3ª região (contando de cima pra baixo)
terceiraRegiao=[regioes(2,2) regioes(3,2)];

%Arredonda
terceiraRegiao=round(terceiraRegiao);

%Explora a segunda região a procura do ponto mais largo
linhaMaisLarga2=DetectaLinhaMaisLarga(imagemDorsalBinaria,terceiraRegiao);

%As alturas de corte são definidas igualando-as a coordenada y das linhas mais largas 1 e 2
alturaDorsal1=linhaMaisLarga1(1,2);
alturaDorsal2=linhaMaisLarga2(1,2);

%Efetuam-se os cortes da imagem binária e a função retorna cada uma das partes
imagemSuperior=imcrop(imagemDorsalBinaria,[0,0,size(imagemDorsalBinaria,2),alturaDorsal1]);
imagemDoMeio=imcrop(imagemDorsalBinaria,[0,alturaDorsal1,size(imagemDorsalBinaria,2),alturaDorsal2 - alturaDorsal1]);
imagemInferior=imcrop(imagemDorsalBinaria,[0,alturaDorsal2,size(imagemDorsalBinaria,2),size(imagemDorsalBinaria,1) - alturaDorsal2]);


