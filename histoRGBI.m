% Descripteur RGB index�e Troisi�me descripteur
function HRGB=histoRGBI(im,QR,QG,QB)
im_indexe=QNRGB(im,QR,QG,QB);
HRGB=histo(im_indexe,QR*QG*QB)

end
