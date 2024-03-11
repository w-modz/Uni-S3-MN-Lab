function [xb,nb] = sieczne(f,a,b,tol,ftol)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
nb = 0;
if ( (f(a)*f(b)) > 0 )
    disp('Funkcja nie ma pierwiastka w przedziale <a,b>')
    xb = 0;
    return;
end

if (f(a) >= 0 && ((f(a+ftol)-2*f(a)+f(a-ftol)) / (ftol^2)) >= 0)
    x0 = a;
    x1 = b;
else if (f(a) < 0 && ((f(a+ftol)-2*f(a)+f(a-ftol)) / (ftol^2)) < 0)
    x0 = a;
    x1 = b;
else
    x0 = b;
    x1 = a;
end

x2 = x1 - (f(x1) * ((x1-x0) / (f(x1) - f(x0))));
while (abs(f(x2)) > ftol && abs(x2 - x1) > tol)
    nb = nb +1;
    x0 = x1;
    x1 = x2;
    x2 = x1 - (f(x1) * ((x1-x0) / (f(x1) - f(x0))));
end
xb = x2;
end