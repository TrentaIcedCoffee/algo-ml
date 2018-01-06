function gradientCell = backwardPropergate(learningRate, hypoMat, Y, ThetaCell, zCell, aCell)
%FORWARDPROPERGATE Run backward propergate, returns gradientCell
%   gradientCell, ThetaCell has same size
%   gradientCell is derivative of ThetaCell
%   to obtain hypoMat, zCell and aCell, run forwardPropergate first
%   forwardPropergate: (X, ThetaCell) -> (hypoMat, zCell, aCell)

m = size(hypoMat, 1);
layerNumber = size(ThetaCell, 2) + 1;
sigmaCell = cell(1, layerNumber);
deltaCell = cell(1, layerNumber);
gradientCell = cell(1, layerNumber);

% sigma backward loop
for layer = layerNumber:-1:2
    if layer == layerNumber
        sigmaCell(layer) = {hypoMat - Y};
    else
        sigmaPost = cell2mat(sigmaCell(layer + 1));
        theta = cell2mat(ThetaCell(layer));
        % z = cell2mat(zCell(layer));
        a = cell2mat(aCell(layer));
        sigmaTemp = (sigmaPost * theta) .* sigmoidGradient(a);
        sigmaCell(layer) = {sigmaTemp(:, 2:end)};
    end
end

% delta forward loop
for layer = 1:layerNumber - 1
    sigmaPost = cell2mat(sigmaCell(layer + 1));
    a = cell2mat(aCell(layer));
    deltaCell(layer) = {sigmaPost' * a};
end

% gradient forward loop
for layer = 1:layerNumber - 1
    delta = cell2mat(deltaCell(layer));
    theta = cell2mat(ThetaCell(layer));
    gradientCell(layer) = {(1 / m) * delta + ...
        (learningRate / m) * [zeros(size(theta, 1), 1) theta(:, 2:end)]};
end

end
