function [psnr] = PSNR(imgin, imgout)
    mse = 0;
    for m = 1 : 360
        for n = 1:640
            mse = mse + (imgin(m,n,1)-imgout(m,n,1))^2;
            mse = mse + (imgin(m,n,2)-imgout(m,n,2))^2;
            mse = mse + (imgin(m,n,3)-imgout(m,n,3))^2;
        end
    end
    mse = mse/(360*640*3);
    psnr = 20 * log10(1) - 10 * log10(mse);
end