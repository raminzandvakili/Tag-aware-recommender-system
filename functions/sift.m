function [siftedUsers, siftedItems, siftedTags] = ...
    sift(user, item, tag, minNumberOfTagFrequency)
% sift function looks for tags with less than minNumberOfTagFrequency
% frequencies and equates that tag, its corresponding user and item equal
% to 0, then it deletes users, items and tags which are equal to zero.
% 
% for
% example if fifth element of the tag vector is a tag which is repreated
% less than minNumberOfTagFrequency tag(5) = 0 and user(5) = 0 and item(5)
% = 0.

    %%%% Make Initial userTag table
    [userTagDataFileTable, ~] = buildTable( user, item, tag, 0 );
    
    %%%%Make (> minNumberOfTags) userTagTable
    lessThanMinTagsIndices = find(sum(userTagDataFileTable(2:end,2:end), 1) ...
        < minNumberOfTagFrequency);
    lassThanMinTags = userTagDataFileTable(1, lessThanMinTagsIndices + 1); %because the table has headers

    m = size(tag , 1);
    for i = 1 : m %less than minNumberOfTags = 0; Del 0s
        loading(i, m, 'sifting');
        if(any(lassThanMinTags == tag(i)))
            user(i) = 0;
            tag(i) = 0;
            item(i) = 0;
        end
    end

    user(find(user == 0), :) = [];
    tag(find(tag == 0), :) = [];
    item(find(item == 0), :) = [];
    
    siftedUsers = user;
    siftedItems = item;
    siftedTags = tag;

end