function movie = getMovies2(frames,vector,passo)
    [un1, qtdFrames] = size(frames);
    movie = {};
    movie{1} = frames{1};
    for index = 1:qtdFrames - 1
        framesGerados = {frames{index},frames{index},frames{index},frames{index}};
        imageI = idct2(frames{index});
        imageP = idct2(frames{index+1});
        vectorMoviment = vector{index};
        [width,height] = size(imageI);
        for i=1:passo:width-passo
            for j=1:passo:height-passo
                position = vectorMoviment(num2str(i) + "" + num2str(j));
                framesGerados{1}(i:i+passo,j:j+passo) = imageP(position{1}(1):position{1}(1)+passo,position{1}(2):position{1}(2)+passo);
                framesGerados{2}(i:i+passo,j:j+passo) = imageP(position{2}(1):position{2}(1)+passo,position{2}(2):position{2}(2)+passo);
                framesGerados{3}(i:i+passo,j:j+passo) = imageP(position{3}(1):position{3}(1)+passo,position{3}(2):position{3}(2)+passo);
                framesGerados{4}(i:i+passo,j:j+passo) = imageP(position{4}(1):position{4}(1)+passo,position{4}(2):position{4}(2)+passo);
            end
        end 
        movie{((index - 1) * 5 ) + 2} = framesGerados{1};
        movie{((index - 1) * 5 ) + 3} = framesGerados{2};
        movie{((index - 1) * 5 ) + 4} = framesGerados{3};
        movie{((index - 1) * 5 ) + 5} = framesGerados{4};
        movie{((index - 1) * 5 ) + 6} = frames{index+1};
    end
end