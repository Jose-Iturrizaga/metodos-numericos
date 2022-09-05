function L = lagrangeBase(i,x,xx)
% LAGRANGEBASE: Encuentra al i-esimo polinomio de Lagrange 
% asociado al indice 'i' dentro del arreglo de coordenadas
% 'x'. Esto se evalua para cada punto en 'xx'
% 
% L = lagrangeBase(i,x,xx)
%

n = length(x);

L = 1;

%{
for j=1:n
  if i ~= j
    L = L .* (xx - x(j)) / (x(i) - x(j));

    % es equivalente a
    % for k = 1:length(xx)
    %   L(k) = L(k) * (xx(k) - x(j)) / (x(i) - x(j));
    % end
  end
end
%}

for j = [1:(i-1) , (i+1):n]
    L = L .* (xx - x(j)) / (x(i) - x(j));
end

end