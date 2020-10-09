function vetorMov = getPredictFinal(im1,im2)
    passo = 64;
    vetorMov = containers.Map;
    [w,h] = size(im1);
    for i=1:passo:w-passo
       for j=1:passo:h-passo
               position = checkAllDirections(im1,im2,passo,i,j,i,j,2);
               vetorMov(num2str(i) + "" + num2str(j)) = position;
       end
    end
end