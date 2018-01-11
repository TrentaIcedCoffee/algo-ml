function orderOpt = orderVsCost(XOrder1, y, XCVOrder1, yCV, regulatingRate, maxIter, maxOrder)
%%ORDERVSCOST Return most optmized order of X and plot graph: order -> cost
%   XOrder1, XCVOrder1 is complete in order 1, contains terms of order 0
%   and order 1
%   use (XCV, yCV), cross validation data set for optimization

orderOpt = 0;

costTrain = zeros(maxOrder, 1);
costCV = zeros(maxOrder, 1);

for order = 1:maxOrder
    XOrder = polyMap(XOrder1, order);
    XCVOrder = polyMap(XCVOrder1, order);
    theta = train(XOrder, y, zeros(size(XOrder, 2), 1), regulatingRate, maxIter);
    costTrain(order) = costFunction(XOrder, y, theta, 0);
    costCV(order) = costFunction(XCVOrder, yCV, theta, 0);
end

[~, orderOpt] = min(costCV, [], 1);

figure
plot(1:maxOrder, costTrain, 1:maxOrder, costCV);
title('Order VS. Cost')
legend('Train', 'Cross Validation');
xlabel('Order');
ylabel('Cost');
drawnow;

end