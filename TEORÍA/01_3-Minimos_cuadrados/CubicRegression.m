function [a3, a2, a1, a0]= CubicRegression(x,y)
n = length(x);
Sumx = sum(x); Sumy = sum(y);
Sumx2 = sum(x.^2); Sumx3 = sum(x.^3); Sumx4 = sum(x.^4);
Sumx5 = sum(x.^5); Sumx6 = sum(x.^6);
Sumxy = sum(x.*y); Sumx2y = sum(y.*x.^2);
Sumx3y = sum(y.*x.^3);
A =[n Sumx Sumx2 Sumx3;Sumx Sumx2 Sumx3 Sumx4;Sumx2 Sumx3...
    Sumx4 Sumx5; Sumx3 Sumx4 Sumx5 Sumx6];
b =[Sumy;Sumxy;Sumx2y;Sumx3y];
w = A\b;
a3 = w(4); a2 = w(3); a1 = w(2); a0 = w(1);

xx = linspace(x(1),x(end));
p = zeros(100,1);
for i = 1:100
    p(i)= a3*xx(i)^3 + a2*xx(i)^2 + a1*xx(i) + a0;
end
plot(x,y,'o')
hold on
plot(xx,p)
end
