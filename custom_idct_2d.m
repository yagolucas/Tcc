function xs = custom_idct_2d(xn)
    [row,col] = size(xn);
    copia = [xn zeros(1,0)];
    for i=1:1:row
        copia(i,1:end) = custom_idct(xn(i,1:end));
    end
    copia1 = [copia zeros(1,0)];
    for j=1:1:col
        copia1(1:end,j) = custom_idct(copia(1:end,j)')';
    end
    xs = copia1;
end