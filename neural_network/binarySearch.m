function [xResult, yResult] = binarySearch(xRange, tolerance, f)
%BINARYSEARCH Finds the lowest pair (x, f(x)) in xRange using map f
%   NOTE Please make sure f is continuous on xRange, and lowest point exists in xRange

xMin = XRange(1);
xMax = XRange(2);
xMiddle = xMin + (xMax - xMin) / 2;
yMiddle = f(xMiddle);

if xMax - xMin < tolerance
    xResult = xMiddle;
    yResult = yMiddle;
    return;
end
[xLeft, yLeft] = binarySearch([xMin, xMiddle], tolerance, f);
[xRight, yRight] = binarySearch([xMiddle, xMax], tolerance, f);
if yLeft <= yRight
    xResult = xLeft;
    yResult = yLeft;
else
    xResult = xRight;
    yResult = yRight;
end

end
