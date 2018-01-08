%% Debug for linear-regression

% this file is used to debug following files
%   normalize.m
%   costFunction.m
%   normalEquation.m
%   train.m
%   sampleNumberVsCost.m
%   regulatingRateVsCost.m

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
[costRun, gradientVecRun] = costFunction([ones(sampleNumber, 1) X], y, thetaInitial, regulatingRate);

if costRun ~= costExpect || ~isequal(gradientVecRun, gradientVecExpect)
    fprintf('ERR\n');
    return;
end
fprintf('costFunctions.m ok\n');

%% Debug normalEquation.m
thetaRunNormalEquation = normalEquation([ones(sampleNumber, 1), X], y);
if ~isequal(thetaRunNormalEquation, thetaExpectNormalEquation)
    fprintf('ERR\n');
    return;
end
fprintf('normalEquation.m ok\n');

%% Debug train.m
thetaRun = train([ones(sampleNumber, 1) X], y, thetaInitial, regulatingRate, maxIter);
if ~isequal(thetaRun, thetaExpect)
    fprintf('ERR\n');
    return;
end
fprintf('train.m ok\n');

%% Debug sampleNumberVsCost.m
sampleNumberOptRun = sampleNumberVsCost([ones(sampleNumber, 1) X], ...
                                                                            y, ...
                                                                            [ones(size(XCV, 1), 1) XCV], ...
                                                                            yCV, ...
                                                                            thetaInitial, ... 
                                                                            regulatingRate, ...
                                                                            maxIter);
if ~isequal(sampleNumberOptRun, sampleNumberOptExpect)
    fprintf('ERR\n');
    return;
end
fprintf('sampleNumberVsCost.m ok\n');

%% Debug regulatingRateVsCost.m
regulatingRateOptRun = regulatingRateVsCost([ones(sampleNumber, 1) X], ...
                                                                                 y, ...
                                                                                 [ones(size(XCV, 1), 1) XCV], ...
                                                                                 yCV, ...
                                                                                 thetaInitial, ...
                                                                                 [0, 1000], ...
                                                                                 maxIter);
if ~isequal(regulatingRateOptRun, regulatingRateOptExpect)
    fprintf('ERR\n');
    return;
end
fprintf('regulatingRateVsCost.m ok\n');

%% Summary
fprintf('all ok\n');
