function [swapped_matrix] = swap(swap_index,row_index,matrix)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
temp = matrix(swap_index,:);
matrix(swap_index,:) = matrix(row_index,:);
matrix(row_index,:) = temp;
swapped_matrix = matrix
return
end