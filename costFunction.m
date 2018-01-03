function J = costFunction(X, y, theta)
%COSTFUNCTION compute cost for linear regression
%   J = costFunction returns cost using h = X * theta (linear regression)
m = size(X, 1);
J = 0;

J = sum((X * theta - y) .^ 2) / (2 * m);

end
