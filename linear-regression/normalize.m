function [XNormal, meanVec, stdVec] = normalize(X)
%NORMALIZE Normalizes X, return with mean and std of X(:, feature_i)
%   mean(X(:, i)) = 0; std(X(:, i)) = 1 or 0;

[sampleNumber, featureNumber] = size(X);
XNormal = X;
meanVec = zeros(1, n);
stdVec = zeros(1, n);

meanVec = mean(X, 1);
XNormal = X - repmat(meanVec, sampleNumber, 1); % sum(XNormal, 1) = [0 0]
stdVec = std(XNormal, [], 1);
for i = 1:featureNumber
    if stdVec(i) == 0
        XNormal(:, i) = zeros(sampleNumber, 1); % mean is 0 and std is 0 -> are all 0
    else
        XNormal(:, i) = XNormal(:, i) ./ stdVec(i);
    end
end

end
