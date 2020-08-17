function resultado = compare(original,dctM,iftM)
    parametro = VideoReader(original);
    dctVideo = VideoReader(dctM);
    dftVideo = VideoReader(iftM);
    tamanho = dctVideo.NumberOfFrames;
    tamanheo = dftVideo.NumberOfFrames;
    tamanhor = parametro.NumberOfFrames;
    resu1 = 0;
    resu2 = 0;
    for i=1:tamanho
        auxParametro = read(parametro,i);
        auxDct = read(dctVideo,i);
        auxDft = read(dftVideo,i);
        auxParametro = rgb2gray(auxParametro);
        auxParaemtroFinal = cat(3,auxParametro,auxParametro,auxParametro);
        resu1 = resu1 + immse(auxDct,auxParaemtroFinal);
        resu2 = resu2 + immse(auxDft,auxParaemtroFinal);
    end
    resultado = " " + original + " - dct : " + resu1 / tamanho + " - dft : " + resu2 / tamanho
end