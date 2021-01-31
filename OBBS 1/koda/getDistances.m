function [ distances , maxNormal, minVert, data] = getDistances( HBindex, threshold, write)
    Fs= 360;
    
    val = load(strcat(HBindex, 'm.mat'));
    val = val.val;
    sig = val(1,:);
    sig = filterSig( sig, Fs );
    
    filename = strcat(HBindex,'fann.txt');
    [ann] = importdata(filename);
    
    avg_sig  = getAvgNormalHB( ann, sig, Fs );
    typeHB = ann.textdata(:,3);
    indecies = ann.textdata(:,2);
    times = ann.textdata(:,1);
    noPulses = length(indecies) ;
    distances = zeros([noPulses ,1]);
    maxNormal = 0;
    minVert = 10000;
    for i= 1:noPulses
        tmpInd = indecies(i);
        tmpTyp = typeHB(i);
        minDistance = 1000000;
        for shift = 0:0
            [ sig2, izjema1, izjema2 ] = getSignal(sig, str2num(tmpInd{1})+shift, Fs);
            tmpDistance =  computeDistance( avg_sig(1:length(sig2)), sig2, 'L2');
            if  tmpDistance<minDistance
               minDistance = tmpDistance;
            end
        end
        distances(i) = minDistance;
        if tmpTyp{1}=='N'
            if maxNormal< distances(i)
                maxNormal = distances(i);
            end
        elseif tmpTyp{1}=='V'
            if minVert > distances(i)
                minVert = distances(i);
            end
        end
    end
    data = [];
    if write
         formatSpec = '%12s %8s %5s %4d %4d %4d\r\n';
         fileID = fopen(strcat('mitdb/',HBindex, '.asc'),'w');
         data = cell(noPulses, 6);
         for i=1:noPulses
             type = 'N';
             N = 0;
             if distances(i)>threshold
                 type= 'V';
                 N = 1;
             end
             tmpTime = times(i);
             tmpIndex = indecies(i);
             data(i,:)={tmpTime{1},tmpIndex{1},type,N,0,0};
             d = data(i,:);
             fprintf(fileID,formatSpec,d{:});
         end
         fclose(fileID);
    end
    
end

