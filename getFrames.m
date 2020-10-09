function frames = getFrames(path,passo,func)
tic;
a=VideoReader(path);
tamanho = a.NumberOfFrames;
sobra = mod(tamanho,5);
tamanho = tamanho - sobra;
c = cell(tamanho/5); % frames i
d = cell(tamanho/5); % vetor de movimento
t = [0,0]; % taxa de compressão
errorMatriz = cell(tamanho/5);
for i=1:tamanho/5
    i1 = read(a, (i*5)-4);
    i1 = double(rgb2gray(i1))/255;
    if i ~= (tamanho/5)
        au1 = read(a, (i*5)-3);
        au2 = read(a, (i*5)-2);
        au3 = read(a, (i*5)-1);
        au4 = read(a, (i*5));
        au1 = double(rgb2gray(au1))/255;
        au2 = double(rgb2gray(au2))/255;
        au3 = double(rgb2gray(au3))/255;
        au4 = double(rgb2gray(au4))/255;
        i2 = read(a, ((i + 1)*5) - 4);
        i2 = double(rgb2gray(i2))/255;
        d{i} = getPredictFinal(i1,i2);
        imagesForErrorCalc = { au1 , au2 , au3 , au4};
        aux = recreateFrames(i1,i2, imagesForErrorCalc, d{i}, func);
        errorMatriz{i} = aux{1};
        t = t + aux{2};
    end
    c{i} = getBlocksTrans(i1,passo,func,true);
    t = t + getTaxaCompressao(c{i});
end
tempo = toc;
frames = {c,d,t,errorMatriz,tempo};
end