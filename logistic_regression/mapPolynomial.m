function polynomial = mapPolynomial(X1, X2)
%MAPPOLYNOMIAL map X1 X2 to a polynomial with degree 6
% TODO generalize

degree = 6;
polynomial = zeros(size(X1(:, 1)));
for i = 1:degree
    for j = 0:i
        polynomial(:, end + 1) = (X1 .^ (i - j) .* (X2 .^ j));
    end
end

end
