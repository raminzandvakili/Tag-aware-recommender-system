function [tagTrainTable, tagTestTable, itemTrainTable, itemTestTable] = ...
    SelectTestAndTrain(dataFileName, dataFileExtension, testRatio, minNumberOfTagFrequency)

% selectTestAndTrain selects test and train data based on testRation randomly

path = dataFilePath(dataFileName, dataFileExtension);


%%%%%%%%% LOAD DATA FILE %%%%%%%%%%
[user , item , tag] = loadUserItemTag(path);

%%%%%%%%%% MAKE COMPLETE TABLES %%%%%%%%%%%

[user, item, tag] = sift(user, item, tag, minNumberOfTagFrequency);
[userTagTable, userItemTable] = buildTable( user, item, tag, 1 );


userTagData = userTagTable(2 : end, 2 : end);
userItemData = userItemTable(2 : end, 2 : end);

tagHeader = userTagTable(1, :);
ItemHeader = userItemTable(1, :);
userHeader = userTagTable(2 : end, 1);

mTag = size(userTagData, 1);

numberOfTestSamples = round((testRatio) * mTag); 
testIndices = randperm(mTag, numberOfTestSamples);

testTag = userTagData(testIndices, :);
testItem = userItemData(testIndices, :);

userHeader = userHeader(testIndices);

tagTestTable = [userHeader testTag];
tagTestTable = [tagHeader; tagTestTable];

itemTestTable = [userHeader testItem];
itemTestTable = [ItemHeader; itemTestTable];

tagTrainTable = userTagTable; 
tagTrainTable(testIndices + 1, :) = [];

itemTrainTable = userItemTable;
itemTrainTable(testIndices + 1, :) = [];

%%%%%%%%%%%%%TESTER%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%for i = 2 : size(tagTestTable, 1)
%   if any(tagTrainTable(:, 1) == tagTestTable(i, 1))
%        fprintf('ERROR! ');
%   end
%end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end