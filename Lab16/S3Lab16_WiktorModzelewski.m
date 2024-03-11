clc
close
clear

wybor = 4;

switch wybor
    case 1
        f = @(x,y) x.^2 + y.^2;
        xpocz = -10;
        ypocz = 10;
        xp = -10;
        xk = 10;
        yp = -10;
        yk= 10;
        h = 1;
        pk = 0.1;
    case 2
        f = @(x,y) (3.*(x.^4)) - ((2/3).*(y.^3)) + (2.*(x.^2) .* y) - (2.*(x.^2)) + (y.^2);
        xpocz = -1;
        ypocz = 1;
        xp = -1;
        xk = 0.4;
        yp = -1;
        yk= 1;
        h = 0.1;
        pk = 0.02;
    case 3
        f = @(x,y) 5*((x-1).^2) + 10*((y-3).^2);
        xpocz = -10;
        ypocz = 10;
        xp = -20;
        xk = 20;
        yp = -20;
        yk= 20;
        h = 1;
        pk = 0.2;
    case 4
        f = @(x,y) 100 .* ((y-(x.^2)).^2) + ((1-x).^2);
        xpocz = -2;
        ypocz = 3;
        xp = -2;
        xk = 2;
        yp = -1;
        yk= 3;
        h = 0.5;
        pk = 0.1;
end

eps = 10.^-4;

[x,y,dx,dy,it] = sww3(f,xpocz,ypocz,h,eps,xp,xk,yp,yk);

subplot(2,1,1)
[X,Y]=meshgrid(xp:pk:xk,yp:pk:yk);
mesh(X,Y,f(X,Y));
hold on
plot3(x,y,f(x,y),'r*');
x
y
f(x,y)

subplot(2,1,2);
z=f(X,Y);
[c,h] = contour(X,Y,z);
clabel(c,h);
hold on

plot(dx(1),dy(1),"r*");
text(dx(1),dy(1),"START");
plot(dx(end),dy(end),"r*");
text(dx(end),dy(end),"END");

line(dx,dy,'Color', 'k', 'Linewidth',1);
% for i=1:(length(dx) - 1)
%     line([dx(i),dy(i)],[dx(i+1),dy(i+1)],'Color', 'k', 'Linewidth',1);
%     contour(X,Y,z,[f(dx(i),dy(i)),f(dx(i+1),dy(i+1))]);
% end