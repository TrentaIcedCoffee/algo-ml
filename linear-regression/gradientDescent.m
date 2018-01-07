function [theta, costVec] = gradientDescent(X, y, thetaInitial, learningRate, numIter)
%GRADIENTDESCENT Apply gradient descent on thetaInitial with learningRate
%   costVec stores every history J (cost)

[sampleNumber, ~] = size(X);
theta = thetaInitial;
costVec = zeros(numIter, 1);

for i = 1:numIter
    theta = theta - (learningRate / sampleNumber) * X' * (X * theta - y);
    costVec(i) = costFunction(X, y, theta);
end

end
