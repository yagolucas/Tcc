function quantizacaoScript()
    pathOriginais = "C:\Users\Adm\Documents\MATLAB\testes quantizados\";
    arquivos = dir(pathOriginais);
    fator = {0.25 , 0.5 , 2, 4};
    for i=3:length(arquivos)
        if i >= 3
            nome = arquivos(i).name;
            pathSalvarArquivoTxt = "C:\Users\Adm\Documents\MATLAB\taxas de compressao\" + nome + ".txt";
            file = fopen(pathSalvarArquivoTxt,'w');
            for q=1:4   
               if i == 3 && q <= 2
                   continue % continuar de onde parei
               end
               frames = getFrames(pathOriginais + nome, 8,@custom_dct_2d,fator{q});
               fprintf(file,"DCT - Tamanho total e bytes nulos com fator:%2.2f %d : %d\n", fator{q}, frames{3}(1), frames{3}(2));
               movie = getMovies2(frames{1},frames{2},64,frames{4}, @custom_idct_2d, fator{q});
               generateMovie(movie,nome + "-dct-" + fator{q} + ".avi");
               % Inicio da DFT
               frames = getFrames(pathOriginais + nome, 8,@custom_dft_2d, fator{q});
               fprintf(file,"DFT - Tamanho total e bytes nulos com fator: %2.2f %d : %d\n",fator{q} , frames{3}(1), frames{3}(2));
               movie = getMovies2(frames{1},frames{2},64,frames{4}, @custom_idft_2d,fator{q});
               generateMovie(movie,nome + "-dft-" + fator{q} + ".avi"); 
            end
            fclose(file);
        end
    end
end