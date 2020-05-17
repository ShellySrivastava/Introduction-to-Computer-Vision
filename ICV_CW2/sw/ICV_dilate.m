function [dilated_img] = ICV_dilate(image)
%UNTITLED23 Summary of this function goes here
%   Detailed explanation goes here
    [row, col] = size(image);
    dilated_img = zeros(row, col);
    for x=2: row - 1
        for y=2: col - 1
            if(sum(sum(image(x-1:x+1,y-1:y+1))) >= 1)
                dilated_img(x,y)= 1;
            else
                dilated_img(x,y)= 0;
            end
        end
    end
end

