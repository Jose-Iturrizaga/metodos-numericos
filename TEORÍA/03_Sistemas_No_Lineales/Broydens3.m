function [x0, i]=Broydens3(fn,x0,tol,n)

if nargin < 3 || isempty(tol)
    tol=1e-8;
end
if nargin < 4 || isempty(n)
    n=1e3;
end 

fp=jacobian(fn);

%Primera iteracion newton (i=1)
