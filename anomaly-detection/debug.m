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

%% Debug naive_gaussian.m
[vec_mean_run, vec_var_run] = naive_gaussian(X_train);
if ~isequal(vec_mean_run, vec_mean_expect) || ...
    ~isequal(vec_var_run, vec_var_expect)
    fprintf('ERR, naive_gaussian.m\n');
    return;
end

%% Debug multivariate_gaussian.m
vec_hypo_train_run = multivariate_gaussian(vec_mean, vec_var, X_train);
if ~isequal(vec_hypo_train_run, vec_hypo_train_expect)
    fprintf('ERR, multivariate_gaussian.m\n');
    return;
end

%% Debug optimize_epsilon.m
[epsilon_opt_run, f1_opt_run] = optimize_epsilon(vec_hypo_cv_expect, y_cv)
if ~isequal(epsilon_opt_run, epsilon_opt_expect) || ...
    ~isequal(f1_opt_run, f1_opt_expect)
    fprintf('ERR, optimize_epsilon.m\n');
    return;
end
