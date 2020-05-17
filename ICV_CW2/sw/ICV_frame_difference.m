function [diff_frame] = ICV_frame_difference(ref_frame,frame, threshold)
%
%   Detailed explanation goes here
gray_ref = ICV_rgb2gray(ref_frame);
gray_frame = ICV_rgb2gray(frame);

gray_ref = double(gray_ref);
gray_frame = double(gray_frame);

diff_frame = uint8(abs(gray_frame - gray_ref));
figure;
imshow(diff_frame);
title("without threshold");

diff_frame = diff_frame > threshold;
figure;
imshow(diff_frame);
title("with threshold");
end

