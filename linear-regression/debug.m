%% Debug for linear regression

% this file is used to debug following files
%   plotData.m
%   normalize.m
%   costFunction.m
%   gradiendDescent.m
%   normalEquation.m

%% Initialization
close all;
clear;
clc;

load('linear_regression.mat');
m = size(X, 1);
n = size(X, 2);

%% Debug plotData.m
x = X;
plotData(x, y, 'plotDebug', 'xlabel', 'ylabel');

%% Debug normalize.m
meanExpect = 0;
stdExpect = 1;
[XNormal, meanVec, stdVec] = normalize(X);
meanRun = mean(XNormal, 1);
stdRun = std(XNormal, [], 1);

fprintf('mean, run %.2f, expect %.2f\n', meanRun, meanExpect);
if abs(meanRun - meanExpect) > 0.01
    fprintf('ERR\n');
    return;
end
fprintf('std, run %.2f, expect %.2f\n', stdRun, stdExpect);
if abs(stdRun - stdExpect) > 0.01
    fprintf('ERR\n');
    return;
end
fprintf('normalize.m ok\n');


%% Debug costFunction.m
costExpect = 32.07;
costRun = costFunction([ones(m, 1), X], y, [0; 0]);

fprintf('cost, run %.2f, expect %.2f\n', costRun, costExpect);
if abs(costRun - costExpect) > 0.01
    fprintf('ERR\n');
    return;
end
fprintf('costFunctions.m ok\n');

%% Debug gradientDescent.m
thetaExpect = [-3.63; 1.17];
thetaRun = gradientDescent([ones(m, 1), X], y, [0; 0], 0.01, 1500);

fprintf('theta, run %s, expect %s\n',...
    mat2str(round(thetaRun, 2)),...
    mat2str(round(thetaExpect, 2)));
if any(abs(thetaRun - thetaExpect) > 0.01)
    fprintf('ERR\n');
    return;
end
fprintf('gradientDescent.m ok\n');

%% Debug normalEquation.m
thetaExpect = [-3.90; 1.19];
thetaRun = normalEquation([ones(m, 1), X], y);

fprintf('theta, run %s, expect %s\n',...
    mat2str(round(thetaRun, 2)),...
    mat2str(round(thetaExpect, 2)));
if any(abs(thetaRun - thetaExpect) > 0.01)
    fprintf('ERR\n');
    return;
end
fprintf('normalEquation.m ok\n');

%% Summary

fprintf('all ok\n');
