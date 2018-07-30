function error3 = overfitError( W1 )
    error3 = ( 1 / 2 ) *(sum(sum(W1 .^ 2, 1), 2)); 
end