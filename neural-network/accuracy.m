function accuracy = accuracy(pred, y)
%ACCURACY Compute accuracy with denominator 100
%   pred, y has same size (sampleNumber, 1)

accuracy = 0;

accuracy = mean(double(pred == y)) * 100;

end

