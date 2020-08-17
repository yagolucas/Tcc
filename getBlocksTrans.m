function macroBlocos = getBlocksTrans(imagem,crop) 
    copia = imagem;
    copia = imresize(copia,[320 280]);
    [width, height] = size(copia);
    for i = crop:crop:width
        for j = crop:crop:height
            copia(i-crop+1:i, j-crop+1:j) = dct2(copia(i-crop+1:i, j-crop+1:j));
        end
    end
    imshow(copia);
    macroBlocos = copia;
end