function infoDesc=AplicaDescritores(imagemBinaria)

areaDaCarcaca=CalculaArea(imagemBinaria);
perimetro=CalculaPerimetro(imagemBinaria);
solidicidade=CalculaSolidicidade(imagemBinaria);
circularidade=CalculaCircularidade(imagemBinaria);
areaFeixeConv=CalculaAreaFeixeConvexo(imagemBinaria);

% Concatenação de Strings
str1 = ' cm';
str2 = ' cm²';
str3 = 'Perimetro:  ';
str4 = 'Area da Carcaça:  ';
str5 = 'Circularidade:  ';
str6 = 'Solidicidade:  ';
str7 = 'Area do Feixe Convexo:  ';
% 
r_solid = convertToString( solidicidade );
r_circ = convertToString( circularidade );
r_area = convertToString( areaDaCarcaca );
r_per = convertToString( perimetro );
r_areaFconv = convertToString( areaFeixeConv );

rs = strcat( str6, r_solid( 1:6 ));
rc = strcat( str5, r_circ( 1:6 ));
ra = strcat( str4, r_area( 1:6 ), str2 );
rp = strcat( str3, r_per( 1:6 ), str1 );
rf = strcat( str7, r_areaFconv(1:6), str2);

% Criação da caixa de Texto
infoDesc = { rs, rc, ra, rp, rf};

