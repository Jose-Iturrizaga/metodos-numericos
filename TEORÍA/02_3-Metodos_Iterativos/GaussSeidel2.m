function [x, j]= GaussSeidel2(A, b, x0, tol, kmax)

if nargin < 3 || isempty(x0)
    x0 = zeros(size(b));
end
if nargin < 4 || isempty(tol)
    tol = 1e-4;
end
if nargin < 5 || isempty(kmax)
    kmax = 100;
end

N=length(b);
x=zeros(N,1);
y=zeros(N,1);
for j=1:kmax
    for i=1:N
        x(i)=(b(i)/A(i,i))-(A(i,[1:i-1,i+1:N])*x0([1:i-1,i+1:N]))/A(i,i);
        x0(i)=x(i);
    end
    if abs(y-x)<tol
        break
    end
y=x;    
end
    