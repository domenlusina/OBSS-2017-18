function [ fsig ] = removeHum( sig, Fs, freq )
d = designfilt('bandstopiir','FilterOrder',2, ...
               'HalfPowerFrequency1',freq-1,'HalfPowerFrequency2',freq+1, ...
               'DesignMethod','butter','SampleRate',Fs);
%fvtool(d,'Fs',Fs);
fsig = filtfilt(d, sig);
end

