%ejemp1
dydx = @(x,y) [ 3*y(1) - 2*y(2); -y(1) + 0.5*y(2)];
condcon = @(ya, yb) [ ya(1); yb(2)-pi];

figure
xinit = linspace(0,1,5);
yinit = [0; pi];
solinit = bvpinit(xinit, yinit);
sol = bvp4c(dydx, condcon, solinit);
plot(sol.x, sol.y)
legend('y_1(x)', 'y_2(x)', 'Location', 'Best')

%ejemp2
p = 1.e-5;
yenb = 0.1/sqrt(p+0.01);
dydt = @(t,y) [ y(2); -3*p*y(1)/(p+t^2)^2];
condcon = @(ya, yb) [ya(1)+yenb; yb(1)-yenb ];
exacta = @(t) t./sqrt(p+t.^2);

tguess = linspace(-0.1, 0.1, 10);
yguess = [0; 10];
solinit = bvpinit(tguess, yguess);

% Resolucion con valor estandar de RelTol
options = bvpset('Stats','on');
fprintf('\n')
fprintf('==> Resolucion con valor estandar de RelTol \n')
sol1 = bvp4c(dydt, condcon, solinit,options);

% Resolucion con RelTol = 1.e-5
options = bvpset(options, 'RelTol', 1.e-5);
fprintf('\n')
fprintf('==> Resolucion con RelTol =%15.10f\n',bvpget(options,'RelTol'))
sol2 = bvp4c(dydt, condcon, solinit, options);

figure
xx = linspace(-0.1, 0.1);
yy1 = deval(sol1, xx, 1);
yy2 = deval(sol2, xx, 1);
yye = exacta(xx);
plot(xx, yy1,'b', xx, yy2,'g', xx, yye,'r*')
legend('Sol. con RelTol estandar','Sol. con RelTol=1.e−5',...
    'Sol. exacta','Location', 'northwest')

figure
xx = linspace(-0.04, 0);
yy1 = deval(sol1, xx, 1);
yy2 = deval(sol2, xx, 1);
yye = exacta(xx);
plot(xx, yy1,'b', xx, yy2,'g')
legend('Sol. con RelTol estandar','Sol. con RelTol=1.e−5',...
    'Location', 'northwest')
