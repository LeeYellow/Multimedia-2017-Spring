function [imgR, imgG, imgB] = RGBtransfer(imgY, imgI, imgQ)
    matrix = [0.299, 0.587, 0.114; 0.596, -0.275, -0.321; 0.212, -0.523, 0.311];
    inversematrix = inv(matrix);
    for m = 1 : 360
        for n = 1 : 640
            imgout = inversematrix * [imgY(m, n); imgI(m, n); imgQ(m, n)];
            imgR(m, n) = imgout(1);
            imgG(m, n) = imgout(2);
            imgB(m, n) = imgout(3);
        end
    end


end