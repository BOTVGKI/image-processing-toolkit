%{
La dilatation de l'op�rateur morphologique agit comme un op�rateur maximum 
local. L'�rosion agit comme un op�rateur local minimum. Vous pouvez les
utiliser ensemble pour calculer quelque chose appel� le gradient morphologique

%=========== dilatation  = maximisation celon un stricture donnee ===
%---------------------------------------------------------------------
 La forme de base de la dilatation de l'image en niveaux de gris calcule,
pour chaque pixel d'image, la valeur maximale de ses pixels voisins. 
Le voisinage est d�fini par l'�l�ment structurant. Par exemple, cet �l�ment structurant:
%--------------------- �l�ment structurant: matlab ----------------------------------
%}
se1 = strel([1 1 1]) % un vecteur elt stru on peut chosit n importe quel type de vect ou matrice ou objet struct
se1 = strel([0 1 0;1 1 1;0 1 0]) % encore la crusiforme
%--------------- Fonction maximisant matlab : imdilate--------------------------
d1 = imdilate(m5, se1) % m5 est un matrice 

%====== eronsion  = minimisation de l'image  celon un stricture donnee ===
e1 = imerode(m5, se1)
%----------------------------------------
%{
 ================ Gradiant morphologic = derivee ===============
On a 3 formes dradiant :
 . dilated_image - eroded_image   % point milieu : centree
 . original_image - eroded_image  % decentee avant 
 . dilated_image - original_image % decentr� arrier
%}

% Read in circuit board image, crop it so it's not too big for the blog
% page, and convert it to grayscale:

rgb = imread('board.tif');
I = rgb2gray(rgb(1:256,1:256,:));

se = strel(ones(3,3));
basic_gradient = imdilate(I, se) - imerode(I, se);

subplot(1,2,1), imshow(I), %imcredit('Image courtesy of Alexander V. Panasyuk')

subplot(1,2,2), imshow(basic_gradient, [])

%------------------- gradiant 2 (demi-gradient) ------------------------
% La seconde forme est appel�e demi-gradient par �rosion ou gradien interne

internal_gradient = I - imerode(I, se);

subplot(1,2,2), imshow(internal_gradient, [])

seh = strel([1 1 1]);
sev = strel([1;1;1]);

%---------------------  Gradiant 3 (gradiant directionnel) -----------------------------
horizontal_gradient = imdilate(I,seh) - imerode(I,seh);
vertical_gradient = imdilate(I,sev) - imerode(I,sev);

subplot(1,2,1)
imshow(horizontal_gradient, []), title('Horizontal gradient')

subplot(1,2,2)
imshow(vertical_gradient, []), title('Vertical gradient')