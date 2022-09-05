function [a, beta]=expreg(x,y)

sumyy=sum(y.^2);    sumyyx=sum((y.^2).*x);
sumyyxx=sum((y.^2).*(x.^2));    sumyylny=sum((y.^2).*log(y));
sumyylnyx=sum((y.^2).*log(y).*x);

A=[sumyy sumyyx;   sumyyx sumyyxx];
B=[sumyylny; sumyylnyx];
N=A\B;
a=real(exp(N(1)));
beta=real(N(2));

l=arrayfun(@(x) a*exp(beta*x),sort(x));
plot(x,y,'o')
hold on
plot(sort(x),l,'LineWidth',2)
xlabel('X')
ylabel('Y')
legend('data','Ae^{\betat}','Location','Best')