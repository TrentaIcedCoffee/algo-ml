function theta = normalEquation(X, y)
%NORMALEQUATION Computes theta using normal equation
%   NOTE normal equation should NOT be applied on production
%   this funciton is only for research

[sampleNumber, ~] = size(X);
theta = zeros(sampleNumber, 1);

theta = pinv(X' * X) * X' * y;

end
