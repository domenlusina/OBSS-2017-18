function [ fsig ] = bandpass( sig, Fs )
Fn = Fs/2;                                          % Nyquist Frequency
Wp = [1.5  100]/Fn;                                 % Normalised Passband
Ws = [0.1  120]/Fn;                                 % Normalised Stopband
Rp = 20;                                            % Passband Ripple (dB)
Rs = 30;                                            % Stopband Ripple (dB)
[n,Wn] = buttord(Wp,Ws,Rp,Rs);                      % Filter Order
[b,a] = butter(n,Wn);                               % Filter Coefficients
[sos,g] = tf2sos(b,a);                              % Second-Order-Section For Stability
fsig = filtfilt(sos, g, sig);
end

