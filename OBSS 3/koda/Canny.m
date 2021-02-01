function [ canny_res ] = Canny( I, tl, th )
[ gradY, gradX, Ismooth] = smoothing( I );
koti = atan2 (gradY, gradX);
koti = koti*180/pi;

ykoti = size(koti,1);
xkoti = size(koti,2);

%kote postavimo na interval 0-180 stopinj
for i=1:ykoti
    for j=1:xkoti
        if (koti(i,j)<0)
            koti(i,j)=360+koti(i,j);
        end
        if (koti(i,j)>=180)
            koti(i,j)=koti(i,j)-180;
        end
    end
end

koti2= zeros(ykoti, xkoti);

for i=1:xkoti
    for j= 1:ykoti
        if koti(i,j)<=22.5 || 157.5<koti(i,j)
            koti2(i,j) = 0;
        elseif 22.5<koti(i,j)<=67.5
            koti2(i,j) = 45;
        elseif 67.5<koti(i,j)<=112.5
            koti2(i,j) = 90;
        elseif 112.5<koti(i,j)<=157.5
            koti2(i,j) = 135;
        end
    end
end

M = sqrt((gradY.^2)+(gradX.^2));
 res  = nonmaximasupression( M, koti2);

canny_res  = hysteresis( res, tl, th);


end

