function [raiz,numiter] = newtonraphsonm(f,df,x0,m,tol)

if nargin < 5 || isempty(tol)
    tol=1e6*eps;
end
numiter=0;
d = feval(f,x0)/feval(df,x0);
while abs(d) > tol
    x1 = x0-m*d;
    numiter = numiter+1;
    x0 = x1;
    d = feval(f,x0)/feval(df,x0);
end
raiz = x0;