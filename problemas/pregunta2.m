syms t T
f(t) = exp(-t);
g(t) = sin(t);
FEX(t) = 1/2*(sin(t)-cos(t));

h=1e-2;
x=0:h:8*pi;
n=length(x);

%Convolucion por cuadratura de Gauss
fg(t,T) = f(T).*g(t-T);
%[0;inf] a [-1;1]
%Fi(t,T) = fg(t,(T+1)/(1-T))*(2/((1-T)^2)); 
Fi(t,T) = fg(t,tan((pi/4)*(T+1)))*((sec((pi/4)*(T+1)))^2)*pi/4;

w1=1; w2=1;
x1=1/sqrt(3); x2=-1/sqrt(3);
F1=arrayfun(@(x) double(Fi(x,x1)),x);
F2=arrayfun(@(x) double(Fi(x,x2)),x);
I=2*(w1*F1 + w2*F2);


%Convolucion por FFT
fx=double(f(x));
gx=double(g(x));

F=[fx zeros(1,length(gx)-1)];
G=[gx zeros(1,length(fx)-1)];
ln=length(F);
FFT=ones(ln,ln);
IFFT=ones(ln,ln);

for j=1:ln-1
    for k=1:ln-1
FFT(j+1,k+1)=exp(-2*j*k*pi*1i/ln);
IFFT(j+1,k+1)=exp(2*j*k*pi*1i/ln);
    end 
end

IFFT=1/ln*IFFT;
FG=IFFT*((FFT*F').*(FFT*G'))*h;
FG=real(FG(1:n));

figure
plot(x,double(FEX(x)),'Linewidth',2),hold on,
plot(x,I,'--r','Linewidth',2)
hold on
plot(x,FG,'-.m','Linewidth',2)
legend('f*g','f*g Gauss Cuadr.','f*g FFT',...
    'Location','SouthEast')
xlabel('t')
ylabel('f*g')
title('Convolución f(t)*g(t)')
