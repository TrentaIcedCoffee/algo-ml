function [vec_mean, vec_std2] = naive_gaussian(X)
%NAIVE_GAUSSIAN Returns mu and var (std ^ 2) using naive gaussian

vec_mean = mean(X, 1)';
vec_std2 = var(X, 1)';

end