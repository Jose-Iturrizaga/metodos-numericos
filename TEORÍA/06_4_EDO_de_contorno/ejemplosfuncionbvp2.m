%1
x = linspace(0,0.15,10); 
solinit = bvpinit(x,[100, 0]);
alf = 20; bet = 1e-8; gam = 5000;
dydx = @(x,y) [y(2);alf*y(1)+bet*y(1)^4-gam];
condcon = @(ya, yb)[ya(1)-500;yb(1)-300];
 
sol = bvp4c(dydx,condcon,solinit);
x = sol.x; 
y = sol.y;
T = y(1,:);
figure
plot(x,T,'o')

%2
x = linspace(1,8,10); 
solinit = bvpinit(x,[1, 0]);
dydx = @(x,y) [y(2);(5*x-x^2)/4000]; 
condcon = @(ya, yb)[ya(1);yb(1)];
 
sol = bvp4c(dydx,condcon,solinit);
x = sol.x; 
y = sol.y;
def = y(1,:); 
rot = y(2,:); 
figure
subplot(1,2,1), plot(x,def,'bo')
title('deflection')
subplot(1,2,2), plot(x,rot,'ro')
title('rotation')

%3
x = linspace(0,10,10); 
solinit = bvpinit(x,[1, 0.1, 1, 0]);
dydx = @(x,y)[y(2);y(3);y(4);16*y(1)];
condcon = @(ya, yb)[ya(1);ya(3);yb(1);yb(3)];
 
sol = bvp4c(dydx,condcon,solinit);
x = sol.x; 
y = sol.y; 
capx = y(1,:); 
figure
xx = 0:.01:10;
yy = spline(x,capx,xx)
plot(x,capx,'o',xx,yy,'r','LineWidth',1) 