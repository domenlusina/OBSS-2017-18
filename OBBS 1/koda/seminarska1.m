
tic
allFiles = importdata('index.txt');
maxValues = [];
minValues = [];
threshold = 10;
for i=1:length(allFiles)
    allFiles(i);
    if allFiles(i)>0
        [ distances , maxNormal, minVert, data] = getDistances( num2str(allFiles(i)), threshold, true);     
         maxValues =[maxValues, maxNormal];
         minValues =[minValues, minVert];
    end
end
toc
