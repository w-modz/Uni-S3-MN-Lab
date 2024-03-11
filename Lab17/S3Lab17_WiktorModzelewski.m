clc
close
clear

wybor = 3;

switch wybor
    case 1
        f = @(x,y) x.^2 + y.^2;
        xpocz = -10;
        ypocz = 10;
        xp = -10;
        xk = 10;
        yp = -10;
        yk= 10;
        pk = 0.1;
        h = 1;
    case 2
        f = @(x,y) (3.*(x.^4)) - ((2/3).*(y.^3)) + (2.*(x.^2) .* y) - (2.*(x.^2)) + (y.^2);
        xpocz = -1;
        ypocz = 1;
        xp = -1;
        xk = 1;
        yp = -1.5;
        yk= 1;
        pk = 0.02;
        h = 0.1;
    case 3
        f = @(x,y) (1 - (8.*x) + (7.*(x.^2)) - ((7/3).*(x.^3)) + ((1/4).*(x.^4)) ) .* ((y.^2) .* exp(-y));
        xpocz = 5;
        ypocz = 5;
        xp = 0;
        xk = 5;
        yp = 0;
        yk = 5;
        pk = 0.1;
        h = 0.5;
    case 4
        f = @(x,y) 100 .* ((y-(x.^2)).^2) + ((1-x).^2);
        xpocz = -2;
        ypocz = 3;
        xp = -2;
        xk = 2;
        yp = -1;
        yk= 3;
        pk = 0.1;
        h = 0.5;
end

eps = 10.^-4;

[x,y,k,dx,dy] = mns(f,xpocz,ypocz,eps,xp,xk,yp,yk);
[x2,y2,dx2,dy2,it2] = sww3(f,xpocz,ypocz,h,eps,xp,xk,yp,yk);

subplot(3,1,1)
[X,Y]=meshgrid(xp:pk:xk,yp:pk:yk);
mesh(X,Y,f(X,Y));
hold on
plot3(x,y,f(x,y),'r*');
x
y
k
f(x,y)

subplot(3,1,2);
z=f(X,Y);
[c,h] = contour(X,Y,z);
clabel(c,h);
hold on

plot(dx(1),dy(1),"r*");
text(dx(1),dy(1),"START");
plot(dx(end),dy(end),"r*");
text(dx(end),dy(end),"END");

line(dx,dy,'Color', 'k', 'Linewidth',1);

subplot(3,1,3);
hold on
plot(1:1:k,dx,"blue");
plot(1:1:k,dy,"red");
% plot(0:1:it2,dx2,"--blue");
% plot(0:1:it2,dy2,"--red");
% for (i = 1:k) 
%     plot(dx(i),i,"red");
%     plot(dy(i),i,"blue");
% end