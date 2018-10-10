function perimetro=CalculaPerimetro(imagemBinaria)

s = regionprops(imagemBinaria,'Perimeter');

%Transforma struct em célula
sx = struct2cell(s);

%Transforma célula em escalar
perimetroEmPixels = cell2mat(sx);

%Proporção centímetro por Pixel
centPorPixel = 1/15.3;

%Calcula o perímetro
perimetro = (perimetroEmPixels(1,1)*centPorPixel)/2;
