%Ejemplos
f=@(x) 2^x-5*x+2;
[raiz,numiter] = bisec(f,-2,2)

f=@(x) exp(x)-8
[raiz,numiter]=secan(f,1,2)

f = @(x) x.^4-6.4*x.^3+6.45*x.^2+20.538*x-31.752;
df = @(x) 4*x.^3-3*6.4*x.^2+2*6.45*x+20.538;

[raiz,numiter] = newtonraphson(f,df,2)
[raiz,numiter] = newtonraphsonm(f,df,2,2)

f = @(x) 2^(-x)
[r n] = FixedPoint(f, 0)

f = @(x) x*cos(x)+1
[r k] = RegulaFalsi(f, -2, 4)

%Sistemas
syms x1 x2 x3
f1(x1,x2,x3)=3.*x1-cos(x2.*x3)-1/2;
f2(x1,x2,x3)=x1.^2-81.*(x2+0.1).^2+sin(x3)+1.06;
f3(x1,x2,x3)=exp(-x1.*x2)+20.*x3+(10.*pi-3)/3;
fn=[f1;f2;f3];
x0=[0.1;0.1;0.1];
[x,n] = nrmulvar3(fn,x0)
[x,n]=Broydens3(fn,x0)

syms x y z 
f1(x,y,z)=4*x-2*y^2+3*z+7;
f2(x,y,z)=3*x^2-2*y+4*z-22;
f3(x,y,z)=5*x+3*y-z^3-18;
fn=[f1;f2;f3];
x0=[10;10;10];
[x,n] = nrmulvar3(fn,x0)
[x,n]=Broydens3(fn,x0)