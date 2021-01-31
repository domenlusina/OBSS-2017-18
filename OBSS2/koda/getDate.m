function [ datumi ] = getDate( d, group )
    dol = size(group,1);
    datumi = zeros(dol,1);
    
   for i=1:dol
       [~ , index]=ismember(group(i,:),d.record(),'rows');
       datumi(i) = d.rectime(index);
   end
    

end

