function [image] = ICV_reference_image(videoFrames)
    %ICV_reference_image
    %   Params(1): videoFrames
    %   Output: background image as image
    %   Description: the function generates the static background of the
    %   video using mode of the pixel value over time.
    [row, col, channel, nframe] = size(videoFrames);
    for i = 1: channel
        for x = 1: row
            for y = 1: col
                arr = [];
                for j = 1: nframe
                    arr = [arr videoFrames(x,y,i,j)];
                end
                p_img(x,y) = mode(arr);
            end
        end
    main_img(:,:,i)= uint8(p_img);
    end
    image = uint8(main_img);
    figure;
    imshow(image);
end

