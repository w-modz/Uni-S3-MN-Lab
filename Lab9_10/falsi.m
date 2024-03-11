function [xf, nf] = falsi(f,a,b,tol,ftol)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
nf = 0;
if ( (f(a)*f(b)) > 0 )
    disp('Funkcja nie ma pierwiastka w przedziale <a,b>')
    xf = 0;
    return;
end

if (f(a) >= 0 && ((f(a+ftol)-2*f(a)+f(a-ftol)) / (ftol^2)) >= 0)
    xs = a;
    x0 = b;
else if (f(a) < 0 && ((f(a+ftol)-2*f(a)+f(a-ftol)) / (ftol^2)) < 0)
    xs = a;
    x0 = b;
else
    xs = b;
    x0 = a;
end
while (abs(f(x0)) > ftol)
    nf = nf+1;
    x0 = xs - (f(xs)/ (f(x0)-f(xs)))*(x0-xs);

end
xf = x0;
end