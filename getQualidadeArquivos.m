function relatorio = getQualidadeArquivos()
    %files = ls("C:\Users\Adm\Documents\MATLAB\testes de tamanho");
    %[dir,unidades] = size(files);
    %files
    %d = uigetdir(pwd, 'Select a folder');
    %files = dir(fullfile(d, '*.avi'));
    %e = uigetdir(pwd, 'Select a folder to compare');
    %filese = dir(fullfile(e, '*.mov'));
    for i=1:numel(files)
        aux = files(i).name;
        a=VideoReader("teste de qualidade/" + aux);
        
    end
end