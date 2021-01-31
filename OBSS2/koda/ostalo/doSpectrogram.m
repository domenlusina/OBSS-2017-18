function doSpectrogram(x, Fs, nF) %nF should be a number of a power of two 

Nr = length(x);	% Length of signal in samples

t = (0:Nr-1)/Fs;		% Vector of times
f = ((0:Nr-1)/Nr)*Fs;	% Vector of frequencies

% --- USING INTEGRATED FUNCTIONS ---
% nF/s - overlap - experiment with s=0, nF/4, nF/2, and nF-1
overlap = nF/2;
[B,fr,tm] = spectrogram(x,hanning(nF),overlap,nF,Fs); % FOR MATLAB
%[B,fr,tm] = specgram(x,nF,Fs,hanning(nF),overlap); % FOR OCTAVE (but requires signal package)

% Now draw the spectrogram using logarithmic scale, note that 10*log10(B.^2/nF) = 10*2*log10(abs(B)/nF),
% i.e. plot the power spectrum calculated from the SFFT (short-time FFT)
figure;
imagesc(tm,fr,20*log10(abs(B)/nF));
set(gca,'YDir','normal');
xlabel('Time');
ylabel('Frequency');
title('Spectrogram');

% Now experiment with different window durations to see the effect of using shorter
% or longer fft lengths, and also experiment with different overlaps
end









