function [p1,p2,p3,p4,p5,p6] = getP( entropyTE, entropyTL, entropyPE, entropyPL, N )
    [ ~, p1]=ttest2(entropyTE(:,N),entropyPE(:,N));
    [ ~, p2]=ttest2(entropyTL(:,N),entropyPL(:,N));
    [ ~, p3]=ttest2(entropyPE(:,N),entropyPL(:,N));
    [ ~, p4]=ttest2(entropyTE(:,N),entropyTL(:,N));
    [ ~, p5]=ttest2([entropyTE(:,N);entropyPE(:,N)],[entropyTL(:,N);entropyPL(:,N)]);
    [ ~, p6]=ttest2([entropyTE(:,N);entropyTL(:,N)],[entropyPE(:,N);entropyPL(:,N)]);
   
end

