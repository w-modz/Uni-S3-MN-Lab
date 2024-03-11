clc
clear all
close all

x = [datetime(2019,11,5,7,0,0), datetime(2019,11,5,11,0,0), datetime(2019,11,5,13,0,0), datetime(2019,11,5,19,0,0)];
y = [6,9,10,7];
z = datetime(2019,11,5,7,0,0):minutes(1):datetime(2019,11,5,19,0,0);
% len represents lenght of z
len = 721;
figure

L = ones(4,len);
for i=1:4
    for j = 1:4
        if i ~= j
            L(i,:) = L(i,:) .* ( (z-x(j)) ./ (x(i)-x(j)) );
        end
    end
end

p = y*L
hold on
plot(z,p)
date = datetime(2019,11,5,15,15,0);
hold on
plot(x,y,'o')
hold on
% 495 is the index of 15:15
plot(date,p(495),'g*')
format shortG
X = sprintf('Temperatura o %s wynosila: %s. stopni celsjusza',date,p(495));
disp(X)
%plot(x,max(p),'g*')
%plot(ymax,'o','MarkerSize',10);