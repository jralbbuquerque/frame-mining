function circularidade=CalculaCircularidade(imagemBinaria)

%Calcula área em centímetro
area=CalculaArea(imagemBinaria);

%Calcula perímetro em centímetro
perimetro=CalculaPerimetro(imagemBinaria);

%Calcula circularidade
circularidade = 4*pi*(area/perimetro^2);


