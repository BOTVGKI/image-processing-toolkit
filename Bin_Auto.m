
clear all
close all
[image, chemin] = uigetfile('*.pgm','Choisir l''image noir en blanc � binariser :');
if ~image
   error('Aucun fichier n''a �t� d�sign� !')
end

I = imread(image);

BW = im2bw(I);

figure
%imshowpair(I,BW,'montage')

imshow(BW)