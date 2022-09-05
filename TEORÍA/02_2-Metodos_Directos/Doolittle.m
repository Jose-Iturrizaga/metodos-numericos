function x = Doolittle(A,b)

n = size(A,1);
L = eye(n); U = zeros(n,n);

for i = 1:n
    U(i,i) = A(i,i)-L(i,1:i-1)*U(1:i-1,i);
    for j = i+1:n
        U(i,j) = A(i,j)-L(i,1:i-1)*U(1:i-1,j);
        L(j,i) = (A(j,i)-L(j,1:i-1)*U(1:i-1,i))/U(i,i);
    end
end

y = zeros(n,1);
y(1) = b(1);
for i = 2:n
    y(i) = b(i)-L(i,1:i-1)*y(1:i-1);
end

x = zeros(n,1);
x(n) = y(n)/U(n,n);
for i = n-1: -1:1
    x(i) = (y(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);
end
end
