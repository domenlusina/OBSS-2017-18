function [ D ] = computeDistance( sig1, sig2, type)
switch type 
    case 'L2'
        D  = sqrt(sum((sig1 - sig2) .^ 2))/length(sig1);
    case 'L1'
        D  = sum(sig1 - sig2)/length(sig1);
    case 'inf'
        D  = max(sig1 - sig2);
    otherwise
        D  = sqrt(sum((sig1 - sig2) .^ 2))/length(sig1);
end

