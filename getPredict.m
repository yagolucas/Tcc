function novoIm = getPredict(im1,im2)
    aux1 = idct2(im1);
    aux2 = idct2(im2);
    passo = 9;
    count = 0;
    [w,h] = size(aux1);
    
    
    
    novoIm = aux1;
end