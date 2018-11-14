
function circularidade=CalculaCircularidade(imagemBinaria)

%Calcula �rea em cent�metro
area=CalculaArea(imagemBinaria);

%Calcula per�metro em cent�metro
perimetro=CalculaPerimetro(imagemBinaria);

%Calcula circularidade
circularidade = 4*pi*(area/perimetro^2);


