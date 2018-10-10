function [pos1,pos2,pos3,pos4,pos5,pos6,pos7]=posicaoImagens6(imagem1,imagem2,imagem3,imagem4,imagem5,imagem6,imagemTotal)

alturaTotal=size(imagem1,1) + size(imagem2,1) + size(imagem3,1) + size(imagem4,1) + size(imagem5,1) + size(imagem6,1);

taxa=0.7;
delta=(1-taxa)/5;

pos7(1,1)=0.04;
pos7(1,2)=0.1;
pos7(1,3)=0.2;%size(imagemTotal,2)/(2*(size(imagemTotal,2)));
pos7(1,4)=size(imagemTotal,1)/alturaTotal;

pos6(1,1)=0.5;
pos6(1,2)=0.01;
pos6(1,3)=0.5;
pos6(1,4)=taxa*size(imagem6,1)/alturaTotal;

pos5(1,1)=0.5;
pos5(1,2)=pos6(1,2)+pos6(1,4)+delta;
pos5(1,3)=0.5;
pos5(1,4)=taxa*size(imagem5,1)/alturaTotal;

pos4(1,1)=0.5;
pos4(1,2)=pos5(1,2)+pos5(1,4)+delta;
pos4(1,3)=0.5;
pos4(1,4)=taxa*size(imagem4,1)/alturaTotal;

pos3(1,1)=0.5;
pos3(1,2)=pos4(1,2)+pos4(1,4)+delta + 0.02;
pos3(1,3)=0.5;
pos3(1,4)=taxa*size(imagem3,1)/alturaTotal;

pos2(1,1)=0.5;
pos2(1,2)=pos3(1,2)+pos3(1,4)+delta - 0.01;
pos2(1,3)=0.5;
pos2(1,4)=taxa*size(imagem2,1)/alturaTotal;

pos1(1,1)=0.5;
pos1(1,2)=pos2(1,2)+pos2(1,4)+delta - 0.01;
pos1(1,3)=0.5;
pos1(1,4)=taxa*size(imagem1,1)/alturaTotal;

% larguraTotal=size(imagem1,2) + size(imagem2,2) + size(imagem3,2) + size(imagemTotal,2);
% 
% pos1(1,1)=0.01;
% pos1(1,2)=0.7;
% pos1(1,3)=size(imagemTotal,2)/larguraTotal ;
% pos1(1,4)=size(imagemTotal,1)/larguraTotal;
% 
% pos2(1,1)=pos1(1,1)+pos1(1,3);
% pos2(1,2)=0.7;
% pos2(1,3)=size(imagem1,2)/larguraTotal ;
% pos2(1,4)=size(imagem1,1)/larguraTotal;
% 
% pos3(1,1)=pos2(1,1)+pos2(1,3);
% pos3(1,2)=0.7;
% pos3(1,3)=size(imagem2,2)/larguraTotal ;
% pos3(1,4)=size(imagem2,1)/larguraTotal;
% 
% pos4(1,1)=pos3(1,1)+pos3(1,3);
% pos4(1,2)=0.3;
% pos4(1,3)=size(imagem3,2)/larguraTotal ;
% pos4(1,4)=size(imagem3,1)/larguraTotal;
% 
% pos5(1,1)=0.01;
% pos5(1,2)=0.3;
% pos5(1,3)=size(imagem4,2)/larguraTotal ;
% pos5(1,4)=size(imagem4,1)/larguraTotal;
% 
% pos6(1,1)=pos5(1,1)+pos5(1,3);
% pos6(1,2)=0.3;
% pos6(1,3)=size(imagem5,2)/larguraTotal ;
% pos6(1,4)=size(imagem5,1)/larguraTotal;
% 
% pos7(1,1)=pos6(1,1)+pos6(1,3);
% pos7(1,2)=0.3;
% pos7(1,3)=size(imagem6,2)/larguraTotal ;
% pos7(1,4)=size(imagem6,1)/larguraTotal;

