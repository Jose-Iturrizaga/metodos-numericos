t_ini = 0;
t_fin = 3;
dt = 0.005;
n = (t_fin-t_ini)/dt;
tt = t_ini:dt:t_fin;
trange = [t_ini t_fin];

M = [10 0 0;0 20 0;0 0 30];
K = 1e3*[45 -20 -15;-20 45 -25;-15 -25 40];
C = 3e-2*K;
F(1,:) = 0*tt;
F(2,:) = 0*tt;
omega = pi/.29;
F(3,:) = 50*sin(omega*tt);
for j = 1:n
    pulse(j) = sin(omega*tt(j));
    if tt(j) > pi/omega
        pulse(j) = 0;
    end
end
F(3,1:n) = 50*pulse;
x0 = [0 0 0];
xd0= [0 0 0];
[tp,x1] = newmark(M,C,K,F,trange,n,x0,xd0);
x1 = 1000*x1;
figure(1), plot(tp,x1(:,1),'k',tp,x1(:,2),'k',tp,x1(:,3),'k',tp,0*tp,'k')
xlabel('Time, s')
ylabel('x, mm')
axis([0 3 -5 10])
hold on
figure(1), plot(tt(1:60),5*pulse(1:60),'.k')
hold off
[t,x2] = ode45(@(t,y) f10(t,y),[t_ini:dt:t_fin],[0 0 0 0 0 0]);
x2 = 1000*x2;
d(:,1) = (x1(:,1)-x2(:,1));
d(:,2) = (x1(:,2)-x2(:,2));
d(:,3) = (x1(:,3)-x2(:,3));
figure(2), plot(tp,d(:,1),'k',tp,d(:,2),'k',tp,d(:,3),'k',tp,0*tp,'k')
xlabel('Time, s')
ylabel('Difference, mm')
axis([0 3 -1e-2 1e-2])

function yp = f10(t,y)
m = [10 0 0;0 20 0;0 0 30];
k = 1e3*[45 -20 -15;-20 45 -25;-15 -25 40];
c = 3e-2*k; f =[0; 0; 50];
omega = pi/.29;
pulse = sin(omega*t);
if t > pi/omega
pulse = 0;
end
A = [zeros(3,3) eye(3,3); -m\k -m\c];
b = [zeros(3,1); m\f*pulse];
yp = A*y+b;
end