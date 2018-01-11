function y = sigmoid(x)
%SIGMOID coumpute sigmoid on x
%   sigmoid is continuous and has range(0, 1), easy to analyze

y = zeros(size(x));

y = 1 ./ (1 + exp(-x));

end
