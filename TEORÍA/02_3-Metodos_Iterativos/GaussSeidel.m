function [x, k]= GaussSeidel(A, b, x0, tol, kmax)

if nargin < 3 || isempty(x0)
    x0 = zeros(size(b));
end
if nargin < 4 || isempty(tol)
    tol = 1e-4;
end
if nargin < 5 || isempty(kmax)
    kmax = 100;
end

x(:, 1) = x0;
D = diag(diag(A)); At = A - D;
L = tril(At);
U = At - L;
MGS = -(D + L)\U; 
B = (D + L)\b;
for k = 1:kmax
    x(:, k+1) = MGS*x(:, k) + B;
    if norm(x(:,k+1)-x(:, k)) < tol
        break
    end
end
x = x(:, end);
