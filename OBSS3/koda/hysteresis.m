function [ res ] = hysteresis( I, tl, th)
    res = zeros(size(I,1),size(I,2));
    maxv=max(max(I));
    tl = tl * maxv;
    th = th * maxv;
    for i = 1:size(I,1)
        for j = 1:size(I,2)
            if I(i,j)< tl
                res(i,j) = 0;
            elseif I(i,j)>th
                res(i,j) = 1;
            else
                for offi=-1:1
                    for offj=-1:1
                        if (offj~=0 || offi~=0) && I(i+offi,j+offj)>th
                            res(i,j) = 1;
                        end
                    end
                end
            end
        end
    end
end

