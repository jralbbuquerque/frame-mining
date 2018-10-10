
clear variables
close all
clc

% %%%%% DORSAL %%%%%
% 
% imagemDorsalOriginalRGB=imread( 'N25-19-8-PD.jpg');
% imagemLateralOriginalRGB=imread( 'N25-19-8-PL.jpg');
% imagemDorsalOriginalRGB=imread( 'N25-23-8-PD.jpg');
% imagemLateralOriginalRGB=imread( 'N25-23-8-PL.jpg');
imagemDorsalOriginalRGB=imread( 'N25-10-4-PD.jpg');
imagemLateralOriginalRGB=imread( 'N25-10-4-PL.jpg');


[imagemDorsalBinaria,imagemDorsalRGBSemGancho]=BinarizaAreaDeInteresse(imagemDorsalOriginalRGB,"Dorsal");

%%%% DIVIDE EM 3 PARTES %%%%%
[imagemDorsalSuperior,imagemDorsalInferior,imagemDorsalDoMeio]=SegmentaCarcacaDorsalEm3(imagemDorsalBinaria);

%%%% DIVIDE EM 6 PARTES %%%%%
[imagemDorsal1,imagemDorsal2,imagemDorsal3,imagemDorsal4,imagemDorsal5,imagemDorsal6]= ... 
    SegmentaCarcacaDorsalEm6(imagemDorsalBinaria);
% 
% 
% 
% %%%%%% LATERAL %%%%%%
% 
[imagemLateralBinaria,imagemLateralRGBSemGancho]=BinarizaAreaDeInteresse(imagemLateralOriginalRGB,"Lateral");

%%%% DIVIDE EM 3 PARTES %%%%%
[imagemLateralSuperior,imagemLateralInferior,imagemLateralDoMeio]=SegmentaCarcacaLateralEm3(imagemLateralBinaria);

%%%% DIVIDE EM 6 PARTES %%%%%
[imagemLateral1,imagemLateral2,imagemLateral3,imagemLateral4,imagemLateral5,imagemLateral6]= ... 
    SegmentaCarcacaDorsalEm6(imagemLateralBinaria);
 
 
%%%%%%%% PLOTAGENS %%%%%%%%
 
%%% DORSAL 3 PARTES

figure(1)
clf
title('Carcaça Dorsal Segmentada','fontsize',15)
[pos1,pos2,pos3,pos4]=posicaoImagens3(imagemDorsalSuperior,imagemDorsalDoMeio,imagemDorsalInferior,imagemDorsalBinaria);

subplot('Position',pos1);imshow(imagemDorsalBinaria)
subplot('Position',pos2);imshow(imagemDorsalSuperior)
subplot('Position',pos3);imshow(imagemDorsalDoMeio)
subplot('Position',pos4);imshow(imagemDorsalInferior)

dim1 = [ .08 .07 .1 .1 ];
infoDescritores=AplicaDescritores(imagemDorsalBinaria);
annotation('textbox', dim1, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 12);

dim2 = [ .47 .81 .1 .1 ];
infoDescritores=AplicaDescritores(imagemDorsalSuperior);
annotation('textbox', dim2, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 12);

dim3 = [ .47 .46 .1 .1 ];
infoDescritores=AplicaDescritores(imagemDorsalDoMeio);
annotation('textbox', dim3, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 12);

dim4 = [ .47 .075 .1 .1 ];
infoDescritores=AplicaDescritores(imagemDorsalInferior);
annotation('textbox', dim4, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 12);



%%% DORSAL 6 PARTES

figure(2)
clf
[pos1,pos2,pos3,pos4,pos5,pos6,pos7]=posicaoImagens6(imagemDorsal1,imagemDorsal2,imagemDorsal3, ... 
    imagemDorsal4,imagemDorsal5,imagemDorsal6,imagemDorsalBinaria);

subplot('Position',pos7);imshow(imagemDorsalBinaria);
subplot('Position',pos1);imshow(imagemDorsal1);
subplot('Position',pos2);imshow(imagemDorsal2)
subplot('Position',pos3);imshow(imagemDorsal3)
subplot('Position',pos4);imshow(imagemDorsal4)
subplot('Position',pos5);imshow(imagemDorsal5)
subplot('Position',pos6);imshow(imagemDorsal6)

dim1 = [ .042 .053 .1 .1 ];
infoDescritores=AplicaDescritores(imagemDorsalBinaria);
annotation('textbox', dim1, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 12);

dim2 = [ .45 .83 .1 .1 ];
infoDescritores=AplicaDescritores(imagemDorsal1);
annotation('textbox', dim2, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 10);

dim3 = [ .45 .67 .1 .1 ];
infoDescritores=AplicaDescritores(imagemDorsal2);
annotation('textbox', dim3, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 10);

dim4 = [ .45 .51 .1 .1 ];
infoDescritores=AplicaDescritores(imagemDorsal3);
annotation('textbox', dim4, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 10);

dim5 = [ .45 .35 .1 .1 ];
infoDescritores=AplicaDescritores(imagemDorsal4);
annotation('textbox', dim5, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 10);

dim6 = [ .45 .19 .1 .1 ];
infoDescritores=AplicaDescritores(imagemDorsal5);
annotation('textbox', dim6, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 10);

dim7 = [ .45 0.03 .1 .1 ];
infoDescritores=AplicaDescritores(imagemDorsal6);
annotation('textbox', dim7, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 10);


%%% LATERAL 3 PARTES
figure(3)
clf
%title('Carcaça Dorsal Segmentada','fontsize',15)
[pos1,pos2,pos3,pos4]=posicaoImagens3(imagemLateralSuperior,imagemLateralDoMeio,imagemLateralInferior,imagemLateralBinaria);

subplot('Position',pos1);imshow(imagemLateralBinaria)
subplot('Position',pos2);imshow(imagemLateralSuperior)
subplot('Position',pos3);imshow(imagemLateralDoMeio)
subplot('Position',pos4);imshow(imagemLateralInferior)

dim1 = [ .08 .07 .1 .1 ];
infoDescritores=AplicaDescritores(imagemLateralBinaria);
annotation('textbox', dim1, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 12);

dim2 = [ .47 .77 .1 .1 ];
infoDescritores=AplicaDescritores(imagemLateralSuperior);
annotation('textbox', dim2, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 12);

dim3 = [ .47 .39 .1 .1 ];
infoDescritores=AplicaDescritores(imagemLateralDoMeio);
annotation('textbox', dim3, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 12);

dim4 = [ .47 .045 .1 .1 ];
infoDescritores=AplicaDescritores(imagemLateralInferior);
annotation('textbox', dim4, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 12);


%%% LATERAL 6 PARTES

figure(4)
clf
[pos1,pos2,pos3,pos4,pos5,pos6,pos7]=posicaoImagens6(imagemLateral1,imagemLateral2,imagemLateral3, ... 
    imagemLateral4,imagemLateral5,imagemLateral6,imagemLateralBinaria);

subplot('Position',pos7);imshow(imagemLateralBinaria);
subplot('Position',pos1);imshow(imagemLateral1);
subplot('Position',pos2);imshow(imagemLateral2)
subplot('Position',pos3);imshow(imagemLateral3)
subplot('Position',pos4);imshow(imagemLateral4)
subplot('Position',pos5);imshow(imagemLateral5)
subplot('Position',pos6);imshow(imagemLateral6)

dim1 = [ .044 .06 .1 .1 ];
infoDescritores=AplicaDescritores(imagemLateralBinaria);
annotation('textbox', dim1, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 11);

dim2 = [ .45 .83 .1 .1 ];
infoDescritores=AplicaDescritores(imagemLateral1);
annotation('textbox', dim2, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 10);

dim3 = [ .45 .67 .1 .1 ];
infoDescritores=AplicaDescritores(imagemLateral2);
annotation('textbox', dim3, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 10);

dim4 = [ .45 .51 .1 .1 ];
infoDescritores=AplicaDescritores(imagemLateral3);
annotation('textbox', dim4, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 10);

dim5 = [ .45 .35 .1 .1 ];
infoDescritores=AplicaDescritores(imagemLateral4);
annotation('textbox', dim5, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 10);

dim6 = [ .45 .19 .1 .1 ];
infoDescritores=AplicaDescritores(imagemLateral5);
annotation('textbox', dim6, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 10);

dim7 = [ .45 0.03 .1 .1 ];
infoDescritores=AplicaDescritores(imagemLateral6);
annotation('textbox', dim7, 'String', infoDescritores,'FitBoxToText','on', 'Color', 'k', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'white', 'FontSize', 10);


