function area=CalculaArea(imagemBinaria)

%Área da imagem binária em Pixels
areaEmPixels = bwarea(imagemBinaria);

%Proporção centímetro por Pixel
centPorPixel = 1/15.3;

%Centímetro quadrado por pixel
centQuadPorPixel = centPorPixel^2;

%Área em centímetros quadrados
area = centQuadPorPixel * areaEmPixels;

