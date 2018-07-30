%%%%%%%%%% Prepare Data %%%%%%%%%%
%%This module saves user-tag and user-movie test and train tables

clc; clear;
rng default;
addpath ..\functions\

%%%%%%%%% VARIABLES %%%%%%%%%
dataFileName = 'movieLens10k';
dataFileExtension = '.txt';
minNumberOfTagFrequency = 4;
testRatio = 0.2;

%%%%%%%%%% MAKE TEST AND TRAIN TABLES %%%%%%%%%%
[tagTrainTable, tagTestTable, itemTrainTable, itemTestTable] = ...
    SelectTestAndTrain(dataFileName, dataFileExtension, testRatio, minNumberOfTagFrequency);

save(strcat('../builtDataFiles/' , dataFileName , '/testAndTrainData.mat'));





