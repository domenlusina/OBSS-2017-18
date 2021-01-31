function [ extracted_sig, izjema1, izjema2 ] = getSignal( sig, index, Fs)
    Neg = -int32(60/1000 * Fs);
    Pos = int32(100/1000 * Fs);
    
    izjema1 = false;
    izjema2 = false;
    
    spodnjaMeja = index + Neg;
    zgornjaMeja = index + Pos;
    if zgornjaMeja>length(sig)
        zgornjaMeja=length(sig);
        izjema1= true;
    end
    
    if spodnjaMeja<1
        spodnjaMeja=1;
        izjema2=true;
    end
    extracted_sig= sig(spodnjaMeja:zgornjaMeja);
    
    %{
    izjema1 = false;
    izjema2 = false;
    l = Pos-Neg;
    if index +Pos < length(sig)
        zgornjaMeja =  index +Pos;
    else
        zgornjaMeja = length(sig);
        izjema1 = true;
    end
    
    if index + Neg < 1
        spodnjaMeja =  index + Neg;
    else
        spodnjaMeja = 1;
        izjema2 = true;
    end
    
    extracted_sig= sig(spodnjaMeja:zgornjaMeja);
    
    if izjema1
        extracted_sig = [zeros([1,l-(zgornjaMeja-spodnjaMeja)]), extracted_sig];
    elseif izjema2 
        extracted_sig = [extracted_sig, zeros([1,l-(zgornjaMeja-spodnjaMeja)])];
    end
    %}
end

