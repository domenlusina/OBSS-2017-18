function [ ffsig1 ] = butter2( sig1 )
    Fs = 20;
    Nr = length(sig1);
    f = 0:(Fs/Nr):Fs;

    lw = 1/(Fs/2);
    [b,a] = butter(4,lw,'high');

    figure;
    % Note non-linear phase
    freqz(b,a);

    % Forward filter
    fsig1 = filter(b,a,sig1);
    % Flip the result for backward filtering
    ffsig1 = flipud(fsig1);
    % And now filter again (backward)
    ffsig1 = filter(b,a,ffsig1);
    % Re-flip the signal (return to forward)
    ffsig1 = flipud(ffsig1);

end

