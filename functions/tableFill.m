function filledTable = tableFill(table, rowsData, columnsData, binary)
% tableFill for every rowsData element adds 1 to corresponding columnsData element
    m = numel(rowsData);
    filledTable = table;
    for i = 1 : m
       loading( i , m , 'Filling Tables' )
       [ row , col ] = tableSearch( filledTable, rowsData( i ) , columnsData( i ) );   
       filledTable( row , col ) = filledTable( row , col ) + 1;
    end
    
    tableWithoutHeaders = filledTable(2 : end, 2 : end);
    
    if binary == 1
       tableWithoutHeaders(tableWithoutHeaders > 1) = 1;
       filledTable(2 : end, 2 : end) = tableWithoutHeaders;
    end
end