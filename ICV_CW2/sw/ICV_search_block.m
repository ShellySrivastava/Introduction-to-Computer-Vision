function [x,y] = ICV_search_block(block,search_window)
    %ICV_search_block
    % Params(2): 
                % block is the part of the frame at time t
                % search_window is the part of the frame at time t+1
    % Output: the co-ordinates of the block when found in the search window
    
    % Description: the function performs an exhaustive search of the block
    % in the given search window and return the new co-ordinates of the
    % block
    
    [rowb, colb] = size(block);
    [row, col] =  size(search_window);
    min_error = Inf;
    block = double(block);
    search_window = double(search_window);
    for i = 1: row - rowb +1
        for j = 1: col - colb +1
            sub_mat = search_window(i:i+rowb -1,j:j+colb-1);
            error = ICV_calc_error(block, sub_mat);
            if(error<=min_error)
                x = j;
                y = i;
                min_error = error;
            end
        end
    end
end

