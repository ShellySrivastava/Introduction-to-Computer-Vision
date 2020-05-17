function [LBP_image] = ICV_LBP_calculator(window)
%UNTITLED17 Summary of this function goes here
%   Detailed explanation goes here
    [row, col] = size(window);
    store = window;
    for i = 2: row -1
        for j = 2: col -1
            temp = window(i-1:i+1, j-1:j+1);
            temp = temp >= temp(2,2);
            store(i,j) = temp(2,1)*128 + temp(3,1)*64 + temp(3,2)*32 + temp(3,3)*16 + temp(2,3)*8 + temp(1,3)*4 + temp(1,2)*2 + temp(1,1)*1;
        end
    end
    LBP_image = uint8(store);
    figure;
    imshow(LBP_image);
end

