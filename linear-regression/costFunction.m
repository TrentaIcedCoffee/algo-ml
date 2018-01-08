function [cost, gradientVec] = costFunction(X, y, theta, regulatingRate)
%COSTFUNCTION Compute cost for linear regression with regulation
%   cost = costFunction returns cost using h = X * theta (linear regression)

[sampleNumber, ~] = size(X);
cost = 0;
gradientVec = zeros(size(theta));

hypothesis = X * theta;
thetaRegulate = [0; theta(2:end)];
penalty = (regulatingRate / (2 * sampleNumber)) * (thetaRegulate' * thetaRegulate);
cost = (1 / (2 * sampleNumber)) * (hypothesis - y)' * (hypothesis - y) + penalty;
gradientVec = (1 / sampleNumber) * (X' * (hypothesis - y) + regulatingRate * thetaRegulate);

end

