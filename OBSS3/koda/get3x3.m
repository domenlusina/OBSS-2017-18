function [ res ] = get3x3( I,j,i)
    % 1 2 3
    % 4   5
    % 6 7 8

    X=[-1  0  1 -1 1 -1 0 1];
    Y=[-1 -1 -1  0 0  1 1 1];
    [row col] = size(I);
    fields=0;
    for z=1:8
        newX = i+X(z);
        newY = j+Y(z);
        if col>=newX && newX >0 && row>=newY && newY >0
            fields = fields+1;
        end
    end
    
    res = zeros(fields,2);
    f=1;
    for z = 1:8
        newX = i+X(z);
        newY = j+Y(z);
        if col>=newX && newX >0 && row>=newY && newY >0
            res(f,:)=[newY newX];
            f=f+1;
        end
    end


end

