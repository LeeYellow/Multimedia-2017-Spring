function [imgout] = bilinear (img2D)
    imgout = zeros(1000,1000);
    for i = 1 :1000
        for j = 1 : 1000
            i_floor = floor((i-1) / 4);
            i_ceil = i_floor + 1;
            j_floor = floor((j-1) / 4);
            j_ceil = j_floor + 1;
            if i_floor == 0 || j_floor == 0
                imgout(i, j) = img2D(1, 1);
            else
                a1 = ((i-1)/4-i_floor) * ((j-1)/4-j_floor);
                a2 = (i_ceil-(i-1)/4) * ((j-1)/4-j_floor);
                a3 = ((i-1)/4-i_floor) * (j_ceil-(j-1)/4);
                a4 = (i_ceil-(i-1)/4) * (j_ceil-(j-1)/4);
                imgout(i, j) = a4*img2D(i_floor, j_floor) + a3*img2D(i_ceil, j_floor)+ a2*img2D(i_floor, j_ceil)+ a1*img2D(i_ceil, j_ceil);
        
            end
        end
    end
end