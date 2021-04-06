function compareScriptMulti()
    pathOriginal = "C:\Users\Adm\Documents\MATLAB\testes quantizados\";
    pathComparacao = "C:\Users\Adm\Documents\MATLAB\teste comparativo\";
    arquivos = dir(pathOriginal);
    factor = {0.25, 0.5, 2, 4};
    for i=3:length(arquivos)
        nome = arquivos(i).name;
        file = fopen("C:\Users\Adm\Documents\MATLAB\taxas de compressao\" + nome + "quantizacao.txt",'w');
        for index = 1:4
            comparator = comparateImages(pathOriginal + nome,...
            pathComparacao + nome + "-dct-" + factor{index} + ".avi",...
            pathComparacao + nome + "-dft-" + factor{index} + ".avi");
            fprintf(file,"DCT - valor dos bytes errados com fator %2.2f : %8.4f\n", factor{index} , comparator{1});
            fprintf(file,"DFT - valor dos bytes errados com fator %2.2f : %8.4f\n", factor{index} , comparator{2});
            fprintf(file,"DCT - valor dos bytes errados por pixel com fator %2.2f : %8.4f\n", factor{index} , comparator{3});
            fprintf(file,"DFT - valor dos bytes errados por pixel com fator %2.2f : %8.4f\n", factor{index} , comparator{4});
            fprintf(file,"DCT - valor dos bytes errados por frame com fator %2.2f : %8.4f\n", factor{index} , comparator{5});
            fprintf(file,"DFT - valor dos bytes errados por frame com fator %2.2f : %8.4f\n", factor{index} , comparator{6});
            fprintf(file,"\n");
        end
        fclose(file);
    end
end