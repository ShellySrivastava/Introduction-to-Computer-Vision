function [predicted_image] = ICV_predicted_image(frame1, b_size, XSource, YSource, USource, VSource)
%ICV_predicted_image
    % Params(6):
                % frame1 is the frame at time t
                % b_size is the block size
                % XSource is the column value 
                % YSource is the row value
                % USource is x displacement vector
                % VSource is y displacement vector
                
    % Output: Predicted Image at time t+1
    
    %Description: this function takes frame at time t and the motion
    %vectors to predict the frame at time t+1

    predicted_image = double(frame1);
    [row, col]= size(XSource);
    for i = 1:3
        c_frame1 = frame1(:,:,i);
        c_predicted = predicted_image(:,:,i);
        for j = 1: col
            block = c_frame1(YSource(j):YSource(j)+b_size-1, XSource(j):XSource(j)+b_size-1);
%             c_predicted(YSource(j):YSource(j)+b_size-1, XSource(j):XSource(j)+b_size-1) = ones(b_size)*-10;
            c_predicted(YSource(j)+VSource(j):YSource(j)+VSource(j)+b_size-1,XSource(j)+USource(j):XSource(j)+USource(j)+b_size-1) = block;
        end
        c_predicted = uint8(c_predicted);
        predicted_image(:,:,i) = c_predicted; 
    end
    predicted_image = uint8(predicted_image);
    figure;
    imshow(predicted_image);   
    title("Predicted image")

end

