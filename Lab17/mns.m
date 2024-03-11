function [x,y,k,dx,dy] = mns(f,xpocz,ypocz,eps,x1p,x1k,x2p,x2k)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
optimset('TolX',1e-6,'TolFun',1e-6);
k = 1;
xk = xpocz;
yk = ypocz;
dx(k) = xk;
dy(k) = yk;

k = k + 1;
g = @(a) f(xk-a*fx,yk-a*fy);
der_x = ( f(xk+eps , yk) - f(xk-eps , yk) ) / (2*eps);
der_y = ( f(xk , yk+eps) - f(xk , yk-eps) ) / (2*eps);
g = @(a) f(xk-a*der_x,yk-a*der_y);
norm = sqrt( (der_x.^2) + (der_y.^2) );
m = fminbnd(g,0,1,optimset('TolX',1e-6,'TolFun',1e-6));
xk = xk -m* der_x;
yk = yk -m* der_y;
dx(k) = xk;
dy(k) = yk;

while (norm > eps && k < 200)
    k = k + 1;
    der_x = ( f(xk+eps , yk) - f(xk-eps , yk) ) / (2*eps);
    der_y = ( f(xk , yk+eps) - f(xk , yk-eps) ) / (2*eps);
    g = @(a) f(xk-a*der_x,yk-a*der_y);
    norm = sqrt( (der_x.^2) + (der_y.^2) );
    m = fminbnd(g,0,1,optimset('TolX',1e-6,'TolFun',1e-6));
    xk = xk -m* der_x;
    yk = yk -m* der_y;
    dx(k) = xk;
dy(k) = yk;
end
x = xk;
y = yk;

% dx(k) = xk;
% dy(k) = yk;
end