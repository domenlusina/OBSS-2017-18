function [ sig ] = filterSig( sig,Fs)
    sig = driftSuppression(sig, Fs);
    sig = removeHum(sig,Fs , 60);
    %sig = buttworth(sig, Fs);
    %sig = bandpass(sig, Fs);
    
    %sig = lowPassFilter(sig,Fs);
    %sig = movingAverageFilter(sig, 3);
    
   
end

