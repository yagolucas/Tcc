function compareScript()
    pathOriginal = "./videos transformada/";
    pathComparacao = "./testes finais/";
    arquivos = dir(pathOriginal);
    for i=3:length(arquivos)
        nome = arquivos(i).name;
        comparator = comparateImages(pathOriginal + nome,...
            pathComparacao + nome + "-dct.avi",...
            pathComparacao + nome + "-dft.avi");
        file = fopen("C:\Users\Adm\Documents\MATLAB\taxas de compressao\" + nome + "comp_quantizado.txt",'w');
        fprintf(file,"DCT - valor dos bytes errados : %8.4f\n", comparator{1});
        fprintf(file,"DFT - valor dos bytes errados : %8.4f\n", comparator{2});
        fprintf(file,"DCT - valor dos bytes errados por pixel : %8.4f\n", comparator{3});
        fprintf(file,"DFT - valor dos bytes errados por pixel : %8.4f\n", comparator{4});
        fprintf(file,"DCT - valor dos bytes errados por frame : %8.4f\n", comparator{5});
        fprintf(file,"DFT - valor dos bytes errados por frame : %8.4f\n", comparator{6});
        fclose(file);
    end
end