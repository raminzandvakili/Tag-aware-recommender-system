clc;
clear;
addpath(genpath('../functions'))
fileName = 'movieLens10k';

load(strcat('..\builtDataFiles\' , fileName, '\a2ThreeLayerNet'))

load ('..\builtDataFiles\movieLens10kMovieTrainTable.mat')
load ('..\builtDataFiles\movieLens10kMovieTestTable.mat')
load ('..\builtDataFiles\movieLens10kTagTrainTable.mat')
load ('..\builtDataFiles\movieLens10kTagTestTable.mat')


N_u = 50;
m = size(tagTestTable(2 : end , 2 : end) , 1);
topHeader = movieTestTable(1, 2 : end);

systemPercision = zeros(1,1);
systemRecall = zeros(1,1);

CFSystemPersision = zeros(1,1);
CFSystemRecall = zeros(1,1);

hPercision = zeros(1,1);
hRecall = zeros(1,1);
hFMeasure = zeros(1,1);
hRmse = zeros(1,1);
hAccuracy = zeros(1,1);

pPercision = zeros(1,1);
pRecall = zeros(1,1);
pFMeasure = zeros(1,1);
pRmse = zeros(1,1);
pAccuracy = zeros(1,1);

systemAccuracy = zeros(1,1);
CFSystemAccuracy = zeros(1,1);

systemFMeasure = zeros(1,1);
CFSystemFMeasure = zeros(1,1);

systemRmse = zeros(1,1);
CFSystemRmse = zeros(1,1);

for listSize = 1:5:200
listSize
percision = zeros(m, 1);
recall = zeros(m, 1);
rmse = zeros(m, 1);
accuracy = zeros(m, 1);
fMeasure = zeros(m, 1);

for i = 1 : m
   [recommendationList , recommendationVector] = recommendToUser...
       ( test2a5(:, i) , train2a5, movieTrainTable(2:end, 2:end) , N_u, listSize, movieTrainTable(1, 2:end));
   [ rmse(i) , percision(i) , recall(i) , accuracy(i) , fMeasure(i) ] = computeErrors(movieTestTable(i+1,2:end)  , recommendationVector);
end

percisionCF = zeros(m, 1);
recallCF = zeros(m, 1);
rmseCF = zeros(m, 1);
accuracyCF = zeros(m, 1);
fMeasureCF = zeros(m, 1);

for i = 1 : m
   [recommendationList , recommendationVector] = recommendToUser...
       ( tagTestTable(i, 2:end)' , tagTrainTable(2:end, 2:end)', movieTrainTable(2:end, 2:end) , N_u, listSize, movieTrainTable(1, 2:end));
   [ rmseCF(i) , percisionCF(i) , recallCF(i) , accuracyCF(i) , fMeasureCF(i) ] = computeErrors(movieTestTable(i+1,2:end)  , recommendationVector);
end

systemPercision(end+1,1) = mean(percision);
systemRecall(end+1,1) = mean(recall);
systemAccuracy(end+1, 1) = mean(accuracy);
systemFMeasure(end+1, 1) = mean(fMeasure);
systemRmse(end+1,1) = mean(rmse);


CFSystemPersision(end+1,1) = mean(percisionCF);
CFSystemRecall(end+1,1) = mean(recallCF);
CFSystemAccuracy(end+1, 1) = mean(accuracyCF);
CFSystemFMeasure(end+1, 1) = mean(fMeasureCF);
CFSystemRmse(end+1,1) = mean(rmseCF);

[hPercision(end+1,1),pPercision(end+1,1)] = getP(percision, percisionCF);
[hRecall(end+1,1),pRecall(end+1,1)] = getP(recall, recallCF);
[hFMeasure(end+1,1),pFMeasure(end+1,1)] = getP(fMeasure, fMeasureCF);
[hAccuracy(end+1,1),pAccuracy(end+1,1)] = getP(accuracy, accuracyCF);
[hRmse(end+1,1),pRmse(end+1,1)] = getP(rmse, rmseCF);
end
