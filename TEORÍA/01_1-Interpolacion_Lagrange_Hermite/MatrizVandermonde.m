function Vn = MatrizVandermonde(x)
% MATRIZVANDERMONDE : Determina a la matriz de Vandermonde, dado un vector
% x de largo 'n'.
%
% Modo de uso:
% Vn = MatrizVandermonde(x)
%
% Vn: matriz de nxn

n = length(x);

% Tenemos que repetir al vector columna x n veces:
Vn = zeros(n,n);

[N,M] = size(x);
if M<N
  x = x';
end

for i = 1:n
  Vn(:,i) = x.^(i-1);
end

end

