clc
clear all
close all
% A = [2,1;3,3;2,0;1,0;0,1]
% B = [10;24;8;0;0]
% Z = [-1;-1;-1;1;1]
% F = [300,200]

A = [0.1,0.2;0.3,0.1;0.5,0;1,0;0,1]
B = [300;300;400;0;0]
Z = [-1;-1;-1;1;1]
F = [90,55]

P = [];
% tworzenie macierzy punktow przeciecia
for a = 1:size(A,1)
    for b = a+1:size(A,1)
        C = [A(a,:);A(b,:)];
        D = [B(a);B(b)];
        if det(C) ~= 0
            P = [P, inv(C) * D];
        end
    end
end
% tworzenie macierzy dopuszczalnych punktow przeciecia
W = [];
S = A*P;
for i = 1:size(P,2)
    L = true;
    for j = 1:size(A,1)
        if ( S(j,i) - B(j) ) * Z(j) < 0
            L = false;
        end
    end
    if L
        W = [W, P(:,i)]
    end
end

% wyznaczanie punktu maksymalnego zysku
G = F*W;
max_index = 1;
for i = 1:size(W,2)
    if (G(i) > G(max_index))
        max_index = i;
    end
end
msg = ["Maksymalny zysk to:", G(max_index), "dla punktu: ", W(1,max_index), W(2,max_index)];
disp(msg);
figure
hold on

% wyznaczanie maksymalnych x i y na wykresie
max_x = max(P(1,:));
max_y = max(P(2,:));
% ograniczenia osi wykresu
xlim([0 max([max_x, max_y])]);
ylim([0 max([max_x, max_y])]);
% zaznaczanie ograniczen
for i = 1:size(A,1)
    a = A(i,1);
    b = A(i,2);
    c = B(i);
    if (A(i,2) == 0)
        y = 0:0.1:max_y;
        x = c/a + y*0;
    else
        x = [0:0.1:max_x];
        y = -(a/b) * x + (c/b);
    end
    plot(x,y,'color', "black");
end

% tu skonczyles
% for i = 1:size(W,2)
%     c = (-F(1) * W(i,1)) - (F(2) * W(i,2));
%     y = -(W(i,1)/W(i,2)) * X + (W(i,1)/W(i,2) * )
%     plot()
% end

% kolorowanie obszaru rozwiazan
id = convhull(W(1,:),W(2,:));
fill(W(1,id),W(2,id), [1 0.9 0])

% zaznaczanie punktow przeciecia
for i = 1:size(W,2)
    plot(P(1,i),P(2,i),"blue o");
end
% zaznaczanie dopuszczalnych punktow przeciecia
for i = 1:size(W,2)
    plot(W(1,i),W(2,i),"ro");
end

% drukowanie gradientu
x = [0:0.1:max_x];
G = @(x) x * (F(2) / F(1));
%g = -F(2) / F(1) + x*0;
plot(x,G(x),"color", "magenta")

for i = 1:size(W,2)
    c = (F(1,1) * W(1,i)) + (F(1,2) * W(2,i));
    y = -(F(1,1)/F(1,2)) * (x-W(1,i)) + W(2,i);
    if (i == max_index)
    plot(x,y,'color','green');
    else
    plot(x,y,'color','black','LineStyle',':');
    end
end