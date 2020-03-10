function frames = getFrames(path)
a=VideoReader(path);
tamanho = a.NumberOfFrames;
sobra = mod(tamanho,5);
tamanho = tamanho - sobra;
c = {};
tamanho
for img = 1:tamanho/5
    b = read(a, (img*5)-4);
    gray = rgb2gray(b);
    gray = double(gray)/255;
    c{img} = dct2(gray);
    %%imshow(c{img});
end
frames = c;
end