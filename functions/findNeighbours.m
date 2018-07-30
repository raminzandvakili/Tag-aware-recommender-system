function [neighboursSimiliarities, neiboursIndices] = findNeighbours(user, trainUsers, N_u)
    %find N_u neighbours of the target user based on similiarity between
    %them.
    
    %compute similiarity between transformed user and transformed Train
    %Users profiles
    similiarityList = similiarity(user , trainUsers);
    
    [sortedSimiliarities, sortingIndices] = sort(similiarityList,'descend');
    
    neighboursSimiliarities = sortedSimiliarities(1 : N_u);
    neiboursIndices = sortingIndices(1 :N_u);   
end