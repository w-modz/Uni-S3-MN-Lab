function [normalized_vector] = normalize(vector)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
current = 1;
first_value = 0;
while (vector(current) == 0)
    current = current +1;
end
first_value = vector(current);
for i = 1:length(vector)
    vector(i) = vector(i) ./ first_value;
end
normalized_vector = vector
return
end