function movie = generateMovie(frames,name)
    writerObj = VideoWriter(name);
    open(writerObj);
    [aw1,qtdFrames] = size(frames);
    for i=1:qtdFrames
        rgbImage = cat(3, frames{i}, frames{i}, frames{i});
        writeVideo(writerObj,rgbImage);
    end
    close(writerObj);
end