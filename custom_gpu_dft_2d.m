function xs = custom_gpu_dft_2d(xn)
    [row,col] = size(xn);
    %copia = [xn zeros(1,0)];
    copia = xn;
    for i=1:1:row
        copia(i,1:end) = c_dft(xn(i,1:end));
    end
    %copia1 = [copia zeros(1,0)];
    copia1 = gpuArray(copia);
    for j=1:1:col
        copia1(1:end,j) = c_dft(copia(1:end,j)')';
    end
    %copia1(2:end,1:end) = flip(copia1(2:end, 1:end));
    xs = copia1;
end