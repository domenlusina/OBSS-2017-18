function [ d, entropyTE, entropyTL, entropyPE, entropyPL ] = getAllSampEn(N)
    [ d, te, tl, pe, pl ] = getRecClasses;
    
    entropyTE = getSampEn( te, N );
    entropyTL = getSampEn( tl, N );
    entropyPE = getSampEn( pe, N );
    entropyPL = getSampEn( pl, N );

end

