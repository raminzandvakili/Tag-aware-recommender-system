clc;
clear;
addpath(genpath('../functions'))
fileName = 'movieLens10k';
N_u = 50;
MaxListSize = 200;

load(strcat('..\builtDataFiles\' , fileName, '\a3FourLayerNetwork.mat'));
load(strcat('..\builtDataFiles\' , fileName, '\testAndTrainData.mat'));

m = size(tagTestTable(2 : end , 2 : end) , 1);
topHeader = itemTestTable(1, 2 : end);

fourLayerNetsystemPercision = zeros(1,1);
fourLayerNetsystemRecall = zeros(1,1);
fourLayerNetsystemFMeasure = zeros(1,1);
fourLayerNetsystemAccuracy = zeros(1,1);
fourLayerNetsystemRmse = zeros(1,1);


for listSize = 1:5:MaxListSize
    listSize
    percision = zeros(m, 1);
    recall = zeros(m, 1);
    rmse = zeros(m, 1);
    accuracy = zeros(m, 1);
    fMeasure = zeros(m, 1);

    for i = 1 : m
       [recommendationList , recommendationVector] = recommendToUser...
           ( test2a3FourLayerNet(:, i) , train2a3FourLayerNet, itemTrainTable(2:end, 2:end) , N_u, listSize, itemTrainTable(1, 2:end));
       [ rmse(i) , percision(i) , recall(i) , accuracy(i) , fMeasure(i) ] = computeErrors(itemTestTable(i+1,2:end)  , recommendationVector);
    end

    fourLayerNetsystemPercision(end+1,1) = mean(percision);
    fourLayerNetsystemRecall(end+1,1) = mean(recall);
    fourLayerNetsystemAccuracy(end+1, 1) = mean(accuracy);
    fourLayerNetsystemFMeasure(end+1, 1) = mean(fMeasure);
    fourLayerNetsystemRmse(end+1,1) = mean(rmse);

end

save(strcat('..\builtDataFiles\' , fileName, '\fourLayerNetAnalysis.mat') , ... 
'fourLayerNetsystemPercision' , 'fourLayerNetsystemRecall' , 'fourLayerNetsystemAccuracy' , ...
'fourLayerNetsystemFMeasure' , 'fourLayerNetsystemRmse');
