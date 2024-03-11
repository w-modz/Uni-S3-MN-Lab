function [w1,w2] = algo_test(k)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
x = 10^k;
a = sqrt(1+x^2);
w1 = x - a
w2 = -1 / (x+a)
end