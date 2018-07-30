function tableWithTopAndLeftHeaders = addHeaders( matrix, topHeader, leftHeader )
% Add top and left headers to a data matrix
% This function recives two cloumn vectors and adds them to the top and left 
% of the data matrix. The left top element is equated to zero.

tableWithTopHeader = [ topHeader'; matrix ];
leftHeader = [ 0; leftHeader ];
tableWithTopAndLeftHeaders = [ leftHeader, tableWithTopHeader ];

end