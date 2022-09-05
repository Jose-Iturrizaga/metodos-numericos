function [x, y]=feuler(f,x0,xi,y0,h)

n=(xi-x0)/h+1;
y=y0;x=x0;
for i=2:n
  y1=y0+h*f(x0,y0); x1=x0+h;
  x=[x; x1]; y=[y; y1];
  x0=x1;y0=y1;
end 