function movie = generateMovie(frames)
    writerObj = VideoWriter('resultado.avi');
    open(writerObj);
    [aw1,qtdFrames] = size(frames);
    for i=1:qtdFrames
        writeVideo(writerObj,frames{i});
    end
    close(writerObj);
end