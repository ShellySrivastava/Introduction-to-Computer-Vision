function [error] = ICV_calc_error(block1,block2)
%ICV_calc_error
%   Params(2):
                % block1 is the block from frame at time t
                % block2 is the sub block from the search window
%   Output: gives the error between MSE between the two blocks
%   Description: this function calculates the error between the two blocks.
%   The errors can be MSE or MAE. MSE is implemented below.
[row, col] = size(block1);
error = (1/(row*col))*sum(sum((block1-block2).*(block1-block2)));

% uncomment the following line for MAE.
% error = (1/(row*col))*sum(sum(abs(block1-block2)));
end

