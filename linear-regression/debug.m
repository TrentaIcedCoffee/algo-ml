%% Debug for linear-regression

% this file is used to debug following files
%   normalize.m
%   costFunction.m
%   gradiendDescent.m
%   normalEquation.m

%% Initialization
close all;
clear;
clc;

load('debug.mat');

%% Debug normalize.m
[XNormalRun, meanVecRun, stdVecRun] = normalize(X);
if ~isequal(XNormalRun, XNormalExpect) || ...
        ~isequal(meanVecRun, meanVecExpect) || ...
        ~isequal(stdVecRun, stdVecExpect)
    fprintf('ERR\n');
    return;
end
fprintf('normalize.m ok\n');

%% Debug costFunction.m
costRun = costFunction([ones(sampleNumber, 1), X], y, [0; 0]);
if costRun ~= costExpect
    fprintf('ERR\n');
    return;
end
fprintf('costFunctions.m ok\n');

%% Debug gradientDescent.m
thetaRunGradientDescent = gradientDescent([ones(sampleNumber, 1), X], y, thetaInitial, learningRate, iterNumber);
if ~isequal(thetaRunGradientDescent, thetaExpectGradientDescent)
    fprintf('ERR\n');
    return;
end
fprintf('gradientDescent.m ok\n');

%% Debug normalEquation.m
thetaRunNormalEquation = normalEquation([ones(sampleNumber, 1), X], y);
if ~isequal(thetaRunNormalEquation, thetaExpectNormalEquation)
    fprintf('ERR\n');
    return;
end
fprintf('normalEquation.m ok\n');

%% Summary
fprintf('all ok\n');
