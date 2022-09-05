function [a2, a1, a0] = QuadraticRegression(x,y)
n = length(x);
Sumx = sum(x); Sumy = sum(y);
Sumx2 = sum(x.^2); Sumx3 = sum(x.^3); Sumx4 = sum(x.^4);
Sumxy = sum(x.*y); Sumx2y = sum(x.*x.*y);

A =[n Sumx Sumx2;Sumx Sumx2 Sumx3;Sumx2 Sumx3 Sumx4];
b =[Sumy;Sumxy;Sumx2y];
w = A\b;
a2 = w(3); a1 = w(2); a0 = w(1);
xx = linspace(x(1),x(end));

p = zeros(100,1);
for i = 1:100
    p(i)= a2*xx(i)^2 + a1*xx(i)+ a0;
end
plot(x,y,'o')
hold on
plot(xx,p)
end