%% Debug for logistic regression

% this file is used to debug following files
%   plotData.m
%   sigmoid.m
%   costFunction.m
%   mapPolynomial.m

%% Initialization
close all;
clear;
clc;

load('logistic_regression.mat');
m = size(X, 1); % m samples
n = size(X, 2); % n features, X has size (m, n)

%% Debug plotData.m
plotData(X, y, 'plotDebug', 'X1', 'X2', 'Zero', 'One');

%% Debug sigmoid.m
yExpect = 0.67;
yRun = sigmoid(0.7);

fprintf('y, run %.2f, expect %.2f\n', yRun, yExpect);
if abs(yRun - yExpect) > 0.01
    fprintf('ERR\n');
    return;
end
fprintf('sigmoid.m ok\n');

%% Debug costFunction.m
costExpect = 0.69;
gradientMatExpect = [-0.10; -12.01; -11.26];
[costRun, gradientMatRun] = costFunction(zeros(n + 1, 1), [ones(m, 1) X], y, 1);

fprintf('cost, run %.2f, expect %.2f\n', costRun, costExpect);
fprintf('gradientMat, run %s, expect %s\n',...
    mat2str(round(gradientMatRun, 2)),...
    mat2str(round(gradientMatExpect, 2)));
if abs(costRun - costExpect) > 0.01 ||...
        any(abs(gradientMatRun - gradientMatExpect) > 0.01)
    fprintf('ERR\n');
    return;
end
fprintf('costFunction.m ok\n');

% BREAKPOINT
