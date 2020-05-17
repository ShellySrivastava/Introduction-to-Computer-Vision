function [hist_intersection] = ICV_hist_intersection(hist1,hist2)
%UNTITLED20 Summary of this function goes here
%   Detailed explanation goes here
    hist_intersection = 0;
    for i=1:256
        hist_intersection = min(hist1(i),hist2(i)) + hist_intersection;
    end
end

