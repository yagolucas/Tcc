function position = checkAllDirections(im1,im2,passo,initX1,initY1,initX2,initY2,scale)
    defaultError = 1;
    position = {[initX1,initY1,initX2,initY2,],...
        [initX1,initY1,initX2,initY2,],...
        [initX1,initY1,initX2,initY2,],...
        [initX1,initY1,initX2,initY2,]};
    if checkSquares(im1,im2,passo,initX1,initY1,initX1,initY1) == 0
        return;
    end
    for i=0:scale
        for j=0:scale
            
                erroAux1 = checkSquares(im1,im2,passo,initX1,initY1,initX2+i,initY2+j);
                if erroAux1 < defaultError
                    defaultError = erroAux1;
                    roundedx11 = initX2+ (round(i*0.2));
                    roundedy11 = initY2+ round((j*0.2));
                    roundedx12 = initX2+ round((i*0.4));
                    roundedy12 = initY2+ round((j*0.4));
                    roundedx13 = initX2+ round((i*0.6));
                    roundedy13 = initY2+ round((j*0.6));
                    roundedx14 = initX2+ round((i*0.8));
                    roundedy14 = initY2+ round((j*0.8));
                    position = {...
                        [roundedx11,roundedy11,initX2+i,initY2+j],...
                        [roundedx12,roundedy12,initX2+i,initY2+j],...
                        [roundedx13,roundedy13,initX2+i,initY2+j],...
                        [roundedx14,roundedy14,initX2+i,initY2+j]};
                    if erroAux1 == 0
                        return;
                    end
                end
            
            
                erroAux2 = checkSquares(im1,im2,passo,initX1,initY1,initX2+i,initY2-j);
                if erroAux2 < defaultError
                    defaultError = erroAux2;
                    roundedx21 = initX2 + round((i*0.2));
                    roundedy21 = initY2 - round((j*0.2));
                    roundedx22 = initX2+round((i*0.4));
                    roundedy22 = initY2-round((j*0.4));
                    roundedx23 = initX2+round((i*0.6));
                    roundedy23 = initY2-round((j*0.6));
                    roundedx24 = initX2+round((i*0.8));
                    roundedy24 = initY2-round((j*0.8));  
                    position = {...
                        [roundedx21,roundedy21,initX2+i,initY2-j],...
                        [roundedx22,roundedy22,initX2+i,initY2-j],...
                        [roundedx23,roundedy23,initX2+i,initY2-j],...
                        [roundedx24,roundedy24,initX2+i,initY2-j]};
                    if erroAux2 == 0
                        return;
                    end
                end
            
            
                erroAux3 = checkSquares(im1,im2,passo,initX1,initY1,initX2-i,initY2+j);
                if erroAux3 < defaultError
                    defaultError = erroAux3;
                    roundedx31 = initX2-round((i*0.2));
                    roundedy31 = initY2+round((j*0.2));
                    roundedx32 = initX2-round((i*0.4));
                    roundedy32 = initY2+round((j*0.4));
                    roundedx33 = initX2-round((i*0.6));
                    roundedy33 = initY2+round((j*0.6)); 
                    roundedx34 = initX2-round((i*0.8));
                    roundedy34 = initY2+round((j*0.8));
                    position = {...
                        [roundedx31,roundedy31,initX2-i,initY2+j],...
                        [roundedx32,roundedy32,initX2-i,initY2+j],...
                        [roundedx33,roundedy33,initX2-i,initY2+j],...
                        [roundedx34,roundedy34,initX2-i,initY2+j]};
                    if erroAux3 == 0
                        return;
                    end
                end
            
            
                erroAux4 = checkSquares(im1,im2,passo,initX1,initY1,initX2-i,initY2-j);
                if erroAux4 < defaultError
                    defaultError = erroAux4;
                    roundedx41 = initX2-round((i*0.2));
                    roundedy41 = initY2-round((j*0.2));
                    roundedx42 = initX2-round((i*0.4));
                    roundedy42 = initY2-round((j*0.4));
                    roundedx43 = initX2-round((i*0.6));
                    roundedy43 = initY2-round((j*0.6));
                    roundedx44 = initX2-round((i*0.8));
                    roundedy44 = initY2-round((j*0.8));
                    position = {...
                        [roundedx41,roundedy41,initX2-i,initY2-j],...
                        [roundedx42,roundedy42,initX2-i,initY2-j],...
                        [roundedx43,roundedy43,initX2-i,initY2-j],...
                        [roundedx44,roundedy44,initX2-i,initY2-j]};
                    if erroAux4 == 0
                        return;
                    end
                end
            
        end
    end
end