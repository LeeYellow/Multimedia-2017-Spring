function [imgY, imgI, imgQ] = YIQtransfer(imgR, imgG, imgB)
    matrix = [0.299, 0.587, 0.114; 0.596, -0.275, -0.321; 0.212, -0.523, 0.311];
    for m = 1 : 360
        for n = 1 : 640
            imgout = matrix * [imgR(m, n); imgG(m, n); imgB(m, n)];
            imgY(m, n) = imgout(1);
            imgI(m, n) = imgout(2);
            imgQ(m, n) = imgout(3);
        end
    end


end