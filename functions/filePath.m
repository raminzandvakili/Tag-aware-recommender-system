function path = filePath( dataFileName , fileName )
    % This function saves variables to
    % ..\builtDataFiles\dataFileName\fileName.mat
    % An example is: ..\builtDataFiles\movieLens10k\userTagTable.mat
    path = strcat('..\builtDataFiles\' , dataFileName , '\' , fileName, '.mat');
end