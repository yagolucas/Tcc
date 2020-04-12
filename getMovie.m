function novoFilm = getMovie(compressed, totalFrames)
   [source , qtdFrames] = size(compressed);
   novoFilm = {};
   novoFilm{1} = compressed{1};
   index = 1;
   for i=1:qtdFrames - 1
       imGeradas = getPredict(compressed{i},compressed{i+1});
       novoFilm{index} = imGeradas{1};
       index = index + 1;
       novoFilm{index} = imGeradas{2};
       index = index + 1;
       novoFilm{index} = imGeradas{3};
       index = index + 1;
       novoFilm{index} = compressed{i+1};
       index = index + 1;
       countagem = i
   end
end