function theta = normalEquation(X, y)
%NORMALEQUATION computes theta using normal equation

m = size(X, 1); % m samples
theta = zeros(m, 1);

theta = pinv(X' * X) * X' * y;

end
