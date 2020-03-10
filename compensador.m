function novoIm = compensador(im1,im2)
    aux1 = idct2(im1);
    aux2 = idct2(im2);
    passo = 9;
    [w,h] = size(aux1);
    for i=1:passo:w-passo
       for j=i:passo:h-passo
           erro = 90000;
           posW = i;
           posH = j;
           if immse(aux1(i:i+passo,j:j+passo),aux2(i:i+passo,j:j+passo)) ~= 0
              for k=1:passo:w-passo
                 for  l=1:passo:h-passo
                    erroAux = immse(aux1(i:i+passo,j:j+passo),aux2(k:k+passo,l:l+passo));
                    if erroAux == 0
                        break;
                    else
                        if erro > erroAux
                            erro = erroAux;
                            posW = k;
                            posH = l;
                        end
                    end
                    
                 end
              end
              aux1(i:i+passo,j:j+passo) = aux2(posW:posW+passo,posH:posH+passo);
           end
       end
    end
    novoIm = aux1;
end