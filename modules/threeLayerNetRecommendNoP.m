clc;
clear;
addpath(genpath('../functions'))
dataFileName = 'lastfm';

% model features
hiddenSize = 1000;   % number of hidden units 
sparsityParam = 0.1; % desired average activation of the hidden units.
                     % (This was denoted by the Greek alphabet rho, which looks like a lower-case "p",
                     %  in the lecture notes). 
lambda = 0;          % weight decay parameter       
beta = 3;            % weight of sparsity penalty term
maxNumberOfIter = 200;
method = 'lbfgs';

saveFolderPath = strcat('..\builtDataFiles\' , dataFileName ,...
    '\Lambda' , num2str(lambda) , 'Beta' , num2str(beta) , 'SP' , num2str(sparsityParam) ,...
    'HS' , num2str(hiddenSize) , 'MI' , num2str(maxNumberOfIter) , 'Method' , method);

N_u = 90;
MaxListSize = 200;

load(strcat(saveFolderPath , '\a2ThreeLayerNetwork.mat'));
load(strcat('..\builtDataFiles\' , dataFileName, '\testAndTrainData.mat'));

m = size(tagTestTable(2 : end , 2 : end) , 1);
topHeader = itemTestTable(1, 2 : end);

threeLayerNetsystemPercision = zeros(1,1);
threeLayerNetsystemRecall = zeros(1,1);
threeLayerNetsystemFMeasure = zeros(1,1);
threeLayerNetsystemAccuracy = zeros(1,1);
threeLayerNetsystemRmse = zeros(1,1);


for listSize = 1:5:MaxListSize
    listSize
    percision = zeros(m, 1);
    recall = zeros(m, 1);
    rmse = zeros(m, 1);
    accuracy = zeros(m, 1);
    fMeasure = zeros(m, 1);

    for i = 1 : m
       [recommendationList , recommendationVector] = recommendToUser...
           ( test2a2ThreeLayerNet(:, i) , train2a2ThreeLayerNet, itemTrainTable(2:end, 2:end) , N_u, listSize, itemTrainTable(1, 2:end));
       [ rmse(i) , percision(i) , recall(i) , accuracy(i) , fMeasure(i) ] = computeErrors(itemTestTable(i+1,2:end)  , recommendationVector);
    end

    threeLayerNetsystemPercision(end+1,1) = mean(percision);
    threeLayerNetsystemRecall(end+1,1) = mean(recall);
    threeLayerNetsystemAccuracy(end+1, 1) = mean(accuracy);
    threeLayerNetsystemFMeasure(end+1, 1) = mean(fMeasure);
    threeLayerNetsystemRmse(end+1,1) = mean(rmse);

end

save(strcat(saveFolderPath , '\threeLayerNetAnalysis.mat') , ... 
'threeLayerNetsystemPercision' , 'threeLayerNetsystemRecall' , 'threeLayerNetsystemAccuracy' , ...
'threeLayerNetsystemFMeasure' , 'threeLayerNetsystemRmse');
