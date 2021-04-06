function transformScript()
    pathOriginal = "C:\Users\Adm\Documents\MATLAB\videos originais\";
    arquivos = dir(pathOriginal);
    for i=3:length(arquivos)
        nome = arquivos(i).name
        video = VideoReader(pathOriginal + nome);
        tamanho = video.NumberOfFrames;
        writerObj = VideoWriter(nome + "rgb.avi");
        open(writerObj);
        for j=1:tamanho
            frame = read(video,j);
            frame = rgb2gray(frame);
            newFrame = cat(3,frame,frame,frame);
            writeVideo(writerObj,newFrame);
        end
        close(writerObj);
    end
end