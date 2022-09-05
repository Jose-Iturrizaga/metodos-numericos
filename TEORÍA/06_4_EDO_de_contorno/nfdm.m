function [x,w] = nfdm(f, a, b, h, Alpha, Beta)

syms x
iterations = 10 ;
xi = a:h:b;
n = length(xi);

w0 = symfun(Alpha + (Beta-Alpha)/(b-a)*(x - a), x);
wi(:,1) = double(w0(xi));

W = sym('w', [1 n]);
F = sym(zeros(n-2,1));

for i=3:n-2
	F(i-1) = symfun(-W(i-1) + 2*W(i) - W(i+1) + (h^2)*f(xi(i),...
            W(i), (W(i+1) - W(i-1))/(2*h)),[W(i-1), W(i), W(i+1)]);
end

%Condiciones de borde
F(1) = symfun(2*W(2)- W(3) +  (h^2)*f(xi(2), W(2),...
            (W(3) - Alpha)/(2*h)) - Alpha,[W(2), W(3)]);
F(n-2) = symfun(-W(i) + 2*W(i+1) +  (h^2)*f(xi(i+1), W(i+1),...
            (Beta - W(i))/(2*h)) - Beta,[W(i), W(i+2)]);

for i =1:iterations 
	Jw = double(subs(jacobian(F, W),W ,wi(:,i)'));
	Fw = double(subs(F, W, wi(:,i)'));
	wi(:,i+1) = wi(:,i) -  Jw\Fw;
end
x = xi';
w = wi(:,i);
figure
plot(x,w,'r.','MarkerSize',16), grid on, hold on
plot(x(1),w(1),'bo','MarkerSize',10,'LineWidth',2)
plot(x(n),w(n),'go','MarkerSize',10,'LineWidth',2)
xlabel('$x$','FontSize',20,'interpreter','latex')
ylabel('$y(x)$','FontSize',20,'interpreter','latex')
legend('Solución Numérica','y(a) = alpha',...
         'y(b) = beta','Location','Best')