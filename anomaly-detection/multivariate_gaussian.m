function mat_hypo = multivariate_gaussian(vec_mean, vec_var, X)
%MULTIVARIATE_GAUSSIAN Computes hypothesis using given mean and variance

[~, feature_num] = size(X);
mat_std2 = diag(vec_var); % covariance matrix
mat_diff = bsxfun(@minus, X, vec_mean');
mat_hypo = (2 * pi) ^ (-feature_num / 2) * det(mat_std2) ^ (-1 / 2) * ...
    exp(-(1 / 2) * sum(bsxfun(@times, mat_diff * pinv(mat_std2), mat_diff), 2));

end