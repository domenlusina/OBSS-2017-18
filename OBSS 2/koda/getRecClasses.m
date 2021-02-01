function [ d, te, tl, pe, pl ] = getRecClasses
    %funkcija, ki prebere tpehgdb.smr tekstovno datoteko in vrne
    % MATLAB struct s polji record, gestation, rectime, early, premature

    fid = fopen('tpehgdb.smr');
    data = textscan(fid,'%s %s %s %s %s %s','delimiter','|');
    
    for i=1:length(data)
        tmp=data{i};
        data{i}=tmp(3:end);
    end
    
    tmp=cell2mat(data{1});
    d.record=tmp(:,:);
    tmp=str2num(cell2mat(data{2}));
    d.gestation = tmp;
    tmp=str2num(cell2mat(data{3}));
    d.rectime = tmp;
    
    premature=zeros(length(data{1}),1);
    early=zeros(length(data{1}),1);
    tmp1=data{5};
    tmp2=data{6};
    te = [];
    tl = [];
    pe = [];
    pl = [];
    for i=1:length(early)
        isPremature=cell2mat(tmp1(i,1));
        if isPremature(1)=='t'
            premature(i) = 1;
        else
             premature(i) = 0;
        end
        
        if cell2mat(tmp2(i))=='t'
            early(i) = 1;
            if premature(i) == 1
                pe = [pe; d.record(i,:)];
            else
                te = [te; d.record(i,:)];
            end
            
        else
             early(i) = 0;
             if premature(i) == 1
                pl = [pl; d.record(i,:)];
            else
                tl = [tl; d.record(i,:)];
            end
        end
        
    end
    d.early = early;
    d.premature = premature;
    fclose(fid);
end

