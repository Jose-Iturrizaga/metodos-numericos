t = linspace(-1,1,10000);
N=10e2; T=1; A=1;

%Rectangular
sum = 0;
for k = 1:1:N
    n = 2*k-1;
    serie=2/(pi*n)*sin(n*(2*pi/T)*t);
    sum = serie+sum;
end
sum = A*(1/2 + sum);
figure
plot(t,sum)

%Serrucho
sum = 0;
for k = 1:1:N
    serie=(1/pi)*(1/k)*sin(k*(2*pi/T)*t);
    sum = serie+sum;
end
sum = A*(1/2 - sum);
figure
plot(t,sum)

%Triangular discontinua
sum = 0;
for k = 1:1:N
    an = (((-1)^k)-1)/((k*pi)^2);
    bn = ((-1)^(k+1))/(k*pi);
    serie=an*cos(k*(2*pi/T)*t)+bn*sin(k*(2*pi/T)*t);
    sum = serie+sum;
end
sum = A*(1/4 + sum);
figure
plot(t,sum)

%Triangular
sum = 0;
for k = 1:1:N
    n = 2*k-1;
    serie=4/(pi^2)*1/(n^2)*cos(n*(2*pi/T)*t);
    sum = serie+sum;
end
sum = A*(1/2-sum);
figure
plot(t,sum)

%Sinusoidal rectificada(mitad)
sum = 0;
for k = 1:1:N
    serie=(2/pi)*(1/(4*k^2-1))*cos(2*k*(2*pi/T)*t);
    sum = serie+sum;
end
sum = A*(1/pi+(1/2)*sin((2*pi/T)*t)-sum);
figure
plot(t,sum)

%Sinusoidal rectificada
sum = 0;
for k = 1:1:N
    serie=(4/pi)*(1/(4*k^2-1))*cos(k*(2*pi/T)*t);
    sum = serie+sum;
end
sum = A*(2/pi-sum);
figure
plot(t,sum)