function [x, y]=eulermod(f,x0,xi,y0,h)

n=(xi-x0)/h+1;
y=y0; x=x0;
for i=2:n
    x1=x0+h;
    k1=h*f(x0,y0);
    k2=h*f(x0+h/2,y0+k1/2);
    y1=y0+k2;
    x=[x; x1]; y=[y; y1];
    x0=x1;y0=y1;
end