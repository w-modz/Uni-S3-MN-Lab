function [xb,nb] = styczne(f,a,b,tol,ftol)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
nb = 0;
if ( (f(a)*f(b)) > 0 )
    disp('Funkcja nie ma pierwiastka w przedziale <a,b>')
    xb = 0;
    return;
end

if (f(a) >= 0 && ((f(a+ftol)-2*f(a)+f(a-ftol)) / (ftol^2)) >= 0)
    x0 = a;
else if (f(a) < 0 && ((f(a+ftol)-2*f(a)+f(a-ftol)) / (ftol^2)) < 0)
    x0 = a;
else
    x0 = b;
end

x1 = x0 - (f(x0) / ((f(x0+ftol)-f(x0-ftol)) / (2*ftol) ));
while (abs(f(x1)) > ftol && abs(x1 - x0) > tol)
    nb = nb +1;
    x0 = x1;
    x1 = x0 - ( f(x0) / ((f(x0+ftol)-f(x0-ftol)) / (2*ftol) ));
end
xb = x1;
end