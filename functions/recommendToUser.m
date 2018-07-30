function [recommendationList , recommendationVector] = recommendToUser( user , trainUserTagsTable, trainUserItemsTable , N_u, listLength, itemsHeader)
    %user must be a column vector
    %train data must a matrix with users as columns
    
    %user Item table has users as rows and items as clumns
    
    %Tables must have no headers
    
    % return two col vectors
    [neighboursSimiliarities, neighboursIndices] = findNeighbours(user, trainUserTagsTable, N_u);
    
    recommendationList = bsxfun(@times, trainUserItemsTable(neighboursIndices , :), neighboursSimiliarities);
    
    recommendationList = sum( recommendationList , 1 );
   
    [~, sortedRecommendationIndices] = sort(recommendationList,'descend');
    recommendationList = itemsHeader(sortedRecommendationIndices(1 : listLength));
     
    recommendationVector = zeros(size(itemsHeader));
    recommendationVector(sortedRecommendationIndices(1 : listLength)) = 1;
    
end