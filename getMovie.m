function novoFilm = getMovie(compressed, totalFrames)
   [source , qtdFrames] = size(compressed);
   novoFilm = {};
   novoFilm{1} = compressed{1};
   index = 1;
   for i=1:qtdFrames - 1
       meio = getPredict(compressed{i},compressed{i+1},0.5);
       primeiro = getPredict(compressed{i},meio,0.25);
       ultimo = getPredict(primeiro,compressed{i+1},0.75);
       novoFilm{index} = primeiro;
       index = index + 1;
       novoFilm{index} = meio;
       index = index + 1;
       novoFilm{index} = ultimo;
       index = index + 1;
       novoFilm{index} = compressed{i+1};
       index = index + 1;
   end
end