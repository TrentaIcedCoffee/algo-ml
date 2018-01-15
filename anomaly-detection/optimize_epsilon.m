function [epsilon_opt, f1_opt] = optimize_epsilon(vec_hypo_cv, y_cv)
%OPTIMIZE_EPSILON Return the most optimized epsilon and f1 score
%   This optimization is based on f1 score

epsilon_opt = 0;
f1_opt = 0;

for epsilon = linspace(min(vec_hypo_cv), max(vec_hypo_cv), 1000)
    truePositive = sum((y_cv == 1) & (vec_hypo_cv < epsilon));
    falsePositive = sum((y_cv == 0) & (vec_hypo_cv < epsilon));
    trueNegative = sum((y_cv == 0)& (vec_hypo_cv >= epsilon));
    falseNegative = sum((y_cv == 1) & (vec_hypo_cv >= epsilon));
    precision = truePositive / (truePositive + falsePositive);
    recall = truePositive / (truePositive + falseNegative);
    f1 = (2 * precision * recall) / (precision + recall);
    
    if f1 > f1_opt
        epsilon_opt = epsilon;
        f1_opt = f1;
    end
end