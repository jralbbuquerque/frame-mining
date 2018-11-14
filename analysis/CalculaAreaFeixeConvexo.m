function areaFeixeConvEmCent=CalculaAreaFeixeConvexo(imagemBinaria)

imagemConvexa = regionprops(imagemBinaria, 'ConvexImage');

imagemConvexa = struct2cell(imagemConvexa);

imagemConvexa = cell2mat(imagemConvexa(1,1));

areaFeixeConvEmPixels = regionprops(imagemConvexa, 'ConvexArea');
areaFeixeConvEmPixels = struct2cell(areaFeixeConvEmPixels);
areaFeixeConvEmPixels = cell2mat(areaFeixeConvEmPixels);

%Propor��o cent�metro por Pixel
centPorPixel = 1/25.4;

%Cent�metro quadrado por pixel
centQuadPorPixel = centPorPixel^2;

areaFeixeConvEmCent = centQuadPorPixel * areaFeixeConvEmPixels(1,1);


