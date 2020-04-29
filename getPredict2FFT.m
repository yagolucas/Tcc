function vetorMov = getPredict2FFT(im1,im2)
    aux1 = ifft2(im1);
    aux2 = ifft2(im2);
    %aux3 = {aux1,aux1,aux1};
    passo = 16;
    count = 0;
    error = 1;
    vetorMov = containers.Map;
    [w,h] = size(aux1);
    for i=1:passo:w-passo
       for j=1:passo:h-passo
           position = checkAllDirections(aux1,aux2,passo,i,j,i,j,8);
           %aux3{1}(i:i+passo,j:j+passo) = aux2(position{1}(1):position{1}(1)+passo,position{1}(2):position{1}(2)+passo);
           %aux3{2}(i:i+passo,j:j+passo) = aux2(position{2}(1):position{2}(1)+passo,position{2}(2):position{2}(2)+passo);
           %aux3{3}(i:i+passo,j:j+passo) = aux2(position{3}(1):position{3}(1)+passo,position{3}(2):position{3}(2)+passo);
           vetorMov(num2str(i) + "" + num2str(j)) = position;
       end
    end
    %novoIm = aux3;
end