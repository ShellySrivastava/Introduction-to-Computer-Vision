function [LBP_image, LBP_hist] = ICV_LBP(image,w_size)
% creates the LBP image and histogram for it. 
% -1 w_sizemeans use the whole image orelse divide the image to window size
% as described by the w_size

    img_gray = ICV_rgb2gray(image);
    [row, col]= size(img_gray);
    img_gray = double(img_gray);
    if(w_size>-1)
        for i = 1: w_size :row - w_size +1
            for j = 1: w_size :col - w_size +1
                window = img_gray(i: i+w_size -1, j:j+w_size-1);
                figure;
                imshow(uint8(window))
                LBP_image = ICV_LBP_calculator(window);
                LBP_hist = ICV_histogram(LBP_image);
            end
        end
    else
        LBP_image = ICV_LBP_calculator(img_gray);
        LBP_hist = ICV_histogram(LBP_image);
    end
end

