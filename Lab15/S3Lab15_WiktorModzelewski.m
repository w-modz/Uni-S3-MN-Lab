clc
close
clear

wybor = 5;

switch wybor
    case 1
        f = @(x,y) (x.^2) + (y.^2);
        xpocz = 8;
        ypocz = -10;
        x1p = -10;
        x1k = 10;
        x2p = -10;
        x2k= 10;
        h = 1;
     case 2
        f = @(x,y) -cos(x) .* cos(y) .* exp(-(x-pi).^2 - (y-pi).^2);
        xpocz = 2;
        ypocz = 2;
        x1p = 2;
        x1k = 4;
        x2p = 2;
        x2k= 4;
        h = 0.1;
    case 3
        f = @(x,y) (1 - (8*x) + (7*(x.^2)) - ((7/3)*(x.^3)) + ((1/4) .* (x.^4) ) ) .* ((y.^2) .* exp(-y));
        xpocz = 5;
        ypocz = 5;
        x1p = 0;
        x1k = 5;
        x2p = 0;
        x2k= 5;
        h = 0.2;
    case 4
        f = @(x,y) -cos(x).*cos(y).*exp(-1* ((x-pi).^2 + (y-pi).^2) );
        xpocz = 1.5;
        ypocz = 5;
        x1p = -10;
        x1k = 10;
        x2p = -10;
        x2k= 10;
        h = 0.5;
    case 5
        f = @(x,y) -cos(x).*cos(y).*exp(-1* ((x-pi).^2 + (y-pi).^2) );
        xpocz = 1.5;
        ypocz = 5;
        x1p = 1;
        x1k = 5;
        x2p = 1;
        x2k= 5;
        h = 0.5;
end

eps = 10.^-4;

[x,y,dx,dy,it] = sww2(f,xpocz,ypocz,h,eps,x1p,x1k,x2p,x2k);

subplot(2,1,1)
[X,Y]=meshgrid(x1p:0.1:x1k);
mesh(X,Y,f(X,Y));
hold on
plot3(x,y,f(x,y),'r*');
x
y
f(x,y)
it

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