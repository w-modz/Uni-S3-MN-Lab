function [solution] = gauss(input_matrix,vector)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
full_matrix = [input_matrix vector'];
[row_number column_number] = size(full_matrix);

for current_column = 1:column_number-1
    highest_index = 1;
    for i = 1:row_number
        if full_matrix(i,current_column) == max(full_matrix(:,current_column));
            highest_index = i;
        end
    end
    full_matrix = swap(current_column,highest_index,full_matrix);
    full_matrix(current_column,:) = normalize(full_matrix(current_column,:));
    full_matrix = eliminate(full_matrix,current_column);
end
solution = [];
for i=1:row_number
    solution = [solution,full_matrix(i,i) * full_matrix(i,column_number)];
end
return
end