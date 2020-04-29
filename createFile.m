function arquivo = createFile(frames,matrix,name)
    [uno,qtdFrames] = size(frames);
    [uno,qtdMatrix] = size(matrix);
    fid=fopen(name,'w');
    for i=1:qtdFrames
        dlmwrite(name,frames{i},'-append');
    end
end