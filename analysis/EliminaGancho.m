
%This function receives as argument the original image in RGB format and the correspondent binary image. 
%It returns both the RGB and binary image without the metal hook
function [imagemBinaria,imagemRGB]=EliminaGancho(imagemBinaria,imagemRGB,tolerancia)

imagemBinariaDosPes=imcrop(imagemBinaria,[0,0,size(imagemBinaria,2),size(imagemBinaria,1)/6]); %It crops legs region

for i=1:size(imagemBinariaDosPes,1)
    %largura=0;
    inicio=0;
    %fim=0;
    indiceInicial=[];
    indiceFinal=[];
   for j=1:size(imagemBinariaDosPes,2)
    
       if imagemBinariaDosPes(i,j)==1 && inicio==0
          
           inicio=1;
           indiceInicial=[indiceInicial j];
           
       elseif imagemBinariaDosPes(i,j)==0 && inicio==1
          
           %fim=1;
           inicio=0;
           indiceFinal=[indiceFinal j];
       end
       
   end
   
   matriz=0;
   for k=1:size(indiceInicial,2)
      
       if (indiceFinal(k)-indiceInicial(k))<tolerancia
           matriz=[indiceInicial(k):indiceFinal(k);ones(1,indiceFinal(k)-indiceInicial(k) + 1)*i]';
           %plot(matriz(:,1),matriz(:,2),'b.')
           imagemBinaria(matriz(:,2),matriz(:,1))=0;
           
           imagemRGB(matriz(:,2),matriz(:,1),1)=0;
           imagemRGB(matriz(:,2),matriz(:,1),2)=0;
           imagemRGB(matriz(:,2),matriz(:,1),3)=0;
           
       end
       matriz=0;
   end
end






