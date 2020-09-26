function xs = teste2d(im)
    tic;
    [w,h] = size(im);
    ar = gpuArray(im);
    s = 1:h;
    arrayfun(@teste,s);
%     for i=1:w
%         a = teste(im(i,1:end));
%     end
    toc
end