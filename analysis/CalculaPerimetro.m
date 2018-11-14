function perimetro=CalculaPerimetro(imagemBinaria)

s = regionprops(imagemBinaria,'Perimeter');

%Transforma struct em c�lula
sx = struct2cell(s);

%Transforma c�lula em escalar
perimetroEmPixels = cell2mat(sx);

%Propor��o cent�metro por Pixel
centPorPixel = 1/25.4;

%Calcula o per�metro
perimetro = (perimetroEmPixels(1,1)*centPorPixel)/2;
