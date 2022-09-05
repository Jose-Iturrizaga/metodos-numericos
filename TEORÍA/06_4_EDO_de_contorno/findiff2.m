function [x,w]=findiff2(p,q,r,aa,y0,bb,yn,n)

fprintf('   x           w   \n');
h = (bb-aa)/(n+1);
a = zeros(1,n+1);
b = zeros(1,n+1);
c = zeros(1,n+1);
d = zeros(1,n+1);
l = zeros(1,n+1);
u = zeros(1,n+1);
z = zeros(1,n+1);
w = zeros(1,n+1);
x = aa+h;
a(1) = 2+h^2*q(x);
b(1) = -1+0.5*h*p(x);
d(1) = -h^2*r(x)+(1+0.5*h*p(x))*y0;
m = n-1;

for i = 2 : m
    x = aa+i*h;
    a(i) = 2+h^2*q(x);
    b(i) = -1+0.5*h*p(x);
    c(i) = -1-0.5*h*p(x);
    d(i) = -h^2*r(x);
end

x = bb-h;
a(n) = 2+h^2*q(x);
c(n) = -1-0.5*h*p(x);
d(n) = -h^2*r(x)+(1-0.5*h*p(x))*yn;
l(1) = a(1);
u(1) = b(1)/a(1);
z(1) = d(1)/l(1);

for i = 2 : m
    l(i) = a(i)-c(i)*u(i-1);
    u(i) = b(i)/l(i);
    z(i) = (d(i)-c(i)*z(i-1))/l(i);
end

l(n) = a(n)-c(n)*u(n-1);
z(n) = (d(n)-c(n)*z(n-1))/l(n);
w(n) = z(n);

for j = 1 : m
    i = n-j;
    w(i) = z(i)-u(i)*w(i+1);
end
w=[y0 w]; w(n+2)=yn; w=w';

for i = 1 : n+2
    x(i,1) = aa+(i-1)*h;
    fprintf('%5.4f    %11.8f\n', x(i), w(i));
end