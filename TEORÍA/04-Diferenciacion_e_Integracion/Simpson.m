function I = Simpson(f,a,b,n)
h = (b-a)/n;
x = a:h:b;
I = 0;
for i = 1:2:n
I = I + h/3*(f(x(i)) + 4*f(x(i+1)) + f(x(i+2)));
end
