function comparison = comparateImages(original,dct,dft)
    originalVideo = VideoReader(original);
    dctVideo = VideoReader(dct);
    dftVideo = VideoReader(dft);
    qtdFrames = dctVideo.NumberOfFrames;
    sumErrorDct = 0;
    sumErrorDft = 0;
    for i=1:qtdFrames
       frameOriginal = read(originalVideo,i);
       frameDct = read(dctVideo,i);
       frameDft = read(dftVideo,i);
       frameOriginal = rgb2gray(frameOriginal);
       [width,height] = size(frameOriginal);
       frameDct = rgb2gray(frameDct);
       frameDft = rgb2gray(frameDft);
       erroDct = frameOriginal - frameDct;
       erroDft = frameOriginal - frameDft;
       erroB = frameDct - frameDft;
       sumErrorDct = sumErrorDct + sum(sum(abs(erroDct)));
       sumErrorDft = sumErrorDft + sum(sum(abs(erroDft)));
    end
    taxaPorPixelDct = sumErrorDct / (qtdFrames * width * height);
    taxaPorPixelDft = sumErrorDft / (qtdFrames * width * height);
    taxaPorFrameDct = sumErrorDct / (qtdFrames);
    taxaPorFrameDft = sumErrorDft / (qtdFrames);
    
    comparison = {sumErrorDct, sumErrorDft , taxaPorPixelDct , taxaPorPixelDft, taxaPorFrameDct , taxaPorFrameDft};
end