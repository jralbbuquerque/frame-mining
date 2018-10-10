function solidicidade=CalculaSolidicidade(imagemBinaria)

%Mensura a propriedade de solidicidade da imagem
solidicidade = regionprops(imagemBinaria, 'Solidity');

%Transforma de struct para célula
solidicidade = struct2cell(solidicidade);

%Transforma para escalar
solidicidade = cell2mat(solidicidade);

solidicidade=solidicidade(1,1);

