function x = teste(path)
    a=VideoReader(path);
    x = cell(2);
    im1 = read(a,1);
    im1 = double(rgb2gray(im1))/255;
    im2 = read(a,6);
    im2 = double(rgb2gray(im2))/255;
    x{1} = im1;
    x{2} = im2;
end