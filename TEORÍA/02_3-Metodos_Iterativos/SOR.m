function [x, k]= SOR(A, b, w, x0, tol, kmax)

if nargin < 4 || isempty(x0)
    x0 = zeros(size(b));
end
if nargin < 5 || isempty(tol)
    tol = 1e-5;
end
if nargin < 6 || isempty(kmax)
    kmax = 100;
end

x(:, 1) = x0;
D = diag(diag(A)); At = A - D;
L = tril(At);
U = triu(At);
MSOR = (D+w*L)\((1-w)*D-w*U);
B = w*((D+w*L)\b);

for k = 1:kmax
    x(:, k+1) = MSOR*x(:, k) + B;
    if norm(x(:, k+1) - x(:, k)) < tol
        break;
    end
end
x = x(:, end);
