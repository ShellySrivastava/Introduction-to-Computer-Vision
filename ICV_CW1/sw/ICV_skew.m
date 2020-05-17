function [skewed_img] = ICV_skew(image,degree)
    % ICV_skew
    % params(2): image matrix, degree
    % output: skewed image matrix
    %
    % Definition: this function takes the image and skews it by the degrees
    % mentioned.
    
    imshow(image);
    pause(1);
    % calculate the rotation matrix
    skew_mat = [1,0;1/tand(degree), 1];
    
    % call the manipulation function to construct the rotated image
    skewed_img = ICV_img_manipulation(image, skew_mat);
    
    imshow(skewed_img);
    imwrite(skewed_img,'skewed_img.jpg');
    pause(1);
end