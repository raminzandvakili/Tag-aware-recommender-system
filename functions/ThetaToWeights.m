function [W1, b1, b2] = ThetaToWeights(theta, visibleSize, hiddenSize)
    % unroll thata from a single vector to weight matrixes
    W1 = reshape(theta(1:hiddenSize*visibleSize), hiddenSize, visibleSize);
    
    b1 = theta(hiddenSize*visibleSize+1:hiddenSize*visibleSize+hiddenSize);
    b2 = theta(hiddenSize*visibleSize+hiddenSize+1:end);
end