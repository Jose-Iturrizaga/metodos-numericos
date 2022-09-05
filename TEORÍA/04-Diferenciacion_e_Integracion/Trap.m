function I = Trap(f,a,b,n)
h = (b-a)/n; I = 0;
x = a:h:b;
for i = 2:n
    I = I + 2*f(x(i));
end
I = I + f(a) + f(b);
I = I*h/2;
