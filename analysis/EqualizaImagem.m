
%Esta função equaliza a imagem ao tornar os pixes

function imagemRGB=EqualizaImagem(imagemRGB)

%Usa apenas a matriz de vermelho do RGB
y=histogram(imagemRGB(:,:,1),255);

vetorDeValores=y.Values;
clf
%Armazena todos os valores maiores que 2300
k=1;
for i=20:100
    
    if vetorDeValores(i)>2000
       
        valoresMaiores(k)=vetorDeValores(i);
        indicesDosMaiores(k)=i;
        k=k+1;
    end
        
end

%Dentre os valores maiores que 2300, detecta quais destes é o menor 

[menorValor,indice]=min(valoresMaiores);

indiceOriginal=indicesDosMaiores(indice);

faixaDeEqualizacao=[indiceOriginal 180];

for i=1:size(imagemRGB,1)
    for j=1:size(imagemRGB,2)
        
        if imagemRGB(i,j,1) > faixaDeEqualizacao(1) && imagemRGB(i,j,1) < faixaDeEqualizacao(2)
           
            imagemRGB(i,j,1)=255;
            imagemRGB(i,j,2)=255;
            imagemRGB(i,j,3)=255;
        end
        
    end
end


