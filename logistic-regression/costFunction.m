function [cost, gradientMat] = costFunctionRegulate(theta, X, y, regulatePara)
%COSTFUNCTION compute cost, gradient with regulation
%   gradientMat is partial derivative matrix
%   use sigmoid function for classification

m = size(X, 1); % m samples
n = size(X, 2); % n features, X has size(m, n)
cost = 0;
gradientMat = zeros(size(theta));

hypothesis = sigmoid(X * theta);
thetaRegulate = [0; theta(2:n, :)]; % zero first row for not regulate bias term
cost = (1 / m) * sum(-y .* log(hypothesis) - (1 - y) .* log(1 - hypothesis)) + ...
    (regulatePara / (2 * m)) * sum(thetaRegulate .^ 2);
gradientMat = (X' * (hypothesis - y) + regulatePara * thetaRegulate) / m;

end
