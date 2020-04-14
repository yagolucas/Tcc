function position = checkAllDirections(im1,im2,passo,initX1,initY1,initX2,initY2,scale)
    defaultError = 1;
    position = {[initX1,initY1],[initX1,initY1],[initX1,initY1],[initX1,initY1]};
    if checkSquares(im1,im2,passo,initX1,initY1,initX1,initY1) == 0
        return;
    end
    for i=0:scale
        for j=0:scale
            erroAux1 = checkSquares(im1,im2,passo,initX1,initY1,initX2+i,initY2+j);
            if erroAux1 < defaultError
                defaultError = erroAux1;
                roundedx11 = round(initX2+(i*0.2));
                roundedy11 = round(initY2+(j*0.2));
                roundedx12 = round(initX2+(i*0.4));
                roundedy12 = round(initY2+(j*0.4));
                roundedx13 = round(initX2+(i*0.6));
                roundedy13 = round(initY2+(j*0.6));
                roundedx14 = round(initX2+(i*0.8));
                roundedy14 = round(initY2+(j*0.8));
                if roundedx11 < 0
                    roundedx11 = 0;
                end
                if roundedy11 < 0
                    roundedy11 = 0;
                end
                if roundedx12 < 0
                    roundedx12 = 0;
                end
                if roundedy12 < 0
                    roundedy12 = 0;
                end
                if roundedx13 < 0
                    roundedx13 = 0;
                end
                if roundedy13 < 0
                    roundedy13 = 0;
                end
                if roundedx14 < 0
                    roundedx14 = 0;
                end
                if roundedy14 < 0
                    roundedy14 = 0;
                end
                if roundedx11 > 1
                    roundedx11 = 1;
                end
                if roundedy11 > 1
                    roundedy11 = 1;
                end
                if roundedx12 > 0
                    roundedx12 = 1;
                end
                if roundedy12 > 1 
                    roundedy12 = 1;
                end
                if roundedx13 > 1
                    roundedx13 = 1;
                end
                if roundedy13 > 1
                    roundedy13 = 1;
                end
                if roundedx14 > 1
                    roundedx14 = 1;
                end
                if roundedy14 > 1
                    roundedy14 = 1;
                end
                position = {[roundedx11,roundedy11],[roundedx12,roundedy12],[roundedx13,roundedy13],[roundedx14,roundedy14]};
                if erroAux1 == 0
                    return;
                end
            end
            erroAux2 = checkSquares(im1,im2,passo,initX1,initY1,initX2+i,initY2-j);
            if erroAux2 < defaultError
                defaultError = erroAux2;
                roundedx21 = round(initX2+(i*0.2));
                roundedy21 = round(initY2-(j*0.2));
                roundedx22 = round(initX2+(i*0.4));
                roundedy22 = round(initY2-(j*0.4));
                roundedx23 = round(initX2+(i*0.6));
                roundedy23 = round(initY2-(j*0.6));
                roundedx24 = round(initX2+(i*0.8));
                roundedy24 = round(initY2-(j*0.8));
                if roundedx21 < 0
                    roundedx21 = 0;
                end
                if roundedy21 < 0
                    roundedy21 = 0;
                end
                if roundedx22 < 0
                    roundedx22 = 0;
                end
                if roundedy22 < 0
                    roundedy22 = 0;
                end
                if roundedx23 < 0
                    roundedx23 = 0;
                end
                if roundedy23 < 0
                    roundedy23 = 0;
                end
                if roundedx24 < 0
                    roundedx24 = 0;
                end
                if roundedy24 < 0
                    roundedy24 = 0;
                end
                if roundedx21 > 1
                    roundedx21 = 1;
                end
                if roundedy21 > 1
                    roundedy21 = 1;
                end
                if roundedx22 > 0
                    roundedx22 = 1;
                end
                if roundedy22 > 1 
                    roundedy22 = 1;
                end
                if roundedx23 > 1
                    roundedx23 = 1;
                end
                if roundedy23 > 1
                    roundedy23 = 1;
                end
                if roundedx24 > 1
                    roundedx24 = 1;
                end
                if roundedy24 > 1
                    roundedy24 = 1;
                end
                position = {[roundedx21,roundedy21],[roundedx22,roundedy22],[roundedx23,roundedy23],[roundedx24,roundedy24]};
                if erroAux2 == 0
                    return;
                end
            end
            erroAux3 = checkSquares(im1,im2,passo,initX1,initY1,initX2-i,initY2+j);
            if erroAux3 < defaultError
                defaultError = erroAux3;
                roundedx31 = round(initX2-(i*0.2));
                roundedy31 = round(initY2+(j*0.2));
                roundedx32 = round(initX2-(i*0.4));
                roundedy32 = round(initY2+(j*0.4));
                roundedx33 = round(initX2-(i*0.6));
                roundedy33 = round(initY2+(j*0.6));
                roundedx34 = round(initX2-(i*0.8));
                roundedy34 = round(initY2+(j*0.8));
                if roundedx31 < 0
                    roundedx31 = 0;
                end
                if roundedy31 < 0
                    roundedy31 = 0;
                end
                if roundedx32 < 0
                    roundedx32 = 0;
                end
                if roundedy32 < 0
                    roundedy32 = 0;
                end
                if roundedx33 < 0
                    roundedx33 = 0;
                end
                if roundedy33 < 0
                    roundedy33 = 0;
                end
                if roundedx34 < 0
                    roundedx34 = 0;
                end
                if roundedy34 < 0
                    roundedy34 = 0;
                end
                if roundedx31 > 1
                    roundedx31 = 1;
                end
                if roundedy31 > 1
                    roundedy31 = 1;
                end
                if roundedx32 > 0
                    roundedx32 = 1;
                end
                if roundedy32 > 1 
                    roundedy32 = 1;
                end
                if roundedx33 > 1
                    roundedx33 = 1;
                end
                if roundedy33 > 1
                    roundedy33 = 1;
                end
                if roundedx34 > 1
                    roundedx34 = 1;
                end
                if roundedy34 > 1
                    roundedy34 = 1;
                end
                position = {[roundedx31,roundedy31],[roundedx32,roundedy32],[roundedx33,roundedy33],[roundedx34,roundedy34]};
                if erroAux3 == 0
                    return;
                end
            end
            erroAux4 = checkSquares(im1,im2,passo,initX1,initY1,initX2-i,initY2-j);
            if erroAux4 < defaultError
                defaultError = erroAux4;
                roundedx41 = round(initX2-(i*0.2));
                roundedy41 = round(initY2-(j*0.2));
                roundedx42 = round(initX2-(i*0.4));
                roundedy42 = round(initY2-(j*0.4));
                roundedx43 = round(initX2-(i*0.6));
                roundedy43 = round(initY2-(j*0.6));
                roundedx44 = round(initX2-(i*0.8));
                roundedy44 = round(initY2-(j*0.8));
                if roundedx41 < 0
                    roundedx41 = 0;
                end
                if roundedy41 < 0
                    roundedy41 = 0;
                end
                if roundedx42 < 0
                    roundedx42 = 0;
                end
                if roundedy42 < 0
                    roundedy42 = 0;
                end
                if roundedx43 < 0
                    roundedx43 = 0;
                end
                if roundedy43 < 0
                    roundedy43 = 0;
                end
                if roundedx44 < 0
                    roundedx44 = 0;
                end
                if roundedy44 < 0
                    roundedy44 = 0;
                end
                if roundedx41 > 1
                    roundedx41 = 1;
                end
                if roundedy41 > 1
                    roundedy41 = 1;
                end
                if roundedx42 > 0
                    roundedx42 = 1;
                end
                if roundedy42 > 1 
                    roundedy42 = 1;
                end
                if roundedx43 > 1
                    roundedx43 = 1;
                end
                if roundedy43 > 1
                    roundedy43 = 1;
                end
                if roundedx44 > 1
                    roundedx44 = 1;
                end
                if roundedy44 > 1
                    roundedy44 = 1;
                end
                position = {[roundedx41,roundedy41],[roundedx42,roundedy42],[roundedx43,roundedy43],[roundedx44,roundedy44]};
                if erroAux4 == 0
                    return;
                end
            end
        end
    end
end