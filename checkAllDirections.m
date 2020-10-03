function position = checkAllDirections(im1,im2,passo,initX1,initY1,initX2,initY2,scale)
    defaultError = 1;
    position = {[initX1,initY1,initX2,initY2,],[initX1,initY1,initX2,initY2,],[initX1,initY1,initX2,initY2,],[initX1,initY1,initX2,initY2,]};
    if checkSquares(im1,im2,passo,initX1,initY1,initX1,initY1) == 0
        return;
    end
    for i=0:scale
        for j=0:scale
            erroAux1 = checkSquares(im1,im2,passo,initX1,initY1,initX2+i,initY2+j);
            if erroAux1 < defaultError
                defaultError = erroAux1;
                roundedx11 = round(initX2+(i*0.25));
                roundedy11 = round(initY2+(j*0.25));
                roundedx12 = round(initX2+(i*0.5));
                roundedy12 = round(initY2+(j*0.5));
                roundedx13 = round(initX2+(i*0.75));
                roundedy13 = round(initY2+(j*0.75));             
                position = {...
                    [roundedx11,roundedy11,initX2+i,initY2+j],...
                    [roundedx12,roundedy12,initX2+i,initY2+j],...
                    [roundedx13,roundedy13,initX2+i,initY2+j]};
                if erroAux1 == 0
                    return;
                end
            end
            erroAux2 = checkSquares(im1,im2,passo,initX1,initY1,initX2+i,initY2-j);
            if erroAux2 < defaultError
                defaultError = erroAux2;
                roundedx21 = round(initX2+(i*0.25));
                roundedy21 = round(initY2-(j*0.25));
                roundedx22 = round(initX2+(i*0.5));
                roundedy22 = round(initY2-(j*0.5));
                roundedx23 = round(initX2+(i*0.75));
                roundedy23 = round(initY2-(j*0.75));                             
                position = {...
                    [roundedx21,roundedy21,initX2+i,initY2-j],...
                    [roundedx22,roundedy22,initX2+i,initY2-j],...
                    [roundedx23,roundedy23,initX2+i,initY2-j]};
                if erroAux2 == 0
                    return;
                end
            end
            erroAux3 = checkSquares(im1,im2,passo,initX1,initY1,initX2-i,initY2+j);
            if erroAux3 < defaultError
                defaultError = erroAux3;
                roundedx31 = round(initX2-(i*0.25));
                roundedy31 = round(initY2+(j*0.25));
                roundedx32 = round(initX2-(i*0.5));
                roundedy32 = round(initY2+(j*0.5));
                roundedx33 = round(initX2-(i*0.75));
                roundedy33 = round(initY2+(j*0.75));          
                position = {...
                    [roundedx31,roundedy31,initX2-i,initY2+j],...
                    [roundedx32,roundedy32,initX2-i,initY2+j],...
                    [roundedx33,roundedy33,initX2-i,initY2+j]};
                if erroAux3 == 0
                    return;
                end
            end
            erroAux4 = checkSquares(im1,im2,passo,initX1,initY1,initX2-i,initY2-j);
            if erroAux4 < defaultError
                defaultError = erroAux4;
                roundedx41 = round(initX2-(i*0.25));
                roundedy41 = round(initY2-(j*0.25));
                roundedx42 = round(initX2-(i*0.5));
                roundedy42 = round(initY2-(j*0.5));
                roundedx43 = round(initX2-(i*0.75));
                roundedy43 = round(initY2-(j*0.75));
                position = {...
                    [roundedx41,roundedy41,initX2-i,initY2-j],...
                    [roundedx42,roundedy42,initX2-i,initY2-j],...
                    [roundedx43,roundedy43,initX2-i,initY2-j]};
                if erroAux4 == 0
                    return;
                end
            end
        end
    end
end