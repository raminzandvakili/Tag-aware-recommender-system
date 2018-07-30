function [error2 , rhoBar] = sparsityError( a2 , rho  )
    % error2 = sigma [ 1 : n ]( DKL )
    % DKL = rho * log( rho / rhoBar ) + ( 1 - rho ) * log ( (1 - rho) / ( 1 - rhoBar ) )
    % rhoBar = (1/m) * sigma [ 1 : m ]( a2 )
    
    m = size( a2 , 2 );
    rhoBar = (1/m) * sum( a2 , 2 );
    DKL = rho * log( rho ./ rhoBar ) + ( 1 - rho ) * log( ( 1 - rho ) ./ ( 1 - rhoBar) );
    error2 = sum( DKL , 1);
end
     