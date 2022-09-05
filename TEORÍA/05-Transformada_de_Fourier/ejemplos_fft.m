%fft ejemplos

%serie temporal
n=2^12;
dt=0.4;
t=(0:n-1)*dt; %vector de tiempos
x=cos(t)+0.5*cos(3*t)+0.4*cos(3.5*t)+0.7*cos(4*t)+0.2*cos(6*t);

%amplitud-fase vs. frecuencias
g=fastfourier(x);
power=abs(g).^2;
dw=2*pi/(n*dt);
w1=(0:n-1)*dw; %vector de frecuencias angulares
w2=(-n/2:n/2-1)*dw;

figure
plot(w1,power)
xlabel('\omega')
ylabel('P(\omega)')
title('Espectro de potencia')
figure
plot(w2,power)
xlabel('\omega')
ylabel('P(\omega)')
grid on
title('Espectro de potencia')

