function [img2Dout] = inverseDCT(img2D, pq)

img2Dout = zeros(360,640);
for r = 1 : 8 : 360
    for c = 1 : 8 : 640
        for m = 0 : 7
            for n = 0: 7
                out = 0;
                for p = 0 : (pq-1)
                    for q = 0 : (pq-1)
                        if p == 0
                            ap = 1/sqrt(8);
                        else
                            ap = sqrt(2/8);
                        end
                        if q == 0
                            aq = 1/sqrt(8);
                        else
                            aq = sqrt(2/8);
                        end
                        out = out + ap*aq*img2D(r+p,c+q)*cos(pi*(2*m+1)*p/16)*cos(pi*(2*n+1)*q/16);
                    end
                end
                img2Dout(r+m,c+n) = out;
            end
        end
    end
end
end