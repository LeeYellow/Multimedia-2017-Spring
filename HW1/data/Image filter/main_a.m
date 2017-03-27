clc, clear all
img = imread('thinker_gray_noised.jpg');



%----------------3X3-----------------------%
G3X3 = fspecial('gaussian', [3 3], 0.3);


for i = 1 : 638
    for j = 1 :478
        out = 0;
        for m = 0 : 2
            for n = 0 :2
                out = out + img(i+m,j+n)*G3X3(m+1, n+1);
            end
        end
        imgout3X3(i+1, j+1) = out;
    end
end


G9X9 = fspecial('gaussian', [9 9], 1);
for i = 1 : 632
    for j = 1 :472
        out = 0;
        for m = 0 : 8
            for n = 0 :8
                out = out + img(i+m,j+n)*G9X9(m+1, n+1);
            end
        end
        imgout9X9(i+4, j+4) = out;
    end
end

figure, imshow(imgout3X3)
figure, imshow(imgout9X9)

imwrite(imgout3X3,'output_main_a_3X3.jpg');
imwrite(imgout9X9,'output_main_a_9X9.jpg');