%% Debug for neural network

% this file is used to debug the following files
%   yToY.m
%   sigmoid.m
%   sigmoidGradient.m
%   forwardPropergate.m
%   backwardPropergate.m
%   costFunction.m

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
[costRun, gradientVecRun] = costFunction(architecturePara, ThetaCell, X, y, regulatingRate);
if ~isequal(costRun, costExpect) || ~isequal(gradientVecRun, gradientVecExpect)
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

%% Summary
fprintf('all ok\n');
