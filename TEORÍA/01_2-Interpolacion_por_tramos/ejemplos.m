%Ejemplos
x=[0 1 2 3];
y=[1 exp(1) exp(2) exp(3)];
Y=cubicspline(x,y,1.5)

x = 1:7;
v = [2 2 2 0 -2 -2 -2 ];
xq = 0.50:0.05:7.50;
vqa = akima(x,v,xq);
figure
plot(x,v,'ko',xq,vqa,'LineWidth',2)
legend('Data','AKIMA')

x = [1 2 3 4 5 5.5 7 8 9 9.5 10];
v = [0 0 0 0.5 0.4 1.2 1.2 0.1 0 0.3 0.6];
xq = 0.75:0.05:10.25;
figure
Y=cubicspline(x,v,1.5)
vqa = akima(x,v,xq);
plot(xq,vqa,'--k','LineWidth',1)