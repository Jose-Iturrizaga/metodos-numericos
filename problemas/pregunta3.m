function T3P2

%H: Valores de discretización
%S: Matriz de coeficientes
%Q: Vector de cargas
%y: EI*v/PL^3
%vn: Desplazamiento en el punto n(L/2)
%Mn: Momento de Flexión
%Evn: Error del desplazamiento
%EMn: Error del momento de flexión
%EV,EM: Errores para cada discretización

%--------------Formulación--------------%
%v=(P*L^3/EI)*y
%h=de/2
%v''''=(P/(EI*L))*(y(i-2)-4y(i-1)+6yi-4y(i+1)+y(i+2))/h^4
%v'''=(P/EI)*(y(i-2)-2y(i-1)+2y(i+1)-y(i+2))/(2*h^3)
%v''=(P*L/EI)*(y(i+1)-2y+y(i-1))/h^2
%v'=(P*L^2/EI)*(y(i+1)-y(i-1))/2*h
%i=0   y(-1)=y(1)
%i=n   y(n+1)=y(n-1)
%i=n   y(n+2)=y(n-2)-h^3

%y(0)=0
%y(-1) - 4*y(0) + 6*y(1) -4*y(2) + y(3)=0;
%y(0) - 4*y(1) + 6*y(2) -4*y(3) + y(4)=0;
%   .
%   .
%   .
%y(n-4) - 4*y(n-3) + 6*y(n-2) -4*y(n-1) + y(n)=0;
%y(n-3) - 4*y(n-2) + 6*y(n-1) -4*y(n) + y(n+1)=0;
%y(n-2) - 4*y(n-1) + 6*y(n) -4*y(n+1) + y(n+2)=0;

%S=[ 7   -4   1  ...                     ;
%   -4    6  -4   1   ...                ;
%    1   -4   6  -4   1   ...            ;
%   ...     ...         ....             ;
%               1   -4    6   -4     1   ;
%                    1   -4    7    -4   ;
%                         2   -8     6 ] ;
%-----------------------------------------%

H=[1e-4 1e-2 0.2];
H=H(arrayfun(@(h) round(1/(2*h))==1/(2*h),H));
for j=1:length(H)
    h=H(j);
    n=1/(2*h);
    S=zeros(n-1);
    for i=2:n-1
        S(i,i)=6;
        S(i,i-1)=-4;    S(i-1,i)=-4;
        if i>2
            S(i,i-2)=1;     S(i-2,i)=1;
        end
    end
    S(1,1)=7;
    S(n-1,n-1)=7;
    S(n-1,n)=-4;
    S(n,n)=6;
    S(n,n-1)=-8;
    S(n,n-2)=2;
    S(n-2,n)=1;
    Q=zeros(n,1);
    Q(n)=(h)^3;
    y=S\Q;
    vn=y(n);
    Mn=-(2*y(n-1)-2*y(n))/(h)^2;
    Evn=norm(vn-1/192,2);
    EMn=norm(Mn-1/8,2);
    V(j)=vn; EV(j)=Evn;
    M(j)=Mn; EM(j)=EMn;
end

VarNames = {'Discretización','Desplazamiento','Momento de Flexión'};
disp(table(H',V',M','VariableNames',VarNames))
figure
plot(H,EV,'-bo','Linewidth',2),hold on,
plot(H,EM,'--ro','Linewidth',2)
legend('V(x)','M(x)','Location','Best')
xlabel('\Delta \epsilon')
ylabel('Error')
title('Error vs Discretización')