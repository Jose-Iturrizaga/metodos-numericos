function [c,i]=bisec(f,a,b,tol,n)

if nargin < 4 || isempty(tol)
    tol=1e6*eps;
end
if nargin < 5 || isempty(n)
    n=1e3;
end

if f(a)*f(b)<0
    for i=1:n
        c=(a+b)/2;
        if abs(c-b)<tol || abs(c-a)<tol
            break
        end
        if f(a)*f(c)<0
            b=c;
        elseif f(b)*f(c)<0
            a=c;
        end
    end
else
    c=0;i=0;
    disp('No existe raíz en [a,b]');
end