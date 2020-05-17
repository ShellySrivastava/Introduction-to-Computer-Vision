function [LBP_hist] = ICV_histogram(image)
%UNTITLED18 Summary of this function goes here
%   Detailed explanation goes here
    array_index= 0:255;
    hist_value = zeros(1,256);
    [row, col] = size(image);
    for i = 1: row
        for j = 1: col
            hist_value(image(i,j)+1) = hist_value(image(i,j)+1) +1;
        end
    end
    LBP_hist = hist_value/sum(hist_value);
    figure;
    bar(array_index,LBP_hist,'r');
end

