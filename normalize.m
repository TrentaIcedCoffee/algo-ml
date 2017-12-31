function [X_normalized, feature_mean, feature_std] = normalize(X)
%NORMALIZE normalizes X
%   NORMALIZE(X) normalizes X s.t.
%   for i feature, mean(X(:, i)) = 0; std(X(:, i)) = 1;

m = size(X, 1); % m data
n = size(X, 2); % n features, m has size (m, n)
X_normalized = X;
feature_mean = zeros(1, n);
feature_std = zeros(1, n);

feature_mean = mean(X, 1);
X_normalized = X - feature_mean .* ones(m, n); % sum(X_normalized, 1) = [0 0]
feature_std = std(X_normalized, [], 1);
X_normalized = X_normalized ./ feature_std .* ones(m, n); % std(X_normalized, [], 1) = [1 1]

end
