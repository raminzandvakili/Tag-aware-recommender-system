function error1 =  rmse( a3 , data )
    
    %computes mean square error
    %error1 = sigma[ 1 : m](a3 - data)^2

    deltaX = a3 - data;
    squeredDeltaX = deltaX .^ 2;
    m = size( data , 2 );
    error1 = ( 1 / (2 * m) ) * sum( sum(squeredDeltaX , 1) , 2 );
end