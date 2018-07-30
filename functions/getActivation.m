function [ a2, a3] = getActivation(W1, b1, b2, input)
    % Compute activations
    z2 = bsxfun(@plus, W1 * input, b1);
    a2 = sigmoid(z2);
    z3 = bsxfun(@plus, W1' * a2, b2);
    a3 = sigmoid(z3);
end