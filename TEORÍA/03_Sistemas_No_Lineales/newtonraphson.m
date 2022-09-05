function [raiz,numiter] = newtonraphson(f,df,x0,tol)

if nargin < 4 || isempty(tol)
    tol=1e6*eps;
end
numiter=0;
d = feval(f,x0)/feval(df,x0);
while abs(d) > tol
    x1 = x0-d;
    numiter = numiter+1;
    x0 = x1;
    d = feval(f,x0)/feval(df,x0);
end
raiz = x0;