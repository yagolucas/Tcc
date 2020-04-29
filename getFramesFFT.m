function frames = getFramesFFT(path)
a=VideoReader(path);
tamanho = a.NumberOfFrames;
sobra = mod(tamanho,4);
tamanho = tamanho - sobra;
c = {};
d = {};
parfor (img = 1:tamanho/4,12)
    b = read(a, (img*4)-3);
    gray = rgb2gray(b);
    gray = double(gray)/255;
    c{img} = fftshift(fft2(gray));
end
[source, qtdFrames] = size(c);
parfor (i=1:qtdFrames-1,12)
   d{i} = getPredict2FFT(c{i},c{i+1});
end
frames = {c,d};
end