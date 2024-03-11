function [x,y,dx,dy,it] = sww2(f,xpocz,ypocz,h,eps,x1p,x1k,x2p,x2k)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
current_x = xpocz;
current_y = ypocz;
it = 0;
dx(1) = xpocz;
dy(1) = ypocz;
% first iteration
    it = it + 1;
    new = min([f(current_x+h,current_y),f(current_x-h,current_y),f(current_x,current_y-h),f(current_x,current_y+h),f(current_x,current_y),f(current_x+h,current_y+h),f(current_x+h,current_y-h),f(current_x-h,current_y+h),f(current_x-h,current_y-h)]);
    if new == f(current_x+h,current_y)
        current_x = current_x+h;
    elseif new == f(current_x-h,current_y)
        current_x = current_x-h;
    elseif new == f(current_x,current_y-h)
        current_y = current_y-h;
    elseif new == f(current_x,current_y+h)
        current_x = current_x-h;
    elseif new == f(current_x+h,current_y+h)
        current_x = current_x+h;
        current_y = current_y+h;
    elseif new == f(current_x-h,current_y+h)
        current_x = current_x-h;
        current_y = current_y+h;
    elseif new == f(current_x+h,current_y-h)
        current_x = current_x+h;
        current_y = current_y-h;
    elseif new == f(current_x-h,current_y-h)
        current_x = current_x-h;
        current_y = current_y-h;
    end
    dx(end+1) = current_x;
    dy(end+1) = current_y;
% subsequent iteration
while true
    it = it + 1;
    
    new = min([f(current_x+h,current_y),f(current_x-h,current_y),f(current_x,current_y-h),f(current_x,current_y+h),f(current_x,current_y),f(current_x+h,current_y+h),f(current_x+h,current_y-h),f(current_x-h,current_y+h),f(current_x-h,current_y-h)]);
    
    if ( (abs( (f(current_x+eps,current_y)-f(current_x-eps,current_y)) ./ (2*eps) ) < eps) && (abs( (f(current_x,current_y+eps)-f(current_x,current_y-eps)) ./ (2*eps) ) < eps) ) || it > 100
        break;
    elseif new == f(current_x,current_y)
        h = h ./ 2;
    elseif new == f(current_x+h,current_y)
        current_x = current_x+h;
    elseif new == f(current_x-h,current_y)
        current_x = current_x-h;
    elseif new == f(current_x,current_y-h)
        current_y = current_y-h;
    elseif new == f(current_x,current_y+h)
        current_x = current_x-h;
    elseif new == f(current_x+h,current_y+h)
        current_x = current_x+h;
        current_y = current_y+h;
    elseif new == f(current_x-h,current_y+h)
        current_x = current_x-h;
        current_y = current_y+h;
    elseif new == f(current_x+h,current_y-h)
        current_x = current_x+h;
        current_y = current_y-h;
    elseif new == f(current_x-h,current_y-h)
        current_x = current_x-h;
        current_y = current_y-h;
    end
    dx(end+1) = current_x;
    dy(end+1) = current_y;
end
x = current_x;
y = current_y;