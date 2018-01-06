%% Debug for neural network

% this file is used to debug the following files
%   displayData.m
%   sigmoid.m
%   sigmoidGradient.m
%   forwardPropergate.m
%   backwardPropergate.m

%% Initialization
close all;
clear;
clc;

load('handwritten-digit.mat');
load('handwritten-digit-theta.mat');
m = size(X, 1);
n = size(X, 2);
inputElementSize = 400;
hiddenElementSize = 25;
outputClassSize = 10; % using 3-layer architecture, with element size [400, 25, 10]
architecturePara = [inputElementSize, hiddenElementSize, outputClassSize];
% y has size (sample, 1) -> Y has size (sample, classNumber)
I = eye(outputClassSize);
Y = zeros(m, outputClassSize);
for i = 1:m
  Y(i, :) = I(y(i), :);
end

%% Debug displayData.m
displayData(X(1, :));

%% Debug sigmoid.m
yExpect = 0.67;
yRun = sigmoid(0.7);

fprintf('y, run %.2f, expect %.2f\n', yRun, yExpect);
if abs(yRun - yExpect) > 0.01
    fprintf('ERR\n');
    return;
end
fprintf('sigmoid.m ok\n');

%% Debug sigmoidGradient.m
gradientExpect = 0.22;
gradientRun = sigmoidGradient(0.7);

fprintf('gradient, run %.2f, expect %.2f\n', gradientRun, gradientExpect);
if abs(gradientRun - gradientExpect) > 0.01
    fprintf('ERR\n');
    return;
end
fprintf('sigmoidGradient.m ok\n');

%% Debug forwardPropergate.m
pointExpect = 1.00;
hypoMat = forwardPropergate(ThetaCell, X);
pointRun = hypoMat(1, 10);

fprintf('point, run %.2f, expect %.2f\n', pointRun, pointExpect);
if abs(pointRun - pointExpect) > 0.01
    fprintf('ERR\n');
    return;
end
fprintf('forwardPropergate.m ok\n');

%% Debug backwardPropergate.m
[hypoMat, zCell, aCell] = forwardPropergate(ThetaCell, X);
pointExpect = 0.62;
gradientCell = backwardPropergate(hypoMat, Y, ThetaCell, zCell, aCell);
gradientMat1 = cell2mat(gradientCell(1));
pointRun = gradientMat1(1, 1);

fprintf('point, run %.2f, expect %.2f\n', pointRun, pointExpect);
if abs(pointRun - pointExpect) > 0.01
    fprintf('ERR\n');
    return;
end
fprintf('backwardPropergate.m ok\n');

%% Summary
fprintf('all ok\n');
