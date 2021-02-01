function displaySignal( name, N )
    sig1 = getSignal( name, N );
    sig2 = getSignal( name, N+4 );
    sig3= getSignal( name, N+8 );
    
    
    figure;
    subplot(3,1,1);plot(sig1);
    subplot(3,1,2);plot(sig2);
    subplot(3,1,3);plot(sig3);

end

