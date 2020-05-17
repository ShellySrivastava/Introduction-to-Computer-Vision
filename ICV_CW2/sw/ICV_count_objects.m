function [] = ICV_count_objects(videoFrames)
%UNTITLED22 Summary of this function goes here
%   Detailed explanation goes here
    ref_img = ICV_reference_image(videoFrames);
    gray_ref = ICV_rgb2gray(ref_img);
    [row, col, channel, nframe] = size(videoFrames);
    for i = 1: nframe
        frame = ICV_rgb2gray(videoFrames(:,:,:,i));
        diff_img = abs(double(frame)-double(gray_ref))>50;
        filled_image = ICV_fill_image(diff_img, 5);
        imshow(filled_image);
    end
    
    
end

