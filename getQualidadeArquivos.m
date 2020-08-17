function relatorio = getQualidadeArquivos()
    d = uigetdir(pwd, 'Select a folder');
    files = dir(fullfile(d, '*.mov'));
    for i=1:numel(files)
        aux = files(i).name;
        stringDct = aux + "DCT " + ".avi";
        stringDft = aux + "DFT " + ".avi";
        compare(aux,stringDct,stringDft);
    end
end