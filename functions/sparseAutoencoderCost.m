function [cost,grad] = sparseAutoencoderCost(theta, visibleSize, hiddenSize, ...
                                             lambda, sparsityParam, beta, data) 

[W1, b1, b2] = ThetaToWeights(theta, visibleSize, hiddenSize);
 
[ a2 , a3 ] = getActivation( W1 , b1 , b2 , data);

error1 = rmse( a3 , data );
[ error2 , rhoBar ] = sparsityError( a2 , sparsityParam );
error3 = overfitError( W1 );
cost = error1 +  beta * error2 + lambda * error3;

[ W1grad , b1grad , b2grad ] = getGrads( data, a2 , a3 , W1 ,...
    sparsityParam, rhoBar, lambda, beta );

%-------------------------------------------------------------------
% After computing the cost and gradient, we will convert the gradients back
% to a vector format (suitable for minFunc).  Specifically, we will unroll
% your gradient matrices into a vector.

grad = [W1grad(:) ; b1grad(:) ; b2grad(:)];

end

%-------------------------------------------------------------------
% Here's an implementation of the sigmoid function, which you may find useful
% in your computation of the costs and the gradients.  This inputs a (row or
% column) vector (say (z1, z2, z3)) and returns (f(z1), f(z2), f(z3)). 



