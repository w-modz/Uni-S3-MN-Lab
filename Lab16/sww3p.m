function [x,y,dx,dy,it] = sww3p(f,xpocz,ypocz,h,eps,x1p,x1k,x2p,x2k)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
current_x = xpocz;
current_y = ypocz;
it = 0;
dx(1) = xpocz;
dy(1) = ypocz;

% first iteration
    it = it + 1;
    der_x = ( f(current_x+eps , current_y) - f(current_x-eps , current_y) ) / (2*eps);
    der_y = ( f(current_x , current_y+eps) - f(current_x , current_y-eps) ) / (2*eps);
    norm = sqrt( (der_x.^2) + (der_y.^2) );
    current_x = current_x - der_x / norm * h;
    current_y = current_y - der_y / norm * h;
    dx(end+1) = current_x;
    dy(end+1) = current_y;
    old_dx = der_x;
    old_dy = der_y;
% subsequent iteration
while true
    if (it > 200 || norm < eps)
        break;
    end
    it = it + 1;
    der_x = (f(current_x+eps,current_y) - f(current_x-eps,current_y) ) / (2*eps);
    der_y = (f(current_x,current_y+eps) - f(current_x,current_y-eps) ) / (2*eps);
    norm = sqrt( (der_x.^2) + (der_y.^2) );
    current_x = current_x - der_x / norm * h;
    current_y = current_y - der_y / norm * h;
    dx(end+1) = current_x;
    dy(end+1) = current_y;
    if (old_dx * der_x < 0 && old_dy * der_y < 0)
        h = h/2;
    end
    old_dx = der_x;
    old_dy = der_y;
end
x = current_x;
y = current_y;