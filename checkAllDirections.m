function position = checkAllDirections(im1,im2,passo,initX1,initY1,initX2,initY2,scale,reduz)
    defaultError = 1;
    position = [initX1,initY1];
    for i=0:scale
        for j=0:scale
            erroAux1 = checkSquares(im1,im2,passo,initX1,initY1,initX2+i,initY2+j);
            if erroAux1 < defaultError
                defaultError = erroAux1;
                roundedx1 = round(initX2+(i*reduz));
                roundedy1 = round(initY2+(j*reduz));
                if roundedx1 == 0
                    roundedx1 = 1;
                end
                if roundedy1 == 0
                    roundedy1 = 1;
                end
                position = [roundedx1,roundedy1];
            end
            erroAux2 = checkSquares(im1,im2,passo,initX1,initY1,initX2+i,initY2-j);
            if erroAux2 < defaultError
                defaultError = erroAux2;
                roundedx2 = round(initX2+(i*reduz));
                roundedy2 = round(initY2-(j*reduz));
                if roundedx2 == 0
                    roundedx2 = 1;
                end
                if roundedy2 == 0
                    roundedy2 = 1;
                end
                position = [roundedx2,roundedy2];
            end
            erroAux3 = checkSquares(im1,im2,passo,initX1,initY1,initX2-i,initY2+j);
            if erroAux3 < defaultError
                defaultError = erroAux3;
                roundedx3 = round(initX2-(i*reduz));
                roundedy3 = round(initY2+(j*reduz));
                if roundedx3 == 0
                    roundedx3 = 1;
                end
                if roundedy3 == 0
                    roundedy3 = 1;
                end
                position = [roundedx3,roundedy3];
            end
            erroAux4 = checkSquares(im1,im2,passo,initX1,initY1,initX2-i,initY2-j);
            if erroAux4 < defaultError
                defaultError = erroAux4;
                roundedx4 = round(initX2-(i*reduz));
                roundedy4 = round(initY2-(j*reduz));
                if roundedx4 == 0
                    roundedx4 = 1;
                end
                if roundedy4 == 0
                    roundedy4 = 1;
                end
                position = [roundedx4,roundedy4];
            end
        end
    end
end