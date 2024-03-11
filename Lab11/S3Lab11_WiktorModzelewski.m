clc
clear all
close all

X =  [0, 10, 20, 30, 40, 50 ,60, 70, 80, 90, 100, 110, 120, 130, 140, 150];
YU = [0, 23, 24, 21, 17, 20, 22, 17,  9,  4,  14,  33,  40,  38,  31,   0];
YL = [0,-27,-30,-26, -9, -7,-10,-16,-18,-13,  -4, -13, -21, -25, -25,   0];

for n = 10:10:40
    figure
    text = sprintf('n = %i ', n);
    title(text)
    IP = linspace(0,150,n);
    
    U = griddedInterpolant(X,YU,'spline');
    L = griddedInterpolant(X,YL,'spline');
    
    h = 150 / (n - 1);
    a = 0;
    b = 150;
    
    sumU = 0;
    sumL = 0;
    for (i = 2:n-1)
        sumU = sumU + U(IP(i));
        sumL = sumL + L(IP(i));
    end
    sumU = 2*sumU;
    sumL = 2*sumL;
    
    IU = (h/2) * (U(a) + U(b) + sumU);
    IL = (h/2) * (L(a) + L(b) + sumL);
    format longG
    Integral = IU - IL

    hold on
    plot(linspace(0,150),U(linspace(0,150)));
    plot(linspace(0,150),L(linspace(0,150)));
    for i = 1:n-1
    patch('Vertices', [IP(i),0;IP(i+1),0;IP(i+1),U(IP(i+1));IP(i),U(IP(i))], ...
        'Faces', [1,2,3,4], ...
        'FaceColor', [0 0.4470 0.7410], ...
        'FaceAlpha', 0.4)
    patch('Vertices', [IP(i),0;IP(i+1),0;IP(i+1),L(IP(i+1));IP(i),L(IP(i))], ...
        'Faces', [1,2,3,4], ...
        'FaceColor', [0 0.4470 0.7410], ...
        'FaceAlpha', 0.4)
    end
end
% syms k
% IU = (h/2) * (U(a) + U(b) + (2 * symsum( U(IP(k)),k,2,n-1)) );
% IL = (h/2) * (L(a) + L(b) + (2 * symsum( L(IP(k)),k,2,n-1)) );