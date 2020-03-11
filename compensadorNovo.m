function novoIm = compensadorNovo(im1,im2)
    aux1 = idct2(im1);
    aux2 = idct2(im2);
    passo = 20;
    count = 0;
    
    [w,h] = size(aux1);
    for x1=1:passo:w-passo
       for y1=x1:passo:h-passo
           pixel = 0;
           count = count + 1
           erroDoMaiorParametro = 1;
           posBlocox1 = x1;
           posBlocoy1 = y1;
           if immse(aux1(x1:x1+passo,y1:y1+passo),aux2(x1:x1+passo,y1:y1+passo)) <= 0.0001
               continue;
           end
           for x2=1:passo:w-passo
               for y2=x2:passo:h-passo
                   erroDoMaior = immse(aux1(x1:x1+passo,y1:y1+passo),aux2(x2:x2+passo,y2:y2+passo));
                   if erroDoMaior < erroDoMaiorParametro
                       erroDoMaiorParametro = erroDoMaior;
                       posBlocox1 = x2;
                       posBlocoy1 = y2;
                   end
               end
           end
           if erroDoMaiorParametro >= 0.0001
               for xx1=x1:x1+passo
                   for yy1=y1:y1+passo
                       erroDoMenorParametro = 1;
                       posBlocoxx1 = xx1;
                       posBlocoyy1 = yy1;
                       pixel = 0;
                       for xx2 = posBlocox1:posBlocox1 + passo
                           for yy2 = posBlocoy1:posBlocoy1+passo
                               if immse(aux1(xx1,yy1),aux2(xx1,yy1)) >= 0.0002
                                   erroDoMenor = immse(aux1(xx1,yy1),aux2(xx2,yy2)); 
                                   pixel = pixel + 1;
                                   if erroDoMenor < erroDoMenorParametro
                                       posBlocoxx1 = xx2;
                                       posBlocoyy1 = yy2;
                                       erroDoMenorParametro = erroDoMenor;
                                   end
                                   if erroDoMenor <= 0.0001
                                       break;
                                   end
                               end                        
                           end
                       end
                       aux1(xx1,yy1) = aux2(posBlocoxx1,posBlocoyy1);
                   end
               end
           end
           pixel = pixel + 0
           pixel = 0;
       end
    end
    novoIm = aux1;
end