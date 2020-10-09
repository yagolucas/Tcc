function linear = linearizacao(image) 
    maximo = max(image,[],'all');
    linear = image;
    linear(abs(linear) < maximo * 0.0001) = 0;
end