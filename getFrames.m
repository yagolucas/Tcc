function frames = getFrames(path)
a=VideoReader(path);
tamanho = a.NumberOfFrames;
sobra = mod(tamanho,5);
tamanho = tamanho - sobra;
c = {};
d = {};
tic
parfor (img = 1:tamanho/5,12)
    b = read(a, (img*5)-4);
    gray = rgb2gray(b);
    gray = double(gray)/255;
    c{img} = dct2(gray);
    %%imshow(c{img});
end
[source, qtdFrames] = size(c);
parfor (i=1:qtdFrames-1,12)
   d{i} = getPredict2(c{i},c{i+1});
end
toc
frames = {c,d};
end