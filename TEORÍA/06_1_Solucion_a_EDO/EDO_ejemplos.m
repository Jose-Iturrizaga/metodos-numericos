%Ejemplos EDO
%Euler
f=@(x,y) -2*x*y;
fex=@(x) exp(-x.^2);
[x,y]=feuler(f,0,1,1,0.1);
yex=fex(x);
e= (yex-y)./yex.*100;
table(x,y,yex,e)
plot(x,y,x,yex)
legend('feuler','fexacta')

%Runge-Kutta
%1
f=@(x,y) -20*y + 7*exp(-0.5*x);
[x, yrk2]=rk2(f,0,0.2,5,0.01);
[x, yrk4]=rk4(f,0,0.2,5,0.01);
table(x,yrk2,yrk4)

%2
f=@(x,y) (x^2)/(2+y);
[x, yrk2]=rk2(f,0,1,1,0.1);
[x, yrk4]=rk4(f,0,1,1,0.1);
table(x,yrk2,yrk4)

%3
f=@(x,y) (y-3*x)/x;
[x, yemod]=eulermod(f,1,2,1,0.1);
[x, yheun]=heun(f,1,2,1,0.1);
[x, yral]=ralston(f,1,2,1,0.1);
table(x,yemod,yheun,yral)

%4
f=@(x,y) y^2*sin(x/2);
[x, yemod]=eulermod(f,0,2,1,0.2);
[x, yheun]=heun(f,0,2,1,0.2);
[x, yral]=ralston(f,0,2,1,0.2);
table(x,yemod,yheun,yral)

%5
f=@(x,y) (y+exp(y/x))/x;
fex = @(x) -x*log(exp(-1)+1/x-1);
[xp, yrk4]=rk4(f,1,1.5,1,0.1);%h=0.1
[x, yeu]=feuler(f,1,1.5,1,0.025);%h=0.025
[x, yheun]=heun(f,1,1.5,1,0.05);%h=0.05
yeu=yeu(1:4:end);yheun=yheun(1:2:end);
yex=arrayfun(fex,xp);
e_rk4= (yex-yrk4)./yex.*100;
e_yemod= (yex-yeu)./yex.*100;
e_yheun= (yex-yheun)./yex.*100;

table(xp,yrk4,yeu,yheun,e_rk4,e_yemod,e_yheun)
plot(xp,yrk4,xp,yeu,xp,yheun,xp,yex)
legend('rk4','feuler','heun','fexacta')