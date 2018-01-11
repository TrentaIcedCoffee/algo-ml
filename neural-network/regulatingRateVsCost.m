function regulatingRateOpt = regulatingRateVsCost(X, y, XCV, yCV, ThetaCell, rangeRegulatingRate, maxIter, architecturePara)
%REGULATINGRATEOPT Plot map: regulatingRate -> cost, returns the most optimized regulatingRate
%   NOTE spots was set to 2 for debug, set to 100 for production
%   regulatingRate has range [minRegulatingRate, maxRegulatingRate]
%   use (XCV, yCV), cross validation data set for optimization

minRegulatingRate = rangeRegulatingRate(1);
maxRegulatingRate = rangeRegulatingRate(2);
regulatingRateOpt = 0;

% use for debug
spots = 2;

% use for production
% spots = 100;

regulatingRateLinspace = linspace(minRegulatingRate, maxRegulatingRate, spots);
costTrain = zeros(spots, 1);
costCV = zeros(spots, 1);
for i = 1:spots
    ThetaCell = train(X, y, ThetaCell, regulatingRateLinspace(i), maxIter, architecturePara);
    % set regulatingRate to 0 when compute error
    costTrain(i) = costFunction(architecturePara, ThetaCell, X, y, 0);
    costCV(i) = costFunction(architecturePara, ThetaCell, XCV, yCV, 0);
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