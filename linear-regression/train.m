function theta = train(X, y, thetaInitial, regulatingRate, maxIter)
%TRAIN Train linear regression using given X, y, thetaInitial and regulatingRate
%   apply fmincg for gradient descent

theta = thetaInitial;

costFunctionIterUse = @(p) costFunction(X, y, p, regulatingRate);
options = optimset('MaxIter', maxIter, 'GradObj', 'on');
theta = fmincg(costFunctionIterUse, thetaInitial, options);

end

