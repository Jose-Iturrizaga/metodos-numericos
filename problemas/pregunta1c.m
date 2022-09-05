beta=33e-5;
v=1/(50*24*60);
s0=50; i0=1; r0=0;
Gamma=[1e-3 5e-3];
t0=0; tf=3000; h=6;
n=(tf-t0)/h;
P=0.001*rand(30,1);
Sol=zeros(30*2,7);
u=1;
m=randi(30);
MOD=zeros(n,4);
for t=1:30
    p=P(t);
    for y=1:2
        gamma=Gamma(y);
        T0=[s0; i0; r0];
        for i=1:n
            [T0,V0]=SIRV(p,beta,v,gamma,T0,h);
            %SIRnew(p,beta,v,gamma,T0,h,n)
            if t==m
                MOD(i,1:4)= [T0' V0];
            end
        end
        Sol(u,1)=p;
        Sol(u,2)=beta;
        Sol(u,3)=v;
        Sol(u,4)=gamma;
        Sol(u,5:7)=T0;
        Sol(u,8)=V0;
        u=u+1;
    end
end

ST=string(Sol);
for i=1:numel(ST)
    ST(i)=sprintf('%.6f',ST(i));
end
array2table(str2double(ST),'VariableNames',{'p','beta','v',...
    'gamma','S(tf)','I(t)','R(t)','V(t)'})

figure
plot(1:h:n*h,MOD(:,1),'Linewidth',2), hold on
plot(1:h:n*h,MOD(:,2),'Linewidth',2), hold on
plot(1:h:n*h,MOD(:,3),'Linewidth',2), hold on
plot(1:h:n*h,MOD(:,4),'Linewidth',2), hold on
legend('S(t)','I(t)','R(t)','V(t)','Location','Best')
xlabel('t')
ylabel('Personas')
title('Modelo SIRV')