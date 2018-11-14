function area=CalculaArea(imagemBinaria)

%�rea da imagem bin�ria em Pixels
areaEmPixels = bwarea(imagemBinaria);

%Propor��o cent�metro por Pixel
centPorPixel = 1/25.4;

%Cent�metro quadrado por pixel
centQuadPorPixel = centPorPixel^2;

%�rea em cent�metros quadrados
area = centQuadPorPixel * areaEmPixels;

