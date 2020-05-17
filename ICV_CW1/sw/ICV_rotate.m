function [rotated_img] = ICV_rotate(image,degree)
    % ICV_rotate
    % params(2): image matrix, degree of rotation
    % output: rotated image matrix
    %
    % Definition: this function takes the image and rotates it by the degrees
    % mentioned.
    
    imshow(image);
    pause(1);
    % calculate the rotation matrix
    rotation_mat = [cosd(degree), -sind(degree); sind(degree), cosd(degree)];
    
    % call the manipulation function to construct the rotated image
    rotated_img = ICV_img_manipulation(image, rotation_mat);
    
    imshow(rotated_img);
    imwrite(rotated_img,'rotated_img.jpg');
    pause(1);
end