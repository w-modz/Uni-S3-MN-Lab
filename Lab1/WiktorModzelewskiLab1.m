a = 6
b = 5.5
A = [1,2,3,4]
A = [1;2;3;4]
B = [-12,-11,-10,-9
    8,7,6,5
    1,2,3,4]
%zad1
suma_elementow_1 = sum(B(1,1:4))
suma_elementow_2 = sum(B(2,1:4))
suma_elementow_3 = sum(B(3,1:4))

%zad2
min1 = min(B(1,1:4))
min2 = min(B(2,1:4))
min3 = min(B(3,1:4))

%zad3
%mozna tylko mnozyc macierz przez wektor
B*A
%zad4
M = B([1,3],[1,2,3,4])
%zad5
%pomocniczy wektor do zadania
A2 = A

A(end+1) = 1
A(end+1) = 2
A(end+1) = 3
A2 = [A2 ;a;a;b]

%zad6
temp = [sum(B(1,1:4));sum(B(2,1:4));sum(B(3,1:4))]
B = [B temp]

%zad7
C = randi(10,5,4)