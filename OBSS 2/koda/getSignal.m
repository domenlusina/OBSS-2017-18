function [ fsig ] = getSignal( name, N)
    Fs=20;
    fullname=strcat(name(:)','m.mat');
    val = load(fullname);
    sig = val.val(N,:);
    tcut= 180;
    fsig=sig(tcut*Fs+1:end-tcut*Fs);
    
end

