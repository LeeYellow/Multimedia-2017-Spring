clc, clear all
img = imread('lalaland.png');
img = im2double(img);

%-----------------n=2-------------------%
imgDCTR2 = DCT(img(:, :, 1), 2);
imgDCTG2 = DCT(img(:, :, 2), 2);
imgDCTB2 = DCT(img(:, :, 3), 2);

imginverseR2 = inverseDCT(imgDCTR2(:, :),2);
imginverseG2 = inverseDCT(imgDCTG2(:, :),2);
imginverseB2 = inverseDCT(imgDCTB2(:, :),2);

imgout2(:,:,1) = imginverseR2;
imgout2(:,:,2) = imginverseG2;
imgout2(:,:,3) = imginverseB2;


%-----------------n=4-------------------%
imgDCTR4 = DCT(img(:, :, 1), 4);
imgDCTG4 = DCT(img(:, :, 2), 4);
imgDCTB4 = DCT(img(:, :, 3), 4);

imginverseR4 = inverseDCT(imgDCTR4(:, :),4);
imginverseG4 = inverseDCT(imgDCTG4(:, :),4);
imginverseB4 = inverseDCT(imgDCTB4(:, :),4);

imgout4(:,:,1) = imginverseR4;
imgout4(:,:,2) = imginverseG4;
imgout4(:,:,3) = imginverseB4;


%-----------------n=8-------------------%
imgDCTR8 = DCT(img(:, :, 1), 8);
imgDCTG8 = DCT(img(:, :, 2), 8);
imgDCTB8 = DCT(img(:, :, 3), 8);

imginverseR8 = inverseDCT(imgDCTR8(:, :),8);
imginverseG8 = inverseDCT(imgDCTG8(:, :),8);
imginverseB8 = inverseDCT(imgDCTB8(:, :),8);

imgout8(:,:,1) = imginverseR8;
imgout8(:,:,2) = imginverseG8;
imgout8(:,:,3) = imginverseB8;





psnr2 = PSNR(img, imgout2);
psnr4 = PSNR(img, imgout4);
psnr8 = PSNR(img, imgout8);

figure, imshow(imgout2);
figure, imshow(imgout4);
figure, imshow(imgout8);

imwrite(imgout2,'output_main_a_n=2.jpg');
imwrite(imgout4,'output_main_a_n=4.jpg');
imwrite(imgout8,'output_main_a_n=8.jpg');

disp(psnr2);
disp(psnr4);
disp(psnr8);

