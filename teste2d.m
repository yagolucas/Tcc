function xs = teste2d(im1,imageP,vetor)
    framesGerados = {im1, im1, im1};
    [width, height] = size(im1);

    passo = 64;
    for i=1:passo:width-passo
        for j=1:passo:height-passo
            % i:i+passo,j:j+passo
            position = vetor(num2str(i) + "" + num2str(j));
            framesGerados{1}(position{1}(1):position{1}(1)+passo,position{1}(2):position{1}(2)+passo) = imageP(position{1}(3):position{1}(3)+passo,position{1}(4):position{1}(4)+passo);
            framesGerados{2}(position{2}(1):position{2}(1)+passo,position{2}(2):position{2}(2)+passo) = imageP(position{2}(3):position{2}(3)+passo,position{2}(4):position{2}(4)+passo);
            framesGerados{3}(position{3}(1):position{3}(1)+passo,position{3}(2):position{3}(2)+passo) = imageP(position{3}(3):position{3}(3)+passo,position{3}(4):position{3}(4)+passo);
            % framesGerados{4}(i:i+passo,j:j+passo) = imageP(position{4}(1):position{4}(1)+passo,position{4}(2):position{4}(2)+passo);
        end
    end
    xs = framesGerados;
end