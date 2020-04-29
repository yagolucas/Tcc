function movie = generateMovieTest(frames,name)
    writerObj = VideoWriter(name);
    open(writerObj);
    [aw1,qtdFrames] = size(frames);
    for i=1:qtdFrames
        frames{i}(frames{i} < 0) = 0;
        frames{i}(frames{i} > 1) = 1;
        rgbImage = cat(3, frames{i}, frames{i}, frames{i});
        writeVideo(writerObj,rgbImage);
    end
    close(writerObj);
end