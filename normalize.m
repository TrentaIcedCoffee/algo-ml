function [XNormal, meanVec, stdVec] = normalize(X)
%NORMALIZE normalizes X
%   NORMALIZE(X) returns XNormal, meanVec has mean
%   for each feature, stdVec has standard derivation
%   for each feature.
%   for i feature, mean(X(:, i)) = 0; std(X(:, i)) = 1;

m = size(X, 1); % m examples
n = size(X, 2); % n features, m has size (m, n)
XNormal = X;
meanVec = zeros(1, n);
stdVec = zeros(1, n);

meanVec = mean(X, 1);
XNormal = X - repmat(meanVec, m, 1); % sum(XNormal, 1) = [0 0]
stdVec = std(XNormal, [], 1);
for i = 1:n
    if stdVec(i) == 0
        XNormal(:, i) = zeros(m, 1); % mean is 0 and std is 0 -> are all 0
    else
        XNormal(:, i) = XNormal(:, i) ./ stdVec(i);
    end
end

end
