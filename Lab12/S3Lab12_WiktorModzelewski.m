clc
clear all
close all

% zad 1.
f = @(x) cos(2*x);
der = @(x) -2*sin(2*x);
def = @(x,h)  (f(x+h) - f(x)) / h;
tri = @(x,h) (f(x+h) - f(x-h)) / (2*h);
pent = @(x,h) ( -f(x+(2*h)) +  (8*f(x+h)) - (8*f(x-h)) + f(x-(2*h)) ) / (12*h);
X = linspace(0,6);

d = der(X);

figure('Name',"Zadanie 1")
for i = 1:9
    subplot(3,3,i)
    if i == 1 || i == 4 || i == 7
        h = 1;
    elseif i == 2 || i == 5 || i == 8
        h = 0.5;
    else
        h = 0.25;
    end
    if i <= 3
        plot(X,def(X,h))
        p = def(X,h);
        mse = 1/length(d)*sum((d-p).^2);
        title(['2pkt: h = ',num2str(h), ' blad: ',num2str(mse)])
    elseif i == 4 || i == 5 || i == 6
        plot(X,tri(X,h))
        p = tri(X,h);
        mse = 1/length(d)*sum((d-p).^2);
        title(['3pkt: h = ',num2str(h), ' blad: ',num2str(mse)])
    else
        plot(X,pent(X,h))
        p = pent(X,h);
        mse = 1/length(d)*sum((d-p).^2);
        title(['5pkt: h = ',num2str(h), ' blad: ',num2str(mse)])
    end
    hold on
    plot(X,der(X),'red')
end
% 5-cio punktowy wzor daje najlepsza dokladnosc wyznaczania pochodnej,
% a zmniejszenie kroku zwieksza dokladnosc obliczen

% zad.3
f = @(x) cos(4*x) - (1/2)*x;
X = linspace(0,5);
der = @(x) -16*cos(4*x);
tri = @(x,h) (f(x+h) - (2*f(x)) + f(x-h)) / h.^2;
pent = @(x,h) (-f(x+(2*h)) +(16*f(x+h)) - (30*f(x)) + (16*f(x-h)) - f(x-(2*h)) ) / (12*(h.^2));
d = der(X);

figure('Name',"Zadanie 3")
for i = 1:6
    subplot(2,3,i)
    if i == 1 || i == 4
        h = 1;
    elseif i == 2 || i == 5
        h = 0.5;
    else
        h = 0.25;
    end
    if i <= 3
        plot(X,tri(X,h))
        p = tri(X,h);
        mse = 1/length(d)*sum((d-p).^2);
        title(['3pkt: h = ',num2str(h), ' blad: ',num2str(mse)])
    else
        plot(X,pent(X,h))
        p = pent(X,h);
        mse = 1/length(d)*sum((d-p).^2);
        title(['5pkt: h = ',num2str(h), ' blad: ',num2str(mse)])
    end
    hold on
    plot(X,der(X),'red')
end
% 5-cio punktowy wzor daje najlepsza dokladnosc wyznaczania pochodnej,
% a zmniejszenie kroku zwieksza dokladnosc obliczen