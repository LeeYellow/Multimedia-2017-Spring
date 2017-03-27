function [imgout] = amplify(img2D)
    imgout = zeros(1000,1000);
    for i = 1 :1000
        for j = 1 : 1000
            i_floor = floor((i-1)/4);
            j_floor = floor((j-1)/4);
      
            imgout(i, j) = img2D(i_floor+1, j_floor+1);
        end
    end
  
end