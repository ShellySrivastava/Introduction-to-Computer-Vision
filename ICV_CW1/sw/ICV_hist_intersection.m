function [hist_intersection] = ICV_hist_intersection(image1,image2, normalization)
    %ICV_hist_intersection
    % params(3): image1, image2 (for comparision) and normalization (true or false)
    % output: histogram intersection value
    % definition: this function takes two images and compares them through
    % histogram intersection 
    
    % creating the histogram for image 1
    pic2_r = image1(:,:,1);
    pic2_g = image1(:,:,2);
    pic2_b = image1(:,:,3);

    array_index= 0:255;
    [row, col] = size(pic2_r);
    array_I = zeros(1,256);

    for i=1: row
        for j = 1:col
            array_I(pic2_r(i,j)+1) = array_I(pic2_r(i,j)+1) +1;
            array_I(pic2_g(i,j)+1) = array_I(pic2_g(i,j)+1) +1;
            array_I(pic2_b(i,j)+1) = array_I(pic2_b(i,j)+1) +1;
        end
    end
    
    % Normalize the array by the total number of pixels if the
    % normalization is set to true
    if(normalization == true)
        array_I = array_I/sum(array_I);
    end
    hold off
    % plot the histogram for image1
    bar(array_index,array_I, 'b');
    saveas(gcf,'bar1.jpg');
    pause(1);

    % create the histogram for image2
    array_M = zeros(1,256);

    pic2_r = image2(:,:,1);
    pic2_g = image2(:,:,2);
    pic2_b = image2(:,:,3);
    [row, col] = size(pic2_r);
    for i=1: row
        for j = 1:col
            array_M(pic2_r(i,j)+1) = array_M(pic2_r(i,j)+1) +1;
            array_M(pic2_g(i,j)+1) = array_M(pic2_g(i,j)+1) +1;
            array_M(pic2_b(i,j)+1) = array_M(pic2_b(i,j)+1) +1;
        end
    end
    
    % Normalize the array by the total number of pixels if the
    % normalization is set to true
    if(normalization == true)
        array_M = array_M/sum(array_M);
    end
    
    % plot the histogram for image 2
    bar(array_index,array_M, 'r');
    saveas(gcf,'bar2.jpg');
    pause(1);

    bar(array_index,array_I, 'b');
    hold on
    x= bar(array_index,array_M, 'r');
    alpha(x, 0.5);
    saveas(gcf,'bar3.jpg');
    hold off
    % calculate the histogram intersection
    hist_intersection =0;
    for i=1:256
        hist_intersection = min(array_I(i),array_M(i)) + hist_intersection;
    end

end

