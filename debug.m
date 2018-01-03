%% Debug for linear regression

% this file is used to debug following files
%   plotData.m
%   normalize.m
%   costFunction.m
%   gradiendDescent.m
%   normalEquation.m

%% Initialization
clear all;
close all;
clc;

%% Load data
load('linear_regression.mat');

%% Debug plotData.m
x = X;
plotData(x, y, 'plotDebug', 'xlabel', 'ylabel');

%% Debug normalize.m
m = size(X, 1);
[XNormal, meanVec, stdVec] = normalize(X);
fprintf('mean(XNormal)');
disp(mean(XNormal, 1));
fprintf('\n');
fprintf('std(XNormal, [], 1)');
disp(std(XNormal, [], 1));

%% BREAKPOINT
