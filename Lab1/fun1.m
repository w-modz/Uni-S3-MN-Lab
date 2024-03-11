function [outputArg1,outputArg2] = fun1(matrix)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
matrix_rows = size(matrix,1)
matrix_cols = size(matrix,2)
index1 = 1
index2 = 1
for index1 <= matrix_rows
    index1++
    if index1 == matrix_rows
        index1 = 1
    end
    for index2 <= matrix_cols
        index2++
        if matrix(index1,index2) 

        if index2 == matrix_cols
            index2 = 1
        end
           
end