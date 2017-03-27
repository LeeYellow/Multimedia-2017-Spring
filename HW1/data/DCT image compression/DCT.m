function [img2Dout] = DCT(img2D,pq)
    
img2Dout(:,:) = 0;
for r = 1 : 8 : 360
    for c = 1 : 8 : 640
        for p = 0 : (pq-1)
            for q = 0: (pq-1)
                out = 0;
                for m = 0 : 7
                    for n = 0 : 7
                        out = out + img2D(r+m,c+n)*cos(pi*(2*m+1)*p/16)*cos(pi*(2*n+1)*q/16);
                    end
                end
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
                img2Dout(r+p,c+q) = ap*aq*out;
            end
        end
    end
end
end
