function movie = getMovies2(frames,vector,passo,errorVector,func)
    [un1, qtdFrames] = size(frames);
    movie = {};
    movie{1} = getBlocksTrans(frames{1},8,func);
    for index = 1:qtdFrames - 1
        matrixError = {getBlocksTrans(errorVector{index}{1},8,func), ...
            getBlocksTrans(errorVector{index}{2},8,func),...
            getBlocksTrans(errorVector{index}{3},8,func)};
        frameAux = getBlocksTrans(frames{index},8,func);
        framesGerados = {frameAux,frameAux,frameAux};
        imageI = frameAux;
        imageP = getBlocksTrans(frames{index+1},8,func);
        vectorMoviment = vector{index};
        [width,height] = size(imageI);
        for i=1:passo:width-passo
            for j=1:passo:height-passo
                % i:i+passo,j:j+passo
                position = vectorMoviment(num2str(i) + "" + num2str(j));
                framesGerados{1}(position{1}(1):position{1}(1)+passo,position{1}(2):position{1}(2)+passo) = imageP(position{1}(3):position{1}(3)+passo,position{1}(4):position{1}(4)+passo);
                framesGerados{2}(position{2}(1):position{2}(1)+passo,position{2}(2):position{2}(2)+passo) = imageP(position{2}(3):position{2}(3)+passo,position{2}(4):position{2}(4)+passo);                
                framesGerados{3}(position{3}(1):position{3}(1)+passo,position{3}(2):position{3}(2)+passo) = imageP(position{3}(3):position{3}(3)+passo,position{3}(4):position{3}(4)+passo);
                % framesGerados{4}(i:i+passo,j:j+passo) = imageP(position{4}(1):position{4}(1)+passo,position{4}(2):position{4}(2)+passo);
            end
        end 
        framesGerados{1} = framesGerados{1} + matrixError{1};
        framesGerados{2} = framesGerados{2} + matrixError{2};
        framesGerados{3} = framesGerados{3} + matrixError{3};
        movie{((index - 1) * 4 ) + 2} = framesGerados{1};
        movie{((index - 1) * 4 ) + 3} = framesGerados{2};
        movie{((index - 1) * 4 ) + 4} = framesGerados{3};
        movie{((index - 1) * 4 ) + 5} = imageP;
    end
    [n,tamanho] = size(movie);
    for k=1:tamanho
        movie{k}(movie{k} > 1) = 1;
        movie{k}(movie{k} < 0) = 0;
    end
end