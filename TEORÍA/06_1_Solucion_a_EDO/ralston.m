function [x, y]=ralston(f,x0,xi,y0,h)

n=(xi-x0)/h+1;
y=y0; x=x0;
for i=2:n
    x1=x0+h;
    k1=h*f(x0,y0);
    k2=h*f(x0+(3/4)*h,y0+(3/4)*k1);
    y1=y0+(1/3)*(k1+2*k2);
    x=[x; x1]; y=[y; y1];
    x0=x1;y0=y1;
end