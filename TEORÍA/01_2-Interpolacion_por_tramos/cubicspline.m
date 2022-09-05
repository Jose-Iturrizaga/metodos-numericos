function [yi]=cubicspline(x,y,xi)

N=length(x)-1;

for j=1:N
    h(j)=x(j+1)-x(j);
end
a=y;
B = zeros(1,N+1);
A = zeros(N+1,N+1);
A(1,1) = 1; A(N+1,N+1) = 1;

for i=2:N
    B(i)=(3/h(i))*(a(i+1)-a(i))-(3/h(i-1))*(a(i)-a(i-1));
    A(i,i)=2*(h(i-1)+h(i));
    A(i,i-1)=h(i-1);
    A(i,i+1)=h(i);
end
c=A\B';

for i=1:N
    b(i)=(1/h(i))*(a(i+1)-a(i))-(h(i)/3)*(2*c(i)+c(i+1));
    d(i)=(c(i+1)-c(i))/(3*h(i));    
    s=@(X) a(i)+b(i)*(X-x(i))+c(i)*(X-x(i)).^2+d(i)*(X-x(i)).^3;
    %Interpolación
    if xi > x(i) && xi < x(i+1)
        yi = s(xi);
    end
    %Gráfica
    X=[x(i):0.01:x(i+1)];
    plot(x,y,'or',X,s(X),'linewidth',2)
    hold on
end