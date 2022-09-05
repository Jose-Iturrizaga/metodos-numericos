function [r k] = RegulaFalsi(f, a, b, kmax, tol)

if nargin < 5, tol = 1e-4; end
if nargin < 4, kmax = 20; end

c = zeros(1, kmax);
if f(a)*f(b) > 0
    r = 'failure';
    return
end
for k = 1:kmax
    c(k) = (a*f(b)-b*f(a))/(f(b)-f(a));
    if f(c(k)) == 0
        return
    end
    if f(b)*f(c(k)) > 0
        b = c(k);
    else
        a = c(k);
    end
    c(k+1) = (a*f(b)-b*f(a))/(f(b)-f(a));
    if abs(c(k+1)-c(k)) < tol
        r = c(k+1);
        return
    end
end
r = 'failure';
