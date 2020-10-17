function macroBlocos = getBlocksTransTeste(imagem,crop,func,compressao) 
    copia = imagem;
    [width, height] = size(copia);
    for i = 1:crop:width
        for j = 1:crop:height
            if (i+crop > width) && (j+crop > height)
              copia(i:end, j:end) = func(copia(i:end, j:end));  
              if compressao
                    copia(i:end, j:end) = linearizacao(copia(i:end, j:end));
              end
            elseif (i+crop > width) && (j+crop <= height)
              copia(i:end, j:crop+j-1) = func(copia(i:end, j:crop+j-1));
              if compressao
                    copia(i:end, j:crop+j-1) = linearizacao(copia(i:end, j:crop+j-1));
                end
            elseif (i+crop <= width) && (j+crop > height)
              copia(i:crop+i-1, j:end) = func(copia(i:crop+i-1, j:end));
              if compressao
                    copia(i:crop+i-1, j:end) = linearizacao(copia(i:crop+i-1, j:end));
                end
            else
                if compressao == false
                    copia(i:crop+i-1, j:crop+j-1) = quantizacao(copia(i:crop+i-1, j:crop+j-1),compressao);
                    copia(i:crop+i-1, j:crop+j-1) = func(copia(i:crop+i-1, j:crop+j-1));
                else
                    copia(i:crop+i-1, j:crop+j-1) = func(copia(i:crop+i-1, j:crop+j-1));
                    copia(i:crop+i-1, j:crop+j-1) = quantizacao(copia(i:crop+i-1, j:crop+j-1),compressao);
                end                       
            end
        end
    end
    macroBlocos = copia;
end