function gradient = sigmoidGradient(x)
%SIGMOIDGRADIENT compute derivative of sigmoid function on x

gradient = zeros(size(x));

gradient = sigmoid(x) .* (1 - sigmoid(x));

end
