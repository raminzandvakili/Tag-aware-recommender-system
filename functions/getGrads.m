function [ W1grad , b1grad , b2grad ] = getGrads( data, a2 , a3 , W1 , rho, rhoBar, lambda, beta )
    % computes cost function grads
    
    m = size( a2 , 2 );
    
    delta3 =  (a3 - data) .* dsigmoid(a3);
    delta2 = bsxfun(    @plus , W1 * delta3 , beta * ( ((-1 * rho)./rhoBar) + ((1 - rho)./(1 - rhoBar)) )    ); 
    delta2 = delta2 .* dsigmoid(a2);

    W1grad = ((delta2 * data') ./ m) + lambda .* W1;
    W2grad = ((delta3 * a2') ./ m);
    
    W1grad = W1grad + W2grad';

    b1grad = sum(delta2 , 2) ./ m;
    b2grad = sum(delta3 , 2) ./ m;
end