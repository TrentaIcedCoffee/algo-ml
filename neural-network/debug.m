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

%% Initialization
close all;
clear;
clc;

load('debug.mat')

%% Debug yToY.m
Y = yToY(y, classNumber);
if ~isequal(Y, YExpect)
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
sigmoidGradientRun = sigmoidGradient(0.7);
if sigmoidGradientRun ~= sigmoidGradientExpect
    fprintf('sigmoidGradient.m ERR\n');
    return;
end
fprintf('sigmoidGradient.m ok\n');

%% Debug forwardPropergate.m
[hypoMat, zCell, aCell] = forwardPropergate(ThetaCell, X);
if ~isequal(hypoMat, hypoMatExpect) || ~isequal(zCell, zCellExpect) || ~isequal(aCell, aCellExpect)
    fprintf('forwardPropergate.m ERR\n');
    return;
end
fprintf('forwardPropergate.m ok\n');

%% Debug backwardPropergate.m
[hypoMat, zCell, aCell] = forwardPropergate(ThetaCell, X);
gradientCell = backwardPropergate(regulatingRate, hypoMat, YExpect, ThetaCell, zCell, aCell);
if ~isequal(gradientCell, gradientCellExpect)
    fprintf('backwardPropergate.m ERR\n');
    return;
end
fprintf('backwardPropergate.m ok\n');

%% Debug costFunction.m
[costRun, gradientCellRun] = costFunction(architecturePara, ThetaCell, X, y, regulatingRate);
if ~isequal(costRun, costExpect) || ~isequal(gradientCellRun, gradientCellExpect)
    fprintf('costFunction.m ERR\n');
    return;
end
fprintf('costFunction.m ok\n');

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

%% Debug costFunctionIter.m
[costRun, gradientVecRun] = costFunctionIter(architecturePara, ThetaVec, X, y, regulatingRate);
if ~isequal(costRun, costExpect) || ~isequal(gradientVecRun, gradientVecExpect)
    fprintf('costFunctionIter.m ERR\n');
    return;
end
fprintf('costFunctionIter.m ok\n');

%% Debug predict.m
predRun = predict(ThetaCell, X);
if ~isequal(predRun, predExpect)
    fprintf('predict.m ERR\n');
    return;
end
fprintf('predict.m ok\n');

%% Debug accuracy.m
pred = predict(ThetaCell, X);
accuracyRun = pAccuracy(pred, y);
if ~isequal(accuracyRun, accuracyExpect)
    fprintf('accuracy.m ERR\n');
    return;
end
fprintf('accuracy.m ok\n');

%% Summary
fprintf('all ok\n');

%% Run
ThetaInitialCell = randThetaCell(architecturePara);
ThetaInitialVec = cellToLongAssVec(ThetaInitialCell);

options = optimset('MaxIter', 200);
costFunctionIterUse = @(pThetaVec) costFunctionIter(architecturePara, pThetaVec, X, y, regulatingRate);

[ThetaVec, cost] = fmincg(costFunctionIterUse, ThetaInitialVec, options);
ThetaCell = longAssVecToCell(ThetaVec, architecturePara);
pAccuracy = accuracy(predict(ThetaCell, X), y);
fprintf('accuracy %.2f\n', pAccuracy);