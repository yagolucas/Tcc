function novoIm = getPredict(im1,im2)
    aux1 = idct2(im1);
    aux2 = idct2(im2);
    aux3 = aux1;
    passo = 9;
    count = 0;
    error = 1;
    [w,h] = size(aux1);
    for i=1:passo:w-passo
       for j=1:passo:h-passo
           position = checkAllDirections(aux1,aux2,passo,i,j,i,j,8,0.2);
           aux3(i:i+passo,j:j+passo) = aux2(position(1):position(1)+passo,position(2):position(2)+passo);
       end
    end
    novoIm = aux3;
end