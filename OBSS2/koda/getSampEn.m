function [ res ] = getSampEn( group, N )


noElements = size(group, 1);
res = zeros(noElements, 11);
parfor i=1:noElements
    sig = getSignal(group(i,:), N);
    res(i,:) = sampen(sig, 11, 0.15,1,0,0);
end


end

