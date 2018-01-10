%% Debug for neural network

% this file is used to debug the following files
%   yToY.m
%   sigmoid.m
%   sigmoidGradient.m
%   forwardPropergate.m
%   backwardPropergate.m
%   cellToLongAssVec.m
%   longAssVecToCell.m
%   costFunction.m
%   costFuncitonIter.m
%   predict.m
%   accuracy.m

%% Initialization
close all;
clear;
clc;

load('data.mat');
load('expect.mat');

%% Debug split.m
[XRun, yRun, XCVRun, yCVRun, XTestRun, yTestRun] = split(XTotal, yTotal);
if ~isequal(XRun, XExpect) || ...
        ~isequal(yRun, yExpect) || ...
        ~isequal(XCVRun, XCVExpect) || ...
        ~isequal(yCVRun, yCVExpect) || ...
        ~isequal(XTestRun, XTestExpect) || ...
        ~isequal(yTestRun, yTestExpect)
    fprintf('split.m ERR\n');
    return;
end
fprintf('split.m ok\n');

%% Debug yToY.m
YRun = yToY(y, classNumber);
if ~isequal(YRun, YExpect)
    fprintf('yToY.m ERR\n');
    return;
end
fprintf('yToY.m ok\n');

%% Debug sigmoid.m
sigmoidRun = sigmoid(point);
if sigmoidRun ~= sigmoidExpect
    fprintf('sigmoid.m ERR\n');
    return;
end
fprintf('sigmoid.m ok\n');

%% Debug sigmoidGradient.m
sigmoidGradientRun = sigmoidGradient(point);
if sigmoidGradientRun ~= sigmoidGradientExpect
    fprintf('sigmoidGradient.m ERR\n');
    return;
end
fprintf('sigmoidGradient.m ok\n');

%% Debug forwardPropergate.m
[hypoMatRun, zCellRun, aCellRun] = forwardPropergate(ThetaCell, X);
if ~isequal(hypoMatRun, hypoMatExpect) || ~isequal(zCellRun, zCellExpect) || ~isequal(aCellRun, aCellExpect)
    fprintf('forwardPropergate.m ERR\n');
    return;
end
fprintf('forwardPropergate.m ok\n');

%% Debug backwardPropergate.m
gradientCellRun = backwardPropergate(regulatingRate, hypoMat, Y, ThetaCell, zCell, aCell);
if ~isequal(gradientCellRun, gradientCellExpect)
    fprintf('backwardPropergate.m ERR\n');
    return;
end
fprintf('backwardPropergate.m ok\n');

%% Debug cellToLongAssVec.m
ThetaVecRun = cellToLongAssVec(ThetaCell);
if ~isequal(ThetaVecRun, ThetaVecExpect)
    fprintf('cellToLongAssVec.m ERR\n');
    return;
end
fprintf('cellToLongAssVec.m ok\n');

%% Debug longAssVecToCell.m
ThetaCellRun = longAssVecToCell(ThetaVec, architecturePara);
if ~isequal(ThetaCellRun, ThetaCellExpect)
    fprintf('longAssVecToCell.m ERR\n');
    return;
end
fprintf('longAssVecToCell.m ok\n');

%% Debug costFunction.m
[costRun, gradientCellRun] = costFunction(architecturePara, ThetaCell, X, y, regulatingRate);
if ~isequal(costRun, costExpect) || ~isequal(gradientCellRun, gradientCellExpect)
    fprintf('costFunction.m ERR\n');
    return;
end
fprintf('costFunction.m ok\n');

%% Debug costFunctionIter.m
[costRun, gradientVecRun] = costFunctionIter(architecturePara, ThetaVec, X, y, regulatingRate);
if ~isequal(costRun, costExpect) || ~isequal(gradientVecRun, gradientVecExpect)
    fprintf('costFunctionIter.m ERR\n');
    return;
end
fprintf('costFunctionIter.m ok\n');

%% Debug train.m
ThetaCellTrainedRun = train(X, y, ThetaCellInitial, regulatingRate, maxIter, architecturePara);
if ~isequal(ThetaCellTrainedRun, ThetaCellTrainedExpect)
    fprintf('train.m ERR\n');
    return;
end
fprintf('train.m ok\n');

%% Debug predict.m
predRun = predict(ThetaCell, X);
if ~isequal(predRun, predExpect)
    fprintf('predict.m ERR\n');
    return;
end
fprintf('predict.m ok\n');

%% Debug accuracy.m
accuracyRun = accuracy(pred, y);
if ~isequal(accuracyRun, accuracyExpect)
    fprintf('accuracy.m ERR\n');
    return;
end
fprintf('accuracy.m ok\n');
%% sampleNumberVsCost.m


%% orderVsCost.m


%% Summary
fprintf('all ok\n');

%% Run
[XTotal, yTotal] = shuffle(XTotal, yTotal);
[X, y, XCV, yCV, XTest, yTest] = split(XTotal, yTotal);

[sampleNumber, featureNumber] = size(X);
classNumber = 10;
architecturePara = [featureNumber, 25, classNumber]
regulatingRate = 1;
maxIter = 200;

ThetaCell = train(X, y, randThetaCell(architecturePara), regulatingRate, maxIter, architecturePara);

accuracyTrain = accuracy(predict(ThetaCell, X), y);
accuracyCV = accuracy(predict(ThetaCell, XCV), yCV);
fprintf('train accuracy %.2f\n', accuracyTrain);
fprintf('cross validation %.2f\n', accuracyCV);