% script: Jugando con funciones base de Lagrange (P1)

clear; % limpia la memoria

xi = -1:0.2:1; % nodos
yi = cos(2*pi*xi) .* xi ;

x = -1:0.01:1; % puntos de evaluacion

%% Visualizacion de algunas funciones base
y2 = lagrangeBaseT(2,xi,x,1);
y1 = lagrangeBaseT(1,xi,x,1);
y3 = lagrangeBaseT(3,xi,x,1);

figure(1); clf;
plot(xi,zeros(size(xi)),'ro',x,y1,'linewidth',2);
hold on;
plot(x,y2,'linewidth',2);
plot(x,y3,'linewidth',2);
hold off;
title('Funciones de interpolación de Lagrange P_1');
ylim([-0.2,1.2]);
legend('nodos','L_1','L_2','L_3');


%% Interpolacion
L = 0; L1 = 0;
for i=1:length(xi)
  L = L + yi(i) * lagrangeBaseT(i,xi,x);
  L1 = L1 + yi(i) * lagrangeBase(i,xi,x);
end

figure(2); clf;
plot(xi,yi,'ro',x,L1,x,L);
legend('nodos','lineal por tramos','grado superior');