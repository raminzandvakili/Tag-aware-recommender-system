function opttheta = TrainFunction(data, theta, visibleSize, hiddenSize, sparsityParam, lambda, beta, maxNumberOfIter , method)

%%%%%%%%%%%%%%%%%%%%%%%%%%TEST%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%data = rand(7,10);
%visibleSize = 7;
%hiddenSize = 4;
%theta = initializeParameters(hiddenSize, visibleSize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% STEP 1: Implement sparseAutoencoderCost

[cost, grad] = sparseAutoencoderCost(theta, visibleSize, hiddenSize, lambda, ...
                                     sparsityParam, beta, data);

%%======================================================================
%% STEP 3: Gradient Checking
%checkNumericalGradient();

%numgrad = computeNumericalGradient( @(x) sparseAutoencoderCost(x, visibleSize, hiddenSize, lambda, sparsityParam, beta, data), theta);

% Use this to visually compare the gradients side by side
%disp([numgrad grad]); 

% Compare numerically computed gradients with the ones obtained from backpropagation
%diff = norm(numgrad-grad)/norm(numgrad+grad);
%disp(diff); % Should be small. In our implementation, these values are
            % usually less than 1e-9. 

%%======================================================================
%% STEP 4: After verifying that your implementation of
%  sparseAutoencoderCost is correct, You can start training your sparse
%  autoencoder with minFunc (L-BFGS).

%  Use minFunc to minimize the function
%addpath minFunc/
options.Method = method; % Here, we use L-BFGS to optimize our cost
                          % function. Generally, for minFunc to work, you
                          % need a function pointer with two outputs: the
                          % function value and the gradient. In our problem,
                          % sparseAutoencoderCost.m satisfies this.
options.maxIter = maxNumberOfIter;% Maximum number of iterations of L-BFGS to run 
options.MaxFunEvals = 5000;
options.display = 'on';


[opttheta, cost] = minFunc( @(p) sparseAutoencoderCost(p, ...
                                   visibleSize, hiddenSize, ...
                                   lambda, sparsityParam, ...
                                   beta, data), ...
                              theta, options);

%%======================================================================
end

 


