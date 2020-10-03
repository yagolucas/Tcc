function frames = getFrames(path,passo,func)
tic;
a=VideoReader(path);
tamanho = a.NumberOfFrames;
sobra = mod(tamanho,4);
tamanho = tamanho - sobra;
c = cell(tamanho/4); % frames i
d = cell(tamanho/4); % vetor de movimento
t = [0,0]; % taxa de compressão
tamanhoTotal = 0;
errorMatriz = cell(tamanho/4);
aux = {};
for i=1:tamanho/4
    i1 = read(a, (i*4)-3);
    i1 = double(rgb2gray(i1))/255;
    if i ~= (tamanho/4)
        au1 = read(a, (i*4)-2);
        au2 = read(a, (i*4)-1);
        au3 = read(a, (i*4));
        au1 = double(rgb2gray(au1))/255;
        au2 = double(rgb2gray(au2))/255;
        au3 = double(rgb2gray(au3))/255;
        i2 = read(a, ((i + 1)*4) - 3);
        i2 = double(rgb2gray(i2))/255;
        d{i} = getPredictFinal(i1,i2);
        imagesForErrorCalc = { au1 , au2 , au3};
        aux = recreateFrames(i1,i2, imagesForErrorCalc, d{i}, func);
        errorMatriz{i} = aux{1};
        t = t + aux{2};
    end
    c{i} = getBlocksTrans(i1,passo,func);
    t = t + getTaxaCompressao(c{i});
end
tempo = toc
% parfor (img = 1:tamanho/4,12)
%     b = read(a, (img*4)-3);
%     gray = rgb2gray(b);
%     gray = double(gray)/255;
%     %c{img} = dct2(gray);
%     c{img} = getBlocksTrans(gray,passo,func);
% end
% [source, qtdFrames] = size(c);
% parfor (i=1:qtdFrames-1,12)
%    d{i} = getPredict2(c{i},c{i+1});
% end
frames = {c,d,t,errorMatriz,tempo};
end