function [XSource, YSource, USource, VSource] = ICV_motion_field_detection(img1,img2, b_size, s_size)
% ICV_motion_field_detection
%   Params(4):  img1 is the frame at time t
%               img2 is the frame at time t+1
%               b_size is the block size
%               s_size is the search window size
%   Output: the motion_field, superimposed at the frame t+1

%   Description: this function provides motion vectors as a set of arrows
%   superimposed on the frame t+1
    
    frame1 = ICV_rgb2gray(img1);
    frame2 = ICV_rgb2gray(img2);
    [row, col] = size(frame1);
    frame1 = double(frame1);
    frame2 = double(frame2);
    USource = [];
    VSource = [];
    XSource = [];
    YSource = [];
    for i = 1: b_size: row - b_size + 1
        for j = 1: b_size: col - b_size + 1
            block = frame1(i: i+ b_size-1, j:j+ b_size -1);
            offset_r = (s_size - b_size)/2;
            offset_l = b_size-1 + ((s_size - b_size)/2);
            if((i> offset_r) && (j> offset_r) && (i<= row - offset_l) && (j<= col - offset_l))
                search_window = frame2(i - offset_r:i+ offset_l, j - offset_r:j+ offset_l);
                [x,y] = ICV_search_block(block,search_window);
                new_pos_x = x + j - offset_r -1;
                new_pos_y = y + i - offset_r -1;
                if ((j ~= new_pos_x)  || (i ~= new_pos_y))
                    USource = [USource (new_pos_x - j)];
                    VSource = [VSource (new_pos_y - i)];
                    XSource = [XSource j];
                    YSource = [YSource i];
                end

            end
        end
    end
    figure;
    imshow(img1);
    title("Frame at time t")
    figure;
    imshow(img2);
    title("Frame at time t+1")
    figure;
    imshow(img2);
    title("Frame at time t+1 with motion field")
    hold on
    h = quiver(XSource + (b_size/2)-1, YSource + (b_size/2)-1, USource, VSource, 0);
    h.Color = 'r';

end

