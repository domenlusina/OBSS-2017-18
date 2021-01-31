function [ gradY, gradX, Ismooth] = smoothing( I )
    
    
    se = strel('disk',8);
    I = padarray(I,[50 50],'both');
    I = imclose(I,se);
    I = I(50+1:end-50,50+1:end-50);
    
    kernal = fspecial('gaussian', 13, 4);
   
    Ismooth= conv2(double(I),double(kernal), 'same');
    sobelX = [-1 0 1;
              -2 0 2; 
              -1 0 1];
    sobelY = [1  2  1;
              0  0  0; 
             -1 -2 -1];
    I = I(50+1:end-50,50+1:end-50);
    gradX= conv2(double(Ismooth),double(sobelX), 'same');
    gradY= conv2(double(Ismooth),double(sobelY), 'same');
end

