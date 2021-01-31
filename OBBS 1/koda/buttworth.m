function [ fsig ] = buttworth( sig, Fs )

d = designfilt('bandpassiir','FilterOrder',2, 'HalfPowerFrequency1',2,'HalfPowerFrequency2',35,'SampleRate',Fs);
fsig = filtfilt(d, sig);

end


