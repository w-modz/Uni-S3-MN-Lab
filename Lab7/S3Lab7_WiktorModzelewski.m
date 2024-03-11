clear all
close all
clc
% Zad. 1.
X1 = [10, 30, 70, 120, 200, 250, 270, 280];
Y1 = [40, 45, 50, 73, 70, 50, 50, 40];

X2 = [0, 10, 40, 50, 80, 190, 210, 230, 260, 280];
Y2 = [30, 17, 15, 3, 15, 15, 0, 15, 15, 40];

X = linspace(0, 300);

Y3 = interp1(X1, Y1, X ,'linear');
Y4 = interp1(X2, Y2, X ,'linear');
figure
plot(X, Y3)
hold on
plot(X, Y4)

Y3 = interp1(X1, Y1, X ,'nearest');
Y4 = interp1(X2, Y2, X ,'nearest');
figure
plot(X, Y3)
hold on
plot(X, Y4)

Y3 = interp1(X1, Y1, X ,'pchip');
Y4 = interp1(X2, Y2, X ,'pchip');
figure
plot(X, Y3)
hold on
plot(X, Y4)

Y3 = interp1(X1, Y1, X ,'spline');
Y4 = interp1(X2, Y2, X ,'spline');
figure
plot(X, Y3)
hold on
plot(X, Y4)

% Zad. 2.
for k=1:3
    X = linspace(-15,15,5 * k);
    f = @(x) 1 ./ (x.^2 + 25);
    Y = f(X);

    Wan = zeros(5 * k, 1)+1;
    for (i=1:4)
        Wan = [Wan, X'.^i];
    end
    a = linsolve(Wan, Y')

    X1 = linspace(0,99);
    Y1 = f(X1);
    Wan = zeros(100, 1) + 1;
    % for (i=1:4)
    %     Wan = [Wan, X1'.^i];
    % end
    % Y2 = a' * Wan
end