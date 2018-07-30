function [h, p] = getP(sample1, sample2)
% This function checks if the mean of two samples is significantly
% different. (h = 1 -> Yes, h = 0 -> No)
    if kstest(sample1) == 0 && kstest(sample2) == 0
        [h,p] = ttest(sample1, sample2,'Alpha',0.05);
    else
        [p,h] = ranksum(sample1, sample2);
    end
end