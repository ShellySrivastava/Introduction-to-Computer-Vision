function [new_image] = ICV_img_manipulation(image,mapping_matrix)

    % ICV_image_manipulation
    % params(2): image matrix to be manipulated, mapping matrix for the
    % manipulation
    % output: manipulated image
    
    % using forward mapping, find the new position of the extremes of the image
    [row, col, channel] = size(image);
    upper_left = mapping_matrix * [1;1];
    upper_right = mapping_matrix * [1;col];
    bottom_right = mapping_matrix * [row;col];
    bottom_left = mapping_matrix * [row;1];
    
    % Finding the corners of the image in the new image and assigning it to (x,y) co-ordinate
    % (x1,y1), (x2,y2), (x3,y3), and (x4,y4) assigned
    new_extremes = [upper_left.'; upper_right.'; bottom_right.'; bottom_left.'];
    % (x1,y1) is the lowest point on the x-axis
    [x1, index] = min(new_extremes(:,1));
    y1= new_extremes(index,2);
    % (x3,y3) is the highest point on the x-axis
    [x3, index] = max(new_extremes(:,1));
    y3 = new_extremes(index,2);
    % (x4,y4) is the lowest point on the y-axis
    [y4, index] = min(new_extremes(:,2));
    x4 = new_extremes(index,1);
    % (x2,y2) is the highest point on the y-axis
    [y2, index] = max(new_extremes(:,2));
    x2 = new_extremes(index,1);
    
    % width equals to the distance between the farthest columns i.e. y4 and y2
    width = abs(y4-y2);
    % height equals to the distance between the farthest rows i.e. x3 and x1
    height = abs(x3-x1);
    
    % creating a placeholder image for the new image with the new height
    % and width
    new_image = zeros(int32(height), int32(width));
    
    x1 = double(int32(x1));
    x3 = double(int32(x3));
    y2 = double(int32(y2));
    y4 = double(int32(y4));
    
    % the loop runs from top left to the bottom right of the new image.
    % It is an reverse mapping i.e. the points on the new image is mapped
    % to the points on the original image.
    % For pixels that correspond to the original image, the pixel value is
    % copied from the original image to the placeholder image.
    
    x=1;
    for i=x1:x3
        y=1;
        for j= y4:y2
            old_pos = mapping_matrix\[i;j];
            old_pos=int32(old_pos);
            if(old_pos(1)>1 && old_pos(2)>1 && old_pos(1)<=row && old_pos(2)<=col)
                new_image(x,y)= image(old_pos(1), old_pos(2)); 
            end
            y=y+1;
        end
        x=x+1;
    end
    
    new_image = uint8(new_image);

end