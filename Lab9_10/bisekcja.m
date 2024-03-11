function [xb, nb] = bisekcja(f,a,b,tol)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
nb = 0;
if ( (f(a)*f(b)) > 0 )
    disp('Funkcja nie ma pierwiastka w przedziale <a,b>')
    xb = 0;
    return;
end
while((b-a)/2 > tol)
    nb = nb + 1;
    x0 = (a+b)/2;
    if(f(a) * f(x0) < 0)
        b = x0;
    else
        a = x0;
    end
end
xb = x0;
end