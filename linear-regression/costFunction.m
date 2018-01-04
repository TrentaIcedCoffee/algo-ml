function cost = costFunction(X, y, theta)
%COSTFUNCTION compute cost for linear regression
%   cost = costFunction returns cost using h = X * theta (linear regression)
m = size(X, 1);
cost = 0;

cost = sum((X * theta - y) .^ 2) / (2 * m);

end
