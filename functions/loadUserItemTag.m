function [user , item , tag] = loadUserItemTag(dataFilePath)
    % This function loads users, items and tags from the data file, and
    % copies them into 3 different vectors. The dataFile should be a .txt
    % or .dat file, in which user is column 1, item is column 2 and tag is
    % column 3. An example is movieLens10k.txt
    
    X = load( dataFilePath );

    %Define Relevant Columns
    user = X( : , 1);
    item = X( : , 2);
    tag = X( : , 3);    
end