clc, clear all
img = imread('img_LR.png');
img_original = imread('img_HR.png');
img = im2double(img);
img_original = im2double(img_original);

imgR = img(:, :, 1);
imgG = img(:, :, 2);
imgB = img(:, :, 3);


imgRout = amplify(imgR);
imgGout = amplify(imgG);
imgBout = amplify(imgB);

imgout(:,:,1) = imgRout;
imgout(:,:,2) = imgGout;
imgout(:,:,3) = imgBout;

psnr = PSNR(imgout, img_original);

imshow(imgout)
disp(psnr)
imwrite(imgout,'output_main_a.jpg');