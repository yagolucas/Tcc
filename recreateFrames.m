function errorImages = recreateFrames(imagemBase,imagemP,imagens,positions,fun,fator)
    [width,height] = size(imagemBase);
    passo = 64;
    imagensGeradas = {imagemBase, imagemBase, imagemBase, imagemBase};
    taxaCompressao = [0,0];
    for i=1:passo:width-passo
        for j=1:passo:height-passo
            position = positions(num2str(i) + "" + num2str(j));
            imagensGeradas{1}(position{1}(1):position{1}(1)+passo,position{1}(2):position{1}(2)+passo) = imagemP(position{1}(3):position{1}(3)+passo,position{1}(4):position{1}(4)+passo);
            imagensGeradas{2}(position{2}(1):position{2}(1)+passo,position{2}(2):position{2}(2)+passo) = imagemP(position{2}(3):position{2}(3)+passo,position{2}(4):position{2}(4)+passo);
            imagensGeradas{3}(position{3}(1):position{3}(1)+passo,position{3}(2):position{3}(2)+passo) = imagemP(position{3}(3):position{3}(3)+passo,position{3}(4):position{3}(4)+passo);
            imagensGeradas{4}(position{4}(1):position{4}(1)+passo,position{4}(2):position{4}(2)+passo) = imagemP(position{4}(3):position{4}(3)+passo,position{4}(4):position{4}(4)+passo);
        end
    end
    erroIm1 = imagens{1} - imagensGeradas{1};
    erroIm2 = imagens{2} - imagensGeradas{2};
    erroIm3 = imagens{3} - imagensGeradas{3};
    erroIm4 = imagens{4} - imagensGeradas{4};
    error = {getBlocksTrans(erroIm1,8,fun,true,fator),...
        getBlocksTrans(erroIm2,8,fun,true,fator),...
        getBlocksTrans(erroIm3,8,fun,true,fator),...
        getBlocksTrans(erroIm4,8,fun,true,fator)};
    taxaCompressao = taxaCompressao + getTaxaCompressao(error{1});
    taxaCompressao = taxaCompressao + getTaxaCompressao(error{2});
    taxaCompressao = taxaCompressao + getTaxaCompressao(error{3});
    taxaCompressao = taxaCompressao + getTaxaCompressao(error{4});
    errorImages = {error , taxaCompressao,erroIm1};
end