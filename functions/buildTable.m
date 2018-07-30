function [userTagDataFileTable, userItemDataFileTable] = ...
    buildTable( user, item, tag, binary )
% makeDataFileTable makes data file tables based on user, item and tag vectors
    %Add Headers
    %%Make an empty userTag Table
    [nUUser ,nUItem , nUTag] = countUserItemTag(user , item , tag);
    
    userTagDataFileTable = addHeaders( zeros( nUUser, nUTag ), unique(tag), unique(user) );
    userItemDataFileTable = addHeaders( zeros( nUUser, nUItem ), unique(item), unique(user) );
    
    %Fill The Table
    userTagDataFileTable = tableFill(userTagDataFileTable, user, tag, binary);
    userItemDataFileTable = tableFill(userItemDataFileTable, user, item, binary);
    
end