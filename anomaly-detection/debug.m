%% Debug file for anomaly detection

% This file is used to debug the following files
%   data.mat

% Initialization
close all;
clear;
clc;

load('debug.mat');
index_debug = {'X_train'; ...
                'X_cv'; ...
                'y_cv'; ...
                'vec_mean'; ...
                'vec_var'; ...
                'vec_hypo_cv'};
for i = 1:length(index_debug)
    if ~exist(index_debug{i}, 'var')
        fprintf('ERR, debug.mat does not contain %s\n', index_debug(i));
        return;
    end
end
load('expect.mat');
index_expect = {'vec_mean_expect'; ...
                'vec_var_expect'; ...
                'vec_hypo_train_expect'; ...
                'epsilon_opt_expect'; ...
                'f1_opt_expect'};
for i = 1:length(index_expect)
    if ~exist(index_expect{i}, 'var')
        fprintf('ERR, expect.mat does not contain %s\n', index_expect(i));
        return;
    end
end
