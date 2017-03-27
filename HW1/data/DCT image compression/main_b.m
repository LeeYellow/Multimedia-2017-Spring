clc, clear all
img = imread('lalaland.png');
img = im2double(img);

imgR = img(:, :, 1);
imgG = img(:, :, 2);
imgB = img(:, :, 3);

[imgY, imgI, imgQ] = YIQtransfer(imgR, imgG, imgB);

%------------------n = 2-------------------------%
imgDCTY2 = DCT(imgY, 2);
imgDCTI2 = DCT(imgI, 2);
imgDCTQ2 = DCT(imgQ, 2);

imginverseY2 = inverseDCT(imgDCTY2(:, :),2);
imginverseI2 = inverseDCT(imgDCTI2(:, :),2);
imginverseQ2 = inverseDCT(imgDCTQ2(:, :),2);

[imginverseR2, imginverseG2, imginverseB2] = RGBtransfer(imginverseY2, imginverseI2, imginverseQ2);

imgout2(:,:,1) = imginverseR2;
imgout2(:,:,2) = imginverseG2;
imgout2(:,:,3) = imginverseB2;


%------------------n = 4-------------------------%
imgDCTY4 = DCT(imgY, 4);
imgDCTI4 = DCT(imgI, 4);
imgDCTQ4 = DCT(imgQ, 4);

imginverseY4 = inverseDCT(imgDCTY4(:, :),4);
imginverseI4 = inverseDCT(imgDCTI4(:, :),4);
imginverseQ4 = inverseDCT(imgDCTQ4(:, :),4);

[imginverseR4, imginverseG4, imginverseB4] = RGBtransfer(imginverseY4, imginverseI4, imginverseQ4);

imgout4(:,:,1) = imginverseR4;
imgout4(:,:,2) = imginverseG4;
imgout4(:,:,3) = imginverseB4;


%------------------n = 8-------------------------%
imgDCTY8 = DCT(imgY, 8);
imgDCTI8 = DCT(imgI, 8);
imgDCTQ8 = DCT(imgQ, 8);

imginverseY8 = inverseDCT(imgDCTY8(:, :),8);
imginverseI8 = inverseDCT(imgDCTI8(:, :),8);
imginverseQ8 = inverseDCT(imgDCTQ8(:, :),8);

[imginverseR8, imginverseG8, imginverseB8] = RGBtransfer(imginverseY8, imginverseI8, imginverseQ8);

imgout8(:,:,1) = imginverseR8;
imgout8(:,:,2) = imginverseG8;
imgout8(:,:,3) = imginverseB8;


psnr2 = PSNR(img, imgout2);
psnr4 = PSNR(img, imgout4);
psnr8 = PSNR(img, imgout8);

figure, imshow(imgout2);
figure, imshow(imgout4);
figure, imshow(imgout8);

imwrite(imgout2,'output_main_b_n=2.jpg');
imwrite(imgout4,'output_main_b_n=4.jpg');
imwrite(imgout8,'output_main_b_n=8.jpg');

disp(psnr2);
disp(psnr4);
disp(psnr8);