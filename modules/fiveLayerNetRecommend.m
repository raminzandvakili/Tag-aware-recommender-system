clc;
%clear;
addpath(genpath('../functions'))
fileName = 'movieLens10k';
N_u = 50;
MaxListSize = 200;

load(strcat('..\builtDataFiles\' , fileName, '\a4FiveLayerNetwork.mat'));
load(strcat('..\builtDataFiles\' , fileName, '\testAndTrainData.mat'));

m = size(tagTestTable(2:end, 2:end), 1) ;
topHeader = itemTestTable(1, 2 : end);

fiveLayerNetsystemPercision = zeros(1,1);
fiveLayerNetsystemRecall = zeros(1,1);
fiveLayerNetsystemFMeasure = zeros(1,1);
fiveLayerNetsystemAccuracy = zeros(1,1);
fiveLayerNetsystemRmse = zeros(1,1);


for listSize = 1:5:MaxListSize
    listSize
    percision = zeros(m, 1);
    recall = zeros(m, 1);
    rmse = zeros(m, 1);
    accuracy = zeros(m, 1);
    fMeasure = zeros(m, 1);

    for i = 1 : m
       [recommendationList , recommendationVector] = recommendToUser...
           ( test2a4FiveLayerNet(:, i) , train2a4FiveLayerNet, itemTrainTable(2:end, 2:end) , N_u, listSize, itemTrainTable(1, 2:end));
       [ rmse(i) , percision(i) , recall(i) , accuracy(i) , fMeasure(i) ] = computeErrors(itemTestTable(i+1,2:end)  , recommendationVector);
    end

    fiveLayerNetsystemPercision(end+1,1) = mean(percision);
    fiveLayerNetsystemRecall(end+1,1) = mean(recall);
    fiveLayerNetsystemAccuracy(end+1, 1) = mean(accuracy);
    fiveLayerNetsystemFMeasure(end+1, 1) = mean(fMeasure);
    fiveLayerNetsystemRmse(end+1,1) = mean(rmse);

end

save(strcat('..\builtDataFiles\' , fileName, '\fiveLayerNetAnalysis.mat') , ... 
'fiveLayerNetsystemPercision' , 'fiveLayerNetsystemRecall' , 'fiveLayerNetsystemAccuracy' , ...
'fiveLayerNetsystemFMeasure' , 'fiveLayerNetsystemRmse');
