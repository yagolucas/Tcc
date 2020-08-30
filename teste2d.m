function xs = teste2d(xn)
%    [w,h] = size(xn)
%    x1 = [xn zeros(1,0)];
%    for i=0:1:w-1
%        x1(i + 1, 1:end) = teste(xn(i + 1, 1:end));
%    end
%    x2 = x1';
%    [w,h] = size(xn)
%    for i=0:1:w-1
%        x1(i + 1, 1:end) = teste(x2(i + 1, 1:end));
%    end
%    xs = x1;

    [row,col] = size(xn);
    copia = [xn zeros(1,0)];
    for i=1:1:row
        copia(i,1:end) = teste(copia(i,1:end));
    end
    for j=1:1:col
        copia(1:end,j) = teste(copia(1:end,j)');
    end
    xs = copia;
end