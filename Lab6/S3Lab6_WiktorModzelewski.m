% Przyklad 1
%A = [2,2,1; 1,4,1; 0,1,2]

% Przyklad 2
A = [4,1,4;2,-1,2;0,1,2]
b = [2,-4,-1]

% Przyklad 3
%A = [2,2,1,-1;0,3,1,2;1,2,2,1;1,1,1,0]
%b = [6,-1,4,4]

% Zad. 1
[rows,cols] = size(A);
n = rows;
L = eye(n);
U = zeros(n);
for i=1:n
    for j=i:n
        U(i,j) = A(i,j) - L(i, 1:i-1)*U(1:i-1, j);
    end
    for j = i+1:n
        L(j,i) = (A(j,i) - L(j, 1:i-1)*U(1:i-1, i)) / U(i,i);
    end
end
[B,C] = lu(A,"matrix")
B*C==L*U

% Zad.2
X = zeros(n,1);
Y = zeros(n,1);
Y(1) = b(1);
for i=2:n
    Y(i) = b(i) - L(i,1:i-1)*Y(1:i-1);
end
X(n)=Y(n)/U(n,n);
for i=n-1:-1:1
    X(i) = (Y(i)- (U(i,i+1:n)*X(i+1:n))) / U(i,i);
end
X
