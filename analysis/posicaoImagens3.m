function [pos1,pos2,pos3,pos4]=posicaoImagens3(imagem1,imagem2,imagem3,imagemTotal)

alturaTotal=size(imagem1,1) + size(imagem2,1) + size(imagem3,1);

taxa=0.7;
delta=(1-taxa)/2;

pos1(1,1)=0.03;
pos1(1,2)=0.25;
pos1(1,3)=0.3;
pos1(1,4)=taxa*size(imagemTotal,1)/alturaTotal;

pos4(1,1)=0.5;
pos4(1,2)=0.01;
pos4(1,3)=0.5699;
pos4(1,4)=taxa*size(imagem3,1)/alturaTotal;

pos3(1,1)=0.5;
pos3(1,2)=pos4(1,2)+pos4(1,4)+delta;
pos3(1,3)=0.5699;
pos3(1,4)=taxa*size(imagem2,1)/alturaTotal;

pos2(1,1)=0.5;
pos2(1,2)=pos3(1,2)+pos3(1,4)+delta;
pos2(1,3)=0.5699;
pos2(1,4)=taxa*size(imagem1,1)/alturaTotal;

% larguraTotal=size(imagem1,2) + size(imagem2,2) + size(imagem3,2) + size(imagemTotal,2);
% 
% pos1(1,1)=0.01;
% pos1(1,2)=0.4;
% pos1(1,3)=size(imagemTotal,2)/larguraTotal ;
% pos1(1,4)=size(imagemTotal,1)/larguraTotal;
% 
% pos2(1,1)=pos1(1,1)+pos1(1,3);
% pos2(1,2)=0.5;
% pos2(1,3)=size(imagem1,2)/larguraTotal ;
% pos2(1,4)=size(imagem1,1)/larguraTotal;
% 
% pos3(1,1)=pos2(1,1)+pos2(1,3);
% pos3(1,2)=0.5;
% pos3(1,3)=size(imagem2,2)/larguraTotal ;
% pos3(1,4)=size(imagem2,1)/larguraTotal;
% 
% pos4(1,1)=pos3(1,1)+pos3(1,3);
% pos4(1,2)=0.5;
% pos4(1,3)=size(imagem3,2)/larguraTotal ;
% pos4(1,4)=size(imagem3,1)/larguraTotal;



