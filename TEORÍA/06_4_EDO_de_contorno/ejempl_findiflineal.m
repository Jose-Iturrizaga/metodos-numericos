%Ejemplos
%(1 + x2)(d2z/dx2) + xdz/dx - z = x2
% 0<=x<=2  z(0)=1 and z(2)=2.
x = 0:.2:2;
C = 1+x.^2; D = x; E = -ones(1,11); F = x.^2;
f1 = 1; p1 = 1; f2 = 1; p2 = 2;
z = findiff(x,C,D,E,F,f1,f2,p1,p2);
B = 1/3; A = -sqrt(5)*B/2;
xx = 0:.01:2;
zz = A*xx+B*sqrt(1+xx.^2)+B*(2+xx.^2);
figure
plot(x,z,'o',xx,zz)
xlabel('x'); ylabel('z')

%y"=(-2/x)y'+(2/x^2)y+ sin(lnx)/x^2
% 1<=x<=2 y(1)=1 and y(2)=2.
p = @(x) (-2/x); q = @(x) (2/x^2); r = @(x) (sin(log(x))/x^2);
aa = 1; bb = 2; y0 = 1; yn = 2; n=29;
[x,w] = findiff2(p,q,r,aa,y0,bb,yn,n);
figure
plot(x,w)

%y"=-3y'+x
x = 1:0.5:6; n = length(x);
C = ones(n); D = 3*ones(n); E = zeros(n); F = x;
f1 = 1; p1 = 1; f2 = 1; p2 = 0.2;
z = findiff(x,C,D,E,F,f1,f2,p1,p2);
figure
plot(x,z)

p = @(x) -3; q = @(x) 0; r = @(x) x;
aa = 1; bb = 6; y0 = 1; yn = 0.2; n=100;
[x,w] = findiff2(p,q,r,aa,y0,bb,yn,n);
figure
plot(x,w)


%y"=0.02y+1, y(0)=30 y(10)=120
x = 0:2:10; n = length(x);
C = ones(n); D = zeros(n); E = -0.02*ones(n); F = ones(n);
f1 = 1; p1 = 30; f2 = 1; p2 = 120;
z = findiff(x,C,D,E,F,f1,f2,p1,p2);

%y"+(1/t)*y'+2=0, y(1)=1 y'(4)=-1
x = 1:0.1:4; n = length(x);
C = ones(n); D = 1./x; E = zeros(n); F = -2*ones(n);
f1 = 1; p1 = 1; f2 = 0; p2 = -1;
z = findiff(x,C,D,E,F,f1,f2,p1,p2);
figure
plot(x,z,'-or')

%Diferencia finita
t = 0:0.1:0.5; n = length(t);
C = ones(n); D = zeros(n); E = -1/3*ones(n); F = exp(-t./3);
f1 = 1; p1 = -1; f2 = 0; p2 = 1;
u = findiff(t,C,D,E,F,f1,f2,p1,p2)'

%Solución exacta
u_ex=dsolve('D2u-(1/3)*u=exp(-t/3)','u(0)=-1','Du(0.5)=1');
u_exact = vectorize(inline(char(u_ex)));
uex=u_exact(t)

%Diferencia finita
t = 2:0.25:4; n = length(t);
C = ones(n); D = 2./t; E = zeros(n); F = exp(-t);
f1 = 1; p1 = -0.8; f2 = 0; p2 = 1.3;
y = findiff(t,C,D,E,F,f1,f2,p1,p2)

%Solución exacta
y_ex=dsolve('D2y+(2/t)*Dy=exp(-t)','y(2)=-0.8','Dy(4)=1.3');
y_exact=vectorize(inline(char(y_ex)));
yex=y_exact(t)'; t=t';
table(t,y,yex)
