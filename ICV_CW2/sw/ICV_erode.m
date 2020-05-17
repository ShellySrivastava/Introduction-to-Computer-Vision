function [eroded_img] = ICV_erode(image)
%UNTITLED23 Summary of this function goes here
%   Detailed explanation goes here
    [row, col] = size(image);
    eroded_img = zeros(row, col);
    for x=2: row - 1
        for y=2: col - 1
            if(sum(sum(image(x-1:x+1,y-1:y+1))) < 9)
                eroded_img(x,y)= 0;
            else
                eroded_img(x,y)= 1;
            end
        end
    end
end

