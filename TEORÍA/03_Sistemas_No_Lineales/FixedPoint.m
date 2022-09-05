function [r n] = FixedPoint(f, x1, kmax, tol)

if nargin < 4, tol = 1e-4;end
if nargin < 3, kmax = 20;end
x(1) = x1;
for n = 1:kmax
    x(n+1) = f(x(n));
    if abs(x(n+1)-x(n)) < tol
        r = x(n+1);
        return
    end
end
r = 'failure';
