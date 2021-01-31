function [ avg_sig ] = getAvgNormalHB( ann, sig, Fs )
    time = 60*Fs ;
    indecies = ann.textdata(:,2);
    typeHB = ann.textdata(:,3);
    
    j=0;
    for i=1:length(indecies)
        tmpInd = indecies(i);
        tmpTyp = typeHB(i);
        if tmpTyp{1}=='N'
            if j<100
                j = j+1;
            else
                break;
            end
        end
    end
    HBpositions = zeros([j 1]);
    z=1;
    for i = 1:length(indecies) 
        tmpInd = indecies(i);
        tmpTyp = typeHB(i);
        if tmpTyp{1}=='N'
            if z < 100
                HBpositions(z) = str2num(tmpInd{1});
                z = z+1;
            end
        end
    end
    if j ==0
        avg_sig = [];
    else
        avg_sig = zeros(1, 59);
        odsekani = 0;
        for i = 1 : j
            [ extracted_sig, izjema1, izjema2 ] = getSignal( sig, HBpositions(i) ,Fs);
            if ~izjema1 & ~izjema2
                avg_sig= avg_sig +  extracted_sig;
            else
                odsekani = odsekani+1;
            end
        end
        avg_sig=avg_sig/(j-odsekani);
    end
    
end

