function J = costFunction(X, y, theta)
%COSTFUNCTION compute cost for linear regression
%   J = costFunction(X, y, theta) returns cost of current X, y, theta

m = size(X, 1);
J = 0;

J = sum((X * theta - y) .^ 2) / (2 * m);

end
