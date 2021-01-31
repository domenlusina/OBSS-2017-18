function [ P1 ] = powerSpectrum( sig )
    Y=fft(sig);
    L=length(sig);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);

end

