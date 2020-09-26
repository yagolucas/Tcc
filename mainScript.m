function voids = mainScript()
    pathOriginais = "C:\Users\Adm\Documents\MATLAB\videos originais\";
    pathTransformados = "C:\Users\Adm\Documents\MATLAB\videos transformada\";
    passo = 8;
    arquivos = dir(pathOriginais);
    for i=3:length(arquivos)
        if i >= 3
           nome = arquivos(i).name;
           pathSalvarArquivoTxt = "C:\Users\Adm\Documents\MATLAB\taxas de compressao\" + nome + ".txt";
           file = fopen(pathSalvarArquivoTxt,'w');
           frames = getFrames(pathOriginais + nome, passo,@custom_dct_2d);
           fprintf(file,"DCT - tempo de separar frames e vetor de movimento : %8.4f\n", frames{4});
           fprintf(file,"DCT - Tamanho total e bytes nulos %d : %d\n", frames{3}(1), frames{3}(2));
           tic;
           movie = getMovies2(frames{1},frames{2},passo,nome+"-dct.avi", @custom_idct_2d);
           tempoDescompressao = toc;
           fprintf(file,"DCT - tempo de descompressão : %8.4f\n", tempoDescompressao);
           generateMovie(movie,pathTransformados + nome + "-dct.avi");
           % Inicio da DFT
           frames = getFrames(pathOriginais + nome, passo,@custom_dft_2d);
           fprintf(file,"DFT - tempo de separar frames e vetor de movimento : %8.4f\n", frames{4});
           fprintf(file,"DFT - Tamanho total e bytes nulos %d : %d\n", frames{3}(1), frames{3}(2));
           tic;
           movie = getMovies2(frames{1},frames{2},passo,nome+"-dft.avi", @custom_idft_2d);
           tempoDescompressao = toc;
           fprintf(file,"DFT - tempo de descompressão : %8.4f\n", tempoDescompressao);
           generateMovie(movie,pathTransformados + nome + "-dft.avi");
           fclose(file);
        end
    end
end