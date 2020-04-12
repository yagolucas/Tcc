function position = checkAllDirections(im1,im2,passo,initX1,initY1,initX2,initY2,scale)
    defaultError = 1;
    position = {[initX1,initY1],[initX1,initY1],[initX1,initY1]};
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
                if roundedx11 == 0
                    roundedx11 = 1;
                end
                if roundedy11 == 0
                    roundedy11 = 1;
                end
                if roundedx12 == 0
                    roundedx12 = 1;
                end
                if roundedy12 == 0
                    roundedy12 = 1;
                end
                if roundedx13 == 0
                    roundedx13 = 1;
                end
                if roundedy13 == 0
                    roundedy13 = 1;
                end
                position = {[roundedx11,roundedy11],[roundedx12,roundedy12],[roundedx13,roundedy13]};
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
                if roundedx21 == 0
                    roundedx21 = 1;
                end
                if roundedy21 == 0
                    roundedy21 = 1;
                end
                if roundedx22 == 0
                    roundedx22 = 1;
                end
                if roundedy22 == 0
                    roundedy22 = 1;
                end
                if roundedx23 == 0
                    roundedx23 = 1;
                end
                if roundedy23 == 0
                    roundedy23 = 1;
                end
                position = {[roundedx21,roundedy21],[roundedx22,roundedy22],[roundedx23,roundedy23]};
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
                if roundedx31 == 0
                    roundedx31 = 1;
                end
                if roundedy31 == 0
                    roundedy31 = 1;
                end
                if roundedx32 == 0
                    roundedx32 = 1;
                end
                if roundedy32 == 0
                    roundedy32 = 1;
                end
                if roundedx33 == 0
                    roundedx33 = 1;
                end
                if roundedy33 == 0
                    roundedy33 = 1;
                end
                position = {[roundedx31,roundedy31],[roundedx32,roundedy32],[roundedx33,roundedy33]};
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
                if roundedx41 == 0
                    roundedx41 = 1;
                end
                if roundedy41 == 0
                    roundedy41 = 1;
                end
                if roundedx42 == 0
                    roundedx42 = 1;
                end
                if roundedy42 == 0
                    roundedy42 = 1;
                end
                if roundedx43 == 0
                    roundedx43 = 1;
                end
                if roundedy43 == 0
                    roundedy43 = 1;
                end
                position = {[roundedx41,roundedy41],[roundedx42,roundedy42],[roundedx43,roundedy43]};
            end
        end
    end
end