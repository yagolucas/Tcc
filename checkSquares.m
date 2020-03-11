function error = checkSquares(im1,im2,passo,initX1,initY1,initX2,initY2)
    try
        error = immse(im1(initX1:initX1+passo,initY1:initY1+passo),im2(initX2:initX2+passo,initY2:initY2+passo));
    catch
        error = 1;
    end
end