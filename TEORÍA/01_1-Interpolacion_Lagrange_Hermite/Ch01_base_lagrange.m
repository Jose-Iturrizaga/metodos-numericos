% Ejemplo de polinomio de interpolacion de Lagrange

clear; % limpia la memoria

x = -1:0.2:1;
y = cos(2*pi*x) .* x ;

xx = -1:0.01:1;

l1 = lagrangeBase(1,x,xx);

y1 = zeros(size(x)); %y1(1) = 1;

figure(100); clf;
plot(x,y1,'ro',xx,l1,'linewidth',3);

% otra

l4 = lagrangeBase(4,x,xx);

hold on;
plot(xx,l4,'linewidth',3);
hold off;

legend('nodos','l_1','l_4');
title('ejemplo de dos polinomios de interpolacion de Lagrange');
grid on;


%% Interpolacion

L = 0;
for i=1:length(x)
  L = L + y(i) * lagrangeBase(i,x,xx);
end

figure(2); clf;
plot(x,y,'ro',xx,L);
