function sampleNumberOpt = sampleNumberVsCost(X, y, XCV, yCV, thetaCellInitial, regulatingRate, maxIter, architecturePara, rangeSampleNumber)
%SAMPLENUMBERVSCOST Plot map: sampleNumber -> cost, return the most optimized sampleNumber
%   use (XCV, yCV), cross validation data set for optimization

sampleNumberOpt = 0;
minSampleNumber = rangeSampleNumber(1);
maxSampleNumber = rangeSampleNumber(2);

costTrain = zeros(maxSampleNumber - minSampleNumber + 1, 1);
costCV = zeros(maxSampleNumber - minSampleNumber + 1, 1);

for sampleNumber = minSampleNumber:maxSampleNumber
    ThetaCell = train(X(1:sampleNumber, :), ...
                    y(1:sampleNumber), ...
                    thetaCellInitial, ...
                    regulatingRate, ...
                    maxIter, ...
                    architecturePara);
    % set regulatingRate to 0 when compute error
    costTrain(sampleNumber - minSampleNumber + 1) = costFunction(architecturePara, ThetaCell, X(1:sampleNumber, :), y(1:sampleNumber), 0);
    costCV(sampleNumber - minSampleNumber + 1) = costFunction(architecturePara, ThetaCell, XCV, yCV, 0);
end

[~, sampleNumberOpt] = min(costCV, [], 1);
sampleNumberOpt = sampleNumberOpt + minSampleNumber - 1;

figure
plot(minSampleNumber:maxSampleNumber, costTrain, minSampleNumber:maxSampleNumber, costCV);
title('Sample Number VS. Cost')
legend('Train', 'Cross Validation');
xlabel('Sample Number');
ylabel('Cost');
drawnow;

end