clc
close all
clear all

wybor = 6;

switch wybor
    case 1
        f = @(x) cos(x);
        a=0;
        b=2;
    case 2
        f = @(x) 2.^(-x) + exp(x) + 2*cos(x) - 6;
        a = 1;
        b = 3;
    case 3
        f = @(x) (x+2).^5;
        a = -3;
        b = 0;
    case 4
        f = @(x) exp(x-1) - 2;
        a = -1;
        b = 2;
    case 5
        f = @(x) log( x+(2/3) );
        a = -0.5;
        b = 2;
    case 6
        f = @(x) (x.^3) - (2*x) - 5;
        a = 0;
        b = 3;
    otherwise
end

tol = 10^(-5);
ftol = 10^(-4);


tic();
[xb,nb] = bisekcja(f,a,b,tol)
toc()

tic();
[xf,nf] = falsi(f,a,b,tol,ftol)
toc()

tic();
[xs,ns] = sieczne(f,a,b,tol,ftol)
toc()

tic();
[xi,ni] = styczne(f,a,b,tol,ftol)
toc()

t = a:0.01:b;
plot(t,f(t))
set(gca,'Color','k')
hold on;
plot(xb,f(xb),'ro')
plot(xf,f(xf),'rx')
plot(xs,f(xs),'g+')
plot(xs,f(xi),'g*')