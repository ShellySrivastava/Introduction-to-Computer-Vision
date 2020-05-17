function [grayscale] = ICV_rgb2gray(image)
%ICV_rgb2gray
%params(1): input image
%output: grayscale image
%definition: the function takes an rgb image and converts it into grayscale
%image
    grayscale = 0.3*image(:,:,1) + 0.59*image(:,:,2) + 0.11*image(:,:,3);
end

