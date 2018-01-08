function XPoly = polyMap(X, order)
%POLYMAP Map X with highest order 1 to XPloy with given highest order 
%   This mapping perfectly map every combination
%   X is complete in order 1

XPoly = [];

XPoly = helper(X(:, 2:end), 1, order);

end

function permutations = helper(data, start, remainLen)
%HELPER Helper function for polyMap, given data of each independent
%feature, returns all permutations of data(:, start:end) with given length
%   NOTE data contains ONLY independent features. In other words, data
%   continas all terms with order 1
%   NOTE recursive implementation

permutations = ones(size(data, 1), 1);

if remainLen == 0
    return;
end

for i = start:size(data, 2)
    permutationsChild = helper(data, i, remainLen - 1);
    permutationsThis = repmat(data(:, i), 1, size(permutationsChild, 2)) .* permutationsChild;
    permutations = [permutations permutationsThis];
end
    
end
