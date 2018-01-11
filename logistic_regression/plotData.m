function plotData(X, y, pTitle, pX1Label, pX2Label, zeroLegend, oneLegend)
%PLOTDATA plots classification input X and output y
%   X has size(~, 2), y has size(~, 1), y has value 0 or 1

figure;
hold on;

indexZero = find(y == 0);
indexOne = find(y == 1);
plot(X(indexZero, 1), X(indexZero, 2), 'ko', 'MarkerSize', 7);
plot(X(indexOne, 1), X(indexOne, 2), 'k+', 'MarkerSize', 7);
title(pTitle);
xlabel(pX1Label);
ylabel(pX2Label);
legend(zeroLegend, oneLegend)

hold off;

end
