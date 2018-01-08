function sampleNumberOpt = sampleNumberVsCost(X, y, XCV, yCV, thetaInitial, regulatingRate, maxIter)
%SAMPLENUMBERVSCOST Plot map: sampleNumber -> cost, return the most optimized sampleNumber
%   use (XCV, yCV), cross validation data set for optimization

sampleNumberOpt = 0;

[sampleNumberMax, ~] = size(X);
costTrain = zeros(sampleNumberMax, 1);
costCV = zeros(sampleNumberMax, 1);

for sampleNumber = 1:sampleNumberMax
    fprintf('%d\n', sampleNumber);
    theta = train(X(1:sampleNumber, :), ...
                            y(1:sampleNumber), ...
                            thetaInitial, ...
                            regulatingRate, ...
                            maxIter);
    % set regulatingRate to 0 when compute error
    costTrain(sampleNumber) = costFunction(X(1:sampleNumber, :), y(1:sampleNumber), theta, 0);
    costCV(sampleNumber) = costFunction(XCV, yCV, theta, 0);
end

[~, sampleNumberOpt] = min(costCV, [], 1);

figure
plot(1:sampleNumberMax, costTrain, 1:sampleNumberMax, costCV);
title('Sample Number VS. Cost')
legend('Train', 'Cross Validation');
xlabel('Sample Number');
ylabel('Cost');
drawnow;

end