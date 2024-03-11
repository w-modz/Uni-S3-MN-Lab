clc
close all
% zad. 1.
format short
a = 0.2+0.2+0.2
a == 0.6
format long e
a
a == 0.6
% ze względu na błąd przybliżenia w dodawaniu binarnym, suma dziesiętnych
% 0.2 nie jest równa tej sumie zapisanej w systemie binarnym

% zad. 2. 
format long e
x = [exp(1),-pi,sqrt(2),-psi(1),log10(2)]
y = [1486.2497, 878366.9879,-22.37492, 4773714, 0.000185049]
a = x * y'
b = sum(x.*y)
c = 0;
for (i=1:5)
    c = c + x(i)*y(i);
    i = i+1;
end
c

d = 0;
for (i=5:-1:1)
    d = d+x(i)*y(i);
    i=i+1;
end
d
A = [abs(a-b) ,abs(a-c) , abs(a-d)]
figure
bar(A)
title("Błędy bezwzględne metod")

% zad. 3.
format long e
x= 29/13
y = 29-13*x
x1=29/1300
y1=29-1300*x1
% ze względu na mnożenie przez dużą liczbę którą jest 1300, błąd w
% zaokrągleniach przy obliczeniach binarnych się zwiększa i produkuje resztę w odejmowaniu,
% co prowadzi do niezerowego wyniku y1

% zad. 4.
B = []
for (i=4:10)
    [w1,w2] = algo_test(i);
    % przyjmujemy, że algorytm 2 jest dokładny
    B(i-3) = abs(w2-w1);

end
figure
bar(B)
title("Błędy bezwzględne algorytmu 1")

% dla wyższych k algorytm pierwszy zaczyna zwracać tylko zerowe wyniki,
% co prawdopodobnie jest spowodowane zaokrąglaniem na liczbach binarnych,
% podczas gdy algorytm drugi prawidłowo zwraca precyzyjnie coraz mniejsze wyniki

% zad. 5
d = 10^-3
x =  linspace(2-d , 2+d , 1000)
a1 = @(x) (x-2).^4
a2 = @(x) x.^4 - 8*x.^3 + 24.^2 - 32*x + 16
figure
plot(x,a1(x),'r')