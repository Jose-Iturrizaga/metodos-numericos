%Ejemplos
syms x u v 
f = symfun((1/8)*(32 + 2*x^3 - u*v), [x, u, v]); 
a = 1; b = 3; h = .05; Alpha = 17; Beta = 43/3;
y = symfun(x^2 + 16/x, x);
[x,w] = nfdm(f, a, b, h, Alpha, Beta)
hold on
y = double(y(x));
plot(x,y,'DisplayName','Solución exacta')

%y'' = -(y')^2-y+ln(x), 1<x<2, y(1)=0 and y(2)=ln(2) Sol. y = ln(x)
syms x u v 
f = symfun(-(v)^2 - u + log(x), [x, u, v]); 
a = 1; b = 2; h = .05; Alpha = 0; Beta = log(2);
y = symfun(log(x),x);
[x,w] = nfdm(f, a, b, h, Alpha, Beta)
hold on
y = double(y(x));
plot(x,y,'DisplayName','Solución exacta')

% y'' = y'+2(y-ln(x))^3-x^-1, 2<x<3, y(2)=1/2+ln(2) and y(3)=1/3+ln(3) 
% Sol. y = x^-1+ln(x)
syms x u v 
f = symfun(v+2*(u-log(x))^3-x^-1, [x, u, v]); 
a = 2; b = 3; h = .05; Alpha = 1/2+log(2); Beta = 1/3+log(3);
y = symfun(x^-1+log(x),x);
[x,w] = nfdm(f, a, b, h, Alpha, Beta)
hold on
y = double(y(x));
plot(x,y,'DisplayName','Solución exacta')

% y'' = (x^2(y')^2-9*y^2+4*x^6)/x^5, 1<x<2, y(1)=0 and y(2)=ln(256)
% Sol. y = x^3(ln(x))
syms x u v 
f = symfun((x^2*(v)^2-9*u^2+4*x^6)/x^5, [x, u, v]); 
a = 1; b = 2; h = .05; Alpha = 0; Beta = log(256);
y = symfun(x^3*(log(x)),x);
[x,w] = nfdm(f, a, b, h, Alpha, Beta)
hold on
y = double(y(x));
plot(x,y,'DisplayName','Solución exacta')
