% The buildModelHiddenLayer1 Module Trains The Model with 3 hidden layer?, And Computes The OPtimized Lambda And Betha
% In The Cost Function. In The End It Build A Transformation For Data Based
% On Computed Weights.
rng default;
clear; clc; close all;

%Prapare Modeling Data
addpath(genpath('../functions'))
dataFileName = 'lastfm';
load(strcat( '..\builtDataFiles\', dataFileName, '\testAndTrainData.mat'), 'tagTrainTable' );
data = tagTrainTable(2 : end, 2 : end)';

visibleSize = size(data, 1);  % number of input units 
hiddenSize = 1000;   % number of hidden units 
sparsityParam = 0.1; % desired average activation of the hidden units.
                     % (This was denoted by the Greek alphabet rho, which looks like a lower-case "p",
                     %  in the lecture notes). 
lambda = 0.001;          % weight decay parameter       
beta = 3;            % weight of sparsity penalty term
maxNumberOfIter = 200;
method = 'lbfgs';

% Compute Theta
theta = initializeParameters(hiddenSize, visibleSize);
theta = TrainFunction(data, theta, visibleSize, hiddenSize, sparsityParam, lambda, beta, maxNumberOfIter, method);

% Transform Train Data
[train2a2ThreeLayerNet , train2a3ThreeLayerNet] = transformData( data , theta , visibleSize , hiddenSize );


% Transform Test Data
load(strcat( '..\builtDataFiles\', dataFileName, '\testAndTrainData.mat'), 'tagTestTable' );
testData = tagTestTable(2:end, 2:end)';
[test2a2ThreeLayerNet , test2a3ThreeLayerNet] = transformData( testData , theta , visibleSize , hiddenSize );

% saving train2a2 & test2a2 for the recommendation module input
saveFolderPath = strcat('..\builtDataFiles\' , dataFileName ,...
    '\Lambda' , num2str(lambda) , 'Beta' , num2str(beta) , 'SP' , num2str(sparsityParam) ,...
    'HS' , num2str(hiddenSize) , 'MI' , num2str(maxNumberOfIter) , 'Method' , method);
mkdir(saveFolderPath);
save(strcat(saveFolderPath , '\a2ThreeLayerNetwork.mat') , 'train2a2ThreeLayerNet', 'test2a2ThreeLayerNet');

% Compute Errors
[ rmseTrain , percisionTrain , recallTrain , accuracyTrain , fMeasureTrain ] =...
    computeErrors( data , train2a3ThreeLayerNet );

[ rmseTest , percisionTest , recallTest , accuracyTest , fMeasureTest ] =...
    computeErrors( testData , test2a3ThreeLayerNet );

save( strcat( saveFolderPath , '\TrainThreeLayerNet.mat' ) );