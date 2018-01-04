function plotData(x, y, pTitle, pXLabel, pYLabel)
%PLOTDATA plots map R -> R
%   x, y has same size(~, 1)

figure;
plot(x, y, 'rx', 'MarkerSize', 10);
title(pTitle);
xlabel(pXLabel);
ylabel(pYLabel);

end
