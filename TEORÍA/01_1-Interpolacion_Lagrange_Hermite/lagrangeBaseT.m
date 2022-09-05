function L = lagrangeBaseT(i,x,xx,grado)
% LAGRANGEBASE: Encuentra al i-esimo polinomio de Lagrange por tramos
% asociado al indice 'i' dentro del arreglo de coordenadas
% 'x'. Esto se evalua para cada punto en 'xx'
% 
% L = lagrangeBaseT(i,x,xx,grado)
%
%
%

if nargin < 4
  grado = 1; % valor por defecto
end

n = length(x);
L = zeros(size(xx));

switch grado
  case 1
    
    for k=1:n-1
      
      for j=1:length(xx)
        
        % recorremos los segmentos
        if xx(j) >= x(k) && xx(j) <= x(k+1)
          
          if i==k
            L(j) = (xx(j) - x(k+1)) / (x(i) - x(k+1));
          elseif i==k+1
            L(j) = (xx(j) - x(k)) / (x(i) - x(k));
          else
            L(j) = 0;
          end
          
        end
        
      end % for j ...
    end % for k ...
    
  otherwise
    fprintf('No reconozco a grado=%d\n',grado)
    return
    
end % switch

end