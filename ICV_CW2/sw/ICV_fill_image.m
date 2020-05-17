function [filled_img] = ICV_fill_image(image,times)
%UNTITLED26 Summary of this function goes here
%   Detailed explanation goes here
    for i = 1: times
        dilated_img = ICV_dilate(image);
        image = dilated_img;
    end
    for i = 1: times
        eroded_img = ICV_erode(dilated_img);
        dilated_img = eroded_img;
    end
    filled_img = eroded_img;
end

