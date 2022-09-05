% ejemplo de interpolaci�n con Vandermonde

clear;
close all;
clc;

% datos
xp = linspace(-1,4.5,60); % esto es un vector fila
yp = sin(2*pi*xp).*xp/2; % esto tambien!

% genero la matriz de Vandermonde
A = MatrizVandermonde(xp);

b = yp'; % lado derecho de la ecuaci�n A*a = b

% determinemos a los coeficientes de interpolaci�n:
a = A \ b; % a = inv(A)*b


%% Verificaci�n:
n = length(xp);

xx = linspace(min(xp),max(xp),100);
yy = zeros(size(xx));
yyp= sin(2*pi*xx).*xx/2; % funcion exacta

%{
% forma poco eficiente: dos ciclos 'for' anidados
for i = 1:length(xx)
  for k = 1:n
    yy(i) = yy(i) + a(k)*xx(i)^(k-1);
  end
end
%}

for k = 1:n
  yy = yy + a(k) * xx .^ (k-1);
end


figure(1);
plot(xp,yp,'ro','MarkerSize',3);
hold on;
plot(xx,yy,'b-');
plot(xx,yyp,'k--');
hold off;
legend('datos','interpolaci�n','funci�n exacta');

