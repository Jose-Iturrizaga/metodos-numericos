function [x2,i]=secan(f,x0,x1,tol,n)

if nargin < 4 || isempty(tol)
    tol=1e6*eps;
end
if nargin < 5 || isempty(n)
    n=1e3;
end
    
for i=1:n
    x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
    if abs(x2-x1)<tol
        break
    end
    x0=x1;x1=x2;
end