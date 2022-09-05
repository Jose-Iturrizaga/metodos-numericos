function [x, k] = grad(A,b,x0,tol)

if nargin < 3 || isempty(x0)
    x0 = zeros(size(b));
end
if nargin < 4 || isempty(tol)
    tol = 1e-10;
end

r0=b-A*x0;k=0;
while norm(r0)>=tol
    k=k+1;
    Rho=(r0'*r0)/(r0'*A*r0);
    x1=x0+Rho*r0;
    x0=x1;
    r0=b-A*x0;
end
x=x0;