function imagemBinaria=EliminaCaudaLateral(imagemBinaria)

imagemBinaria = imrotate( imagemBinaria, 90 );

larguraExploracao=round((1/2)*size(imagemBinaria,2));
alturaExploracao=round(size(imagemBinaria,1)/3);

for i=1:alturaExploracao
    %largura=0;
    inicio=0;
    %fim=0;
    indiceInicial=[];
    indiceFinal=[];
   for j=1:larguraExploracao
    
       if imagemBinaria(i,j)==1 && inicio==0
          
           inicio=1;
           indiceInicial=[indiceInicial j];
           
       elseif ((imagemBinaria(i,j)==0 && inicio==1) || (imagemBinaria(i,j)==1 && j==larguraExploracao)) 
          
           %fim=1;
           inicio=0;
           indiceFinal=[indiceFinal j];
       end
       
   end
   
   matriz=0;
   for k=1:size(indiceFinal,2)
      
       if (indiceFinal(k)-indiceInicial(k))<300
           matriz=[indiceInicial(k):indiceFinal(k);ones(1,indiceFinal(k)-indiceInicial(k) + 1)*i]';
           %plot(matriz(:,1),matriz(:,2),'b.')
           imagemBinaria(matriz(:,2),matriz(:,1))=0;
           
%            Image_RGB(matriz(:,2),matriz(:,1),1)=0;
%            Image_RGB(matriz(:,2),matriz(:,1),2)=0;
%            Image_RGB(matriz(:,2),matriz(:,1),3)=0;
           
       end
       matriz=0;
   end
end

imagemBinaria = imrotate( imagemBinaria, 270 );

