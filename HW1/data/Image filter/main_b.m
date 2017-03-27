clc, clear all
img = imread('thinker_gray_noised.jpg');


%------------for 3X3 --------------%
imgout3X3 = img;
for i = 1 : 638
    for j = 1 :478
        flag = 1;
        for m = 0 : 2
            for n = 0 :2
                median(flag) = img(i+m, j+n);
                flag= flag+1;
            end
        end
        median = sort(median);
        imgout3X3(i+1, j+1) = median(5);
    end
end

%------------for 9X9 --------------%
imgout9X9 = img;
for i = 1 : 632
    for j = 1 :472
        flag = 1;
        for m = 0 : 8
            for n = 0 :8
                median(flag) = img(i+m, j+n);
                flag= flag+1;
            end
        end
        median = sort(median);
        imgout9X9(i+4, j+4) = median(41);
    end
end

figure, imshow(imgout3X3);
figure, imshow(imgout9X9);

imwrite(imgout3X3,'output_main_b_3X3.jpg');
imwrite(imgout9X9,'output_main_b_9X9.jpg');