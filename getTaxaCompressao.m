function taxaCompressao = getTaxaCompressao(bloco)
    [wb,hb] = size(bloco);
    bytesTotal = wb*hb;
    matrizNulos = find(~real(bloco));
    [w,h] = size(matrizNulos);
    bytesNulos = w * h;
    taxaCompressao = [bytesTotal,bytesNulos];
end