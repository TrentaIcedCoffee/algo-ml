%% Debug for neural network

% this file is used to debug the following files
%   displayData.m
%   sigmoid.m
%   sigmoidGradient.m
%   randTheta.m

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


%% Summary
fprintf('all ok\n');
