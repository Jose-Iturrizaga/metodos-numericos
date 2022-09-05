function [w, x] = modos_norm_sym(K,M,x0,xp0)

syms t;
[V,D]=eig(M\K); %valores y vectores propios
w=diag(sqrt(D)); %vector de frecuencias propias
w=simplify(w);
for i=1:length(w) %para hacer diagonal K 
    r=V(:,i)'*M*V(:,i);
    V(:,i)=V(:,i)/sqrt(r);
end

%condiciones iniciales
u0=V'*M*x0; 
up0=V'*M*xp0;

%movimiento de cada una de las partículas 
A=u0;
B=up0./diag(D);
u=diag(A)*cos(w*t)+diag(B)*sin(w*t);
x=V*u;
x=simplify(x);

%representación gráfica
figure
color=['b','r','g','m'];
hold on
for i=1:length(w)
    h=fplot(x(i),[0,20]);
    set(h,'color',color(i))
end
title([num2str(length(w)),' osciladores acoplados'])
ylabel('x')
xlabel('t')
grid on
hold off