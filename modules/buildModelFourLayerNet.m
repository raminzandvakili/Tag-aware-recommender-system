% The buildModelHiddenLayer1 Module Trains The Model with 2 hidden layer?, And Computes The OPtimized Lambda And Betha
% In The Cost Function. In The End It Build A Transformation For Data Based
% On Computed Weights.
rng default;
clear; clc; close all;

%Prapare Modeling Data
addpath(genpath('../functions'))
dataFileName = 'movieLens10k';
load(strcat( '..\builtDataFiles\', dataFileName, '\a2ThreeLayerNetwork.mat') );
data = train2a2ThreeLayerNet;

visibleSize = size(data, 1);  % number of input units 
hiddenSize = 800;   % number of hidden units 
sparsityParam = 0.1; % desired average activation of the hidden units.
                     % (This was denoted by the Greek alphabet rho, which looks like a lower-case "p",
                     %  in the lecture notes). 
lambda = 0;          % weight decay parameter       
beta = 3;            % weight of sparsity penalty term 

% Compute Theta
theta = initializeParameters(hiddenSize, visibleSize);
theta = TrainFunction(data, theta, visibleSize, hiddenSize, sparsityParam, lambda, beta);

% Transform Train Data
[train2a3FourLayerNet , ~] = transformData( data , theta , visibleSize , hiddenSize );

% Transform Test Data
[test2a3FourLayerNet , ~] = transformData( test2a2ThreeLayerNet , theta , visibleSize , hiddenSize );

% saving train2a2 & test2a2 for the recommendation module input
save(strcat('..\builtDataFiles\' , dataFileName , '\a3FourLayerNetwork.mat') , 'train2a3FourLayerNet', 'test2a3FourLayerNet');

