function [x0,i] = nrmulvar3(fn,x0,tol,n)

if nargin < 3 || isempty(tol)
    tol=1e-8;
end
if nargin < 4 || isempty(n)
    n=1e3;
end    

fp=jacobian(fn);
for i=1:n
    F=double(fn(x0(1),x0(2),x0(3)));
    J=double(fp(x0(1),x0(2),x0(3)));
    y=-J\F;
    if norm(y)<tol
        break
    end
    x0=x0+y;
end