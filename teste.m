function x = teste(im)
    im1 = getBlocksTrans(im,8,@custom_dct_2d,true);
    im11 = getBlocksTrans(im1,8,@custom_idct_2d,false);
    anser = abs(im1 - im11);
    x = {sum(sum(anser)), im11};
end