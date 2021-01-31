function [ fsig ] = lowPassFilter(  sig, Fs  )
    hwFreq = 35/(Fs/2);
    n=20;
    b = fir1(n, hwFreq, 'low');
    fsig = filter(b, 1, sig);
end

