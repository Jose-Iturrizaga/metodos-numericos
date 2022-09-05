function y = findiff(x,C,D,E,F,f1,f2,p1,p2)

% Si se da y en x0, f1=1,Si se da y' en x0, f1=0
% Si se da y en xn+1, f2=1,Si se da y' en xn+1, f2=0
n = length(x)-1;
h(2:n+1) = x(2:n+1)-x(1:n);
h(1) = h(2); h(n+2) = h(n+1);
r(1:n+1) = h(2:n+2)./h(1:n+1);
s = 1+r;
if f1==1
    y(1) = p1;
else
    dy0 = p1;
end
if f2==1
    y(n+1) = p2;
else
    dyn = p2;
end
W = zeros(n+1,n+1);
if f1==1
    c0 = 3;
    W(2,2) = E(2)-2*C(2)/(h(2)^2*r(2));
    W(2,3) = 2*C(2)/(h(2)^2*r(2)*s(2))+D(2)/(h(2)*s(2));
    b(2) = F(2)-y(1)*(2*C(2)/(h(2)^2*s(2))-D(2)/(h(2)*s(2)));
else
    c0=2;
    W(1,1) = E(1)-2*C(1)/(h(1)^2*r(1));
    W(1,2) = 2*C(1)*(1+1/r(1))/(h(1)^2*s(1));
    b(1) = F(1)+dy0*(2*C(1)/h(1)-D(1));
end
if f2==1
    c1 = n-1;
    W(n,n) = E(n)-2*C(n)/(h(n)^2*r(n));
    W(n,n-1) = 2*C(n)/(h(n)^2*s(n))-D(n)/(h(n)*s(n));
    b(n) = F(n)-y(n+1)*(2*C(n)/(h(n)^2*s(n))+D(n)/(h(n)*s(n)));
else
    c1 = n;
    W(n+1,n+1) = E(n+1)-2*C(n+1)/(h(n+1)^2*r(n+1));
    W(n+1,n) = 2*C(n+1)*(1+1/r(n+1))/(h(n+1)^2*s(n+1));
    b(n+1) = F(n+1)-dyn*(2*C(n+1)/h(n+1)+D(n+1));
end
for i = c0:c1
    W(i,i) = E(i)-2*C(i)/(h(i)^2*r(i));
    W(i,i-1) = 2*C(i)/(h(i)^2*s(i))-D(i)/(h(i)*s(i));
    W(i,i+1) = 2*C(i)/(h(i)^2*r(i)*s(i))+D(i)/(h(i)*s(i));
    b(i) = F(i);
end

z = W(f1+1:n+1-f2,f1+1:n+1-f2)\b(f1+1:n+1-f2)';
if f1==1 && f2==1, y = [y(1); z; y(n+1)]; end
if f1==1 && f2==0, y = [y(1); z]; end
if f1==0 && f2==1, y = [z; y(n+1)]; end
if f1==0 && f2==0, y = z; end