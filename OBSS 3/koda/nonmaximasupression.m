function [ res ] = nonmaximasupression( M, koti )
    res = zeros(size(M,1),size(M,2));
    for i=2:size(res,1)-1
        for j=2:size(res,2)-1
            if koti(i,j)== 45
                res(i,j)= (M(i,j)==max([M(i,j),M(i+1,j-1),M(i-1,j+1)]));
            elseif koti(i,j)== 90
                res(i,j)= (M(i,j)==max([M(i,j),M(i-1,j),M(i+1,j)]));
            elseif koti(i,j)== 135
                res(i,j)= (M(i,j)==max([M(i,j),M(i+1,j+1),M(i-1,j-1)]));
            else
                res(i,j)= (M(i,j)==max([M(i,j),M(i,j-1),M(i,j+1)]));
            end
        end
    end
    res = res.*M;


end

