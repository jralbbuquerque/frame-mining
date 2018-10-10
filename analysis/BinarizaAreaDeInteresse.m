
%Esta função recebe a imagem original em RGB e o tipo da carcaça e retorna
%a imagem binária correspondente a área de interesse da carcaça

function [imagemBinaria,imagemOriginalRGBSemGancho]=BinarizaAreaDeInteresse(imagemOriginalRGB,tipoCarcaca)

%Gira a imagem conforme necessário
if(size(imagemOriginalRGB,1)) < (size(imagemOriginalRGB,2))
    imagemOriginalRGB = imrotate( imagemOriginalRGB, 90 );
end 

% Recorte da imagem na área de interesse
imagemOriginalRGB = imcrop( imagemOriginalRGB, [ 415, 415, 1600, 2800 ] );

% Equaliza a imagem ao tornar branca as tonalidades de vermelho 
imagemEqualizada=EqualizaImagem(imagemOriginalRGB);

%Transformação em escala de cinza
imagemCinza = rgb2gray( imagemEqualizada );

se = strel( 'disk', 30 );

% Reconstrução da imagem
ImagemCorroida = imerode( imagemCinza, se );
imagemReconst = imreconstruct( ImagemCorroida, imagemCinza );
imagemDilatada = imdilate( imagemReconst, se );
imagemDilatadaReconst = imreconstruct( imcomplement( imagemDilatada ), imcomplement( imagemReconst ) );
imagemDilatadaReconst = imcomplement( imagemDilatadaReconst );

imagemBinaria = imbinarize( imagemDilatadaReconst );

%Preenche os buracos da imagem binária
imagemBinaria = imfill(imagemBinaria,'holes');

if tipoCarcaca=="Dorsal"
    
    %Elimina o gancho através do qual a carcaça está pendurada
    [imagemBinaria,imagemOriginalRGBSemGancho] = EliminaGancho(imagemBinaria,imagemOriginalRGB,25);
    
    %Elimina o pescoço da carcaça Dorsal
    imagemBinaria=EliminaPescocoDorsal(imagemBinaria);
elseif tipoCarcaca=="Lateral"
    
    %Elimina o gancho através do qual a carcaça está pendurada
    [imagemBinaria,imagemOriginalRGBSemGancho] = EliminaGancho(imagemBinaria,imagemOriginalRGB,37);
    
    %Elimina o pescoço da carcaça Lateral
    imagemBinaria=EliminaPescocoLateral(imagemBinaria);
    
    imagemBinaria=EliminaCaudaLateral(imagemBinaria);
end

