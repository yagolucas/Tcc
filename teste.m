function Xk = teste()
    w = 82;
    h = 92;
    passo = 8;
    arr1 = [1:w];
    arr2 = [1:h];
    for i=1:passo:w
        for j=1:passo:h
            if (i+passo) > w 
                s = arr1(i:end)
            else
                s = arr1(i:passo+i-1)
            end
            if j+passo > h 
                r = arr2(j:end)
            else
                r = arr2(j:passo+j-1)
            end
        end
    end
end