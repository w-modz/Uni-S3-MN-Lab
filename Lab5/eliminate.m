function [eliminated_matrix] = eliminate(matrix,row_index)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[row_number column_number] = size(matrix);
for i = row_index+1:row_number
    if matrix(i,row_index) ~= 0
    matrix(i,:) = matrix(i,:) - (matrix(row_index,:) * matrix(i,row_index));
    end
end
if row_index > 1
    for i = row_index-1:-1:1
        if matrix(i,row_index) ~= 0
            matrix(i,:) = matrix(i,:) - (matrix(row_index,:) * matrix(i,row_index));
        end
    end
end
eliminated_matrix = matrix
end