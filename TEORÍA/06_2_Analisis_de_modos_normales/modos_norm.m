function [w] = modos_norm(K,M,x0,xp0)

[V,D]=eig(M\K); %valores y vectores propios
w=diag(sqrt(D)); %vector de frecuencias propias
for i=1:length(w)
    r=V(:,i)'*M*V(:,i);
    V(:,i)=V(:,i)/sqrt(r);
end

%condiciones iniciales
u0=V'*M*x0;
up0=V'*M*xp0;

%movimiento de cada una de las partículas 
A=u0;
B=up0./diag(D);
t=linspace(0,20,200);
u=diag(A)*cos(w*t)+diag(B)*sin(w*t);
x=V*u;

%representación gráfica
figure
plot(t,x);
title([num2str(length(w)),' osciladores acoplados'])
ylabel('x')
xlabel('t')
grid on