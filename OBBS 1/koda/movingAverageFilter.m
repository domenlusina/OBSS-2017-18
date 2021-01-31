function [ fsig ] = movingAverageFilter( sig, M )
    b=1/M*ones(1,M);
    a=1;
    fsig = filter(b,a,sig);

end

