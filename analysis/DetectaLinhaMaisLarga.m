function linhaMaisLarga=DetectaLinhaMaisLarga(imagemBinaria,regiao)

maisLargo=0;
for i=regiao(1,1):regiao(1,2)
   
    largura=0;
    vetorLargura=zeros(1,2);
    k=1;
    for j=1:size(imagemBinaria,2)
      
       if imagemBinaria(i,j)==1
          
           largura=largura+1;
           vetorLargura(k,:)=[j i];
           k=k+1;
       end
   end
   
   if largura>maisLargo
      
       maisLargo=largura;
       %altura_mais_larga=i;
       linhaMaisLarga=vetorLargura;
   end
    
end

