% Descripteur H3C : deuxi�me descripteur
function H3C=histoRGB(im)

HR=histo(im(:,:,1),256)
HG=histo(im(:,:,2),256)
HB=histo(im(:,:,3),256)
H3C=[HR HG HB] 
end
