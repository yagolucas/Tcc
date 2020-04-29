function relatorio = getTamanhoArquivos()
    %files = ls("C:\Users\Adm\Documents\MATLAB\testes de tamanho");
    %[dir,unidades] = size(files);
    %files
    d = uigetdir(pwd, 'Select a folder');
    files = dir(fullfile(d, '*.mov'));
    for i=1:numel(files)
        aux = files(i).name;
        framesDCT = getFrames("videos/" + aux);
        framesDFT = getFramesFFT("videos/" + aux);
        movieDCT = getMovies2(framesDCT{1},framesDCT{2},16);
        movieDFT = getMovies2FFT(framesDFT{1},framesDFT{2},16);
        generateMovieTest(framesDFT{1},aux + "DFT "+ ".avi");
        generateMovieTest(framesDCT{1},aux + "DCT "+ ".avi");
    end
end