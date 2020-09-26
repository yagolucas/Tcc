function Xk = teste(index)
%     m = 300;
%     k = 300;
%     n = 500;
%     p = 300;
%     tic;
%     a = rand(m,k);
%     b = rand(k,n,p);
%     c = zeros(m,n,p);
%     for i=1:p
%         c(:,:,i) = a * b(:,:,i);
%     end
%    t = toc;
%    disp(['cpu time:' num2str(t)]);
%     tic;
%     a = rand(m,k,'gpuArray');
%     b = rand(k,n,p,'gpuArray');
%     c = pagefun(@mtimes,a,b);
%     wait(gpuDevice);
%     t = toc;
%     disp(['gpu time:' num2str(t)]);
    im = double(rgb2gray(imread("imagens/hd.jpg")))/255;
    [w.h] = size(im);
    Xk = dct2(im(index,1:end));
end