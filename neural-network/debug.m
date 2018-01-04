%% Debug for neural network

% this file is used to debug the following files
%   displayData.m

%% Initialization
close all;
clear;
clc;

load('neural-network.mat');
m = size(X, 1);
n = size(X, 2);
inputElementSize = 400;
hiddenElementSize = 25;
outputClassSize = 10; % using 3-layer architecture, with element size [400, 25, 10]

%% Debug displayData.m
displayData(X(1, :));
