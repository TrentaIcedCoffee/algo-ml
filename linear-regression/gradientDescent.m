function [theta, costVec] = gradientDescent(X, y, thetaInitial, learningRate, numIter)
%GRADIENTDESCENT apply gradient descent on thetaInitial with learningRate
%   costVec stores every history J (cost)

m = size(X, 1); % m examples
n = size(X, 2); % n features, m has size (m, n)
theta = thetaInitial;
costVec = zeros(numIter, 1);

for i = 1:numIter
    theta = theta - (learningRate / m) * X' * (X * theta - y);
    costVec(i) = costFunction(X, y, theta);
end

end
