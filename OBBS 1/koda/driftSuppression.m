function [ fsig ] = driftSuppression( sig, Fs )
Fc = 2; % 2 Hz desired cut-off frequency
T = 1/Fs; % 1/(360Hz)= (sampling period)

c1 = 1/(1+tan(Fc*pi*T));
c2 = (1-tan(Fc*pi*T)) / (1+tan(Fc*pi*T));
b = c1*[1 -1];
a = [1 -c2];
fsig = filter(b, a, sig);
end

