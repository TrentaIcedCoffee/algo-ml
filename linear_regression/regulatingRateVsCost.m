function regulatingRateOpt = regulatingRateVsCost(X, y, XCV, yCV, thetaInitial, rangeRegulatingRate, maxIter)
%REGULATINGRATEOPT Plot map: regulatingRate -> cost, return the most optimized regulatingRate
%   regulatingRate has range [0, maxRegulatingRate]
%   use (XCV, yCV), cross validation data set for optimization

minRegulatingRate = rangeRegulatingRate(1);
maxRegulatingRate = rangeRegulatingRate(2);
spots = 100;
regulatingRateOpt = 0;

regulatingRateLinspace = linspace(minRegulatingRate, maxRegulatingRate, spots);
costTrain = zeros(spots, 1);
costCV = zeros(spots, 1);
for i = 1:spots
    theta = train(X, y, thetaInitial, regulatingRateLinspace(i), maxIter);
    % set regulatingRate to 0 when compute error
    costTrain(i) = costFunction(X, y, theta, 0);
    costCV(i) = costFunction(XCV, yCV, theta, 0);
end

[~, regulatingRateOptIndex] = min(costCV, [], 1);
regulatingRateOpt = regulatingRateLinspace(regulatingRateOptIndex);

figure
plot(regulatingRateLinspace, costTrain, regulatingRateLinspace, costCV);
title('Regulating Rate VS. Cost')
legend('Train', 'Cross Validation');
xlabel('Regulating Rate');
ylabel('Cost');
drawnow;

end
