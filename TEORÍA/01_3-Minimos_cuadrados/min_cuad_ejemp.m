%Ejemplos
x = 0.2:0.2:1.2;
y = [8 8.4 8.8 8.6 8.5 8.7];
figure
[a1, a0] = LinearRegression(x,y)

x = 0:0.4:1.6;
y = [2.90 3.10 3.56 4.60 6.70];
figure
[a2, a1, a0] = QuadraticRegression(x,y)

x = 0:0.4:1.6;
y =[2.90 3.10 3.56 4.60 6.70];
figure
[a3, a2, a1, a0] = CubicRegression(x,y)