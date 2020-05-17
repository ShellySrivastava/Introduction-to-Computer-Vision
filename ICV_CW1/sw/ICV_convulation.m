function [filtered_img] = ICV_convulation(image,kernel)
    % ICV_convulation
    % params(2): image, kernel
    % output: resulting image
    
    % Divide the sum of the kernel from the kernel if the sum is greater
    % than 0 to avoid adding energy
    sum_kernel = sum(sum(kernel));
    if(sum_kernel > 1)
        kernel = (1/sum_kernel)*kernel;
    end 
    
    % convert the image to a grayscale image
    [row, col, channel] = size(image);
    if(channel == 3)
        grayscale = 0.3*image(:,:,1) + 0.59*image(:,:,2) + 0.11*image(:,:,3);
    else
        grayscale = image;
    end
    imshow(grayscale);
    pause(1);
    
    % determine the offset for row and column so that the loop runs for the
    % specified rows and column (leaving out the outermost pixel values for the case of 3x3 kernel)
    
    grayscale = double(grayscale);
    [kernel_row, kernel_col] = size(kernel);
    offset_row = int32(kernel_row /2) -1;
    offset_col = int32(kernel_col /2) -1;

    filtered_img = zeros(row,col);
    
    %loop for multiplication of the kernel values with its corresponding
    %pixels in the image, adding the results and storing it in the middle
    %location.
    for x=offset_row+1: row - offset_row
        for y=offset_col+1: col - offset_col
            filtered_img(x,y)= uint8(sum(sum(kernel.*grayscale(x-offset_row:x+offset_row,y-offset_col:y+offset_col))));
        end
    end
    
    filtered_img = uint8(filtered_img);
    imshow(filtered_img);
    imwrite(filtered_img,'filtered_img.jpg');
    pause(1);
end