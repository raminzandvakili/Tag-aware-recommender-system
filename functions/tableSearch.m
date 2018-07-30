function [ row, col ] = tableSearch( table, leftHeaderElement, topHeaderElement )
    %find row and cloumn of the matrix for a left anf top header ID. The
    %zero left top cell is not searched.
    row = find( table( 2 : end , 1) == leftHeaderElement ) + 1;
    col = find( table( 1 , 2 : end ) == topHeaderElement ) + 1;
end