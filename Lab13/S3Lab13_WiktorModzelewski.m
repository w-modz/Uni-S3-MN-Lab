clc
clear all
close all

eps = 10.^-4;
h = 10.^-5;

for (wybor = 1:4)
    switch wybor
        case 1
            f = @(x) x.^2 - x;
            a = 1/4;
            b = 3/4;
        case 2
            f = @(x) (1/3*(x.^2)) - (13/7*x) + 11;
            a = -10;
            b = 10;
        case 3
            f = @(x) (x.^4) - (12*(x.^3)) + x + 4;
            a = -2;
            b = 2;
        case 4
            f = @(x) -(x.^3) + (3*(x.^2)) - (3*x);
            a = -2;
            b = -1;
    end
    
    [x1, n1] = met_polowienia(f, a, b, eps);
    [x2, n2] = met_newtona(f, a, b, eps);
    
    figure('Name',"Przyklad " + wybor)
    t = a:0.01:b;
    plot(t, f(t))
    hold on;
    plot(x1, f(x1), 'ro')
    plot(x2, f(x2), 'rx')
    disp("Przyklad " +wybor);
    disp("n1 = "+n1);
    disp("n2 = "+n2);
    disp(" ");
end