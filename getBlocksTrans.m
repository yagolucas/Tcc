function macroBlocos = getBlocksTrans(imagem,crop,func) 
    copia = imagem;
    %copia = imresize(copia,[320 280]);
    [width, height] = size(copia);
    for i = 1:crop:width
        for j = 1:crop:height
            if (i+crop > width) && (j+crop > height)
              copia(i:end, j:end) = func(copia(i:end, j:end));
            elseif (i+crop > width) && (j+crop <= height)
              copia(i:end, j:crop+j-1) = func(copia(i:end, j:crop+j-1));
            elseif (i+crop <= width) && (j+crop > height)
              copia(i:crop+i-1, j:end) = func(copia(i:crop+i-1, j:end));
            else
                copia(i:crop+i-1, j:crop+j-1) = func(copia(i:crop+i-1, j:crop+j-1));
            end
        end
    end
    macroBlocos = copia;
end