function [ newI1 ] = connectivity24( I1,I2 )
    [row, col] = size(I1);
    newI1=I1;
    for i = 1:row
        for j=1:col
            if I1(i,j)==1
                if I2(i,j)==0
                    neigh3x3= get3x3(I2,i,j);
                    pogoj1=1;
                    for k=1:size(neigh3x3,1)
                        if I2(neigh3x3(k,1),neigh3x3(k,2))==1
                            pogoj1=0;
                        end
                    end
                    
                    if pogoj1
                        pogoj2 = 0;
                        neigh5x5= get5x5(I2,i,j);
                        for k=1:size(neigh5x5,1)
                            if I2(neigh5x5(k,1),neigh5x5(k,2))==1
                                pogoj2 = 1;
                            end
                        end
                        if pogoj2
                            for k=1:size(neigh5x5,1)
                                if I2(neigh5x5(k,1),neigh5x5(k,2))==1
                                    coord = int16((neigh5x5(k,:)+[i,j]+0.01)/2);
                                    newI1(coord(1),coord(2))=1;
                                    coord = int16((neigh5x5(k,:)+[i,j]-0.01)/2);
                                    newI1(coord(1),coord(2))=1;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end


