function [nUser, nItem, nTag] = countUserItemTag(user, item, tag)
% countUserItemTag returns the number of unique users, items and tags
    uniqueUser = unique(user);
    uniqueTag = unique(tag);
    uniqueItem = unique(item);
    
    nUser = numel(uniqueUser);
    nItem = numel(uniqueItem);
    nTag = numel(uniqueTag);
    
end