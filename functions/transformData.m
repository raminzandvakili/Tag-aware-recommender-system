function [data2a2 , data2a3] = transformData( data, theta , visibleSize , hiddenSize )
    % Transform data based on the optimised theta. 
    
    [W1, b1, b2] = ThetaToWeights(theta, visibleSize, hiddenSize); %Unroll theta
    % Transform Data
    data2a2 =  sigmoid(bsxfun(@plus, W1 * data , b1));
    data2a3 = sigmoid(bsxfun(@plus, W1' * data2a2 , b2));
    % Turn sigmoid function output to classification (0 and 1) output
    data2a3( data2a3 > 0.5 | data2a3 == 0.5 ) = 1;
    data2a3( data2a3 < 0.5 ) = 0;
end