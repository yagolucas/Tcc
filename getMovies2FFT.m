function movie = getMovies2FFT(frames,vector,passo,nome)
    tic
    [un1, qtdFrames] = size(frames);
    movie = {};
    movie{1} = ifft2(fftshift(frames{1}));
    for index = 1:qtdFrames - 1
        frameAux = ifft2(fftshift(frames{index}));
        framesGerados = {frameAux,frameAux,frameAux};
        imageI = frameAux;
        imageP = ifft2(fftshift(frames{index+1}));
        vectorMoviment = vector{index};
        [width,height] = size(imageI);
        for i=1:passo:width-passo
            for j=1:passo:height-passo
                position = vectorMoviment(num2str(i) + "" + num2str(j));
                framesGerados{1}(position{1}(1):position{1}(1)+passo,position{1}(2):position{1}(2)+passo) = imageP(position{1}(1):position{1}(1)+passo,position{1}(2):position{1}(2)+passo);
                framesGerados{2}(position{2}(1):position{2}(1)+passo,position{2}(2):position{2}(2)+passo) = imageP(position{2}(1):position{2}(1)+passo,position{2}(2):position{2}(2)+passo);                
                framesGerados{3}(position{3}(1):position{3}(1)+passo,position{3}(2):position{3}(2)+passo) = imageP(position{3}(1):position{3}(1)+passo,position{3}(2):position{3}(2)+passo);
                %framesGerados{4}(i:i+passo,j:j+passo) = imageP(position{4}(1):position{4}(1)+passo,position{4}(2):position{4}(2)+passo);          
            end
        end 
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
    toc
    tempo = "descompressão fft--- " + nome
end