function [] = ICV_histogram(image)
    % ICV_histogram
    % params(1): rgb image
    % definition: Visualises the histogram of the rgb image
    pic_r = image(:,:,1);
    pic_g = image(:,:,2);
    pic_b = image(:,:,3);
    
    % determine the pixel values from 0 to 255
    array_index= 0:255;
    
    % array_r, array_g and array_b are the placeholders for the pixel
    % intensities of different channels
    [row, col] = size(pic_r);
    array_r = zeros(1,256);
    array_g = zeros(1,256);
    array_b = zeros(1,256);
    
    % loop runs for all the pixels in the channel
    % it increments the count at array(pixel_intensity +1) position
    % because indexing for arrays in matlab is from 1 and pixel
    % instensities vary from 0 to 255
    for i=1: row
        for j = 1: col
            array_r(pic_r(i,j)+1) = array_r(pic_r(i,j)+1) +1;
            array_g(pic_g(i,j)+1) = array_g(pic_g(i,j)+1) +1;
            array_b(pic_b(i,j)+1) = array_b(pic_b(i,j)+1) +1;
        end
    end
    
    % Plot all the histograms in one graph with hold on. Alpha method is
    % used to determine the transparency of the bar graphs
    hold off
    bar(array_index,array_r,'r');
    hold on
    p = bar(array_index,array_g,'g');
    alpha(p,0.7)
    q = bar(array_index,array_b,'b');
    alpha(q, 0.5)
    hold off
    
    saveas(gcf, 'bar.png');
end

