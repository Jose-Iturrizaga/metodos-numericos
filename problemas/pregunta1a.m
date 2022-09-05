P=[0 1e-4 5e-4 1e-3];
Beta=[33e-5 43e-5];
Vi=[1/(50*24*60) 1/(90*24*60)];
s0=50; i0=1; r0=0;
Gamma=[1e-3 5e-3];
t0=0; tf=3000; h=6;
n=(tf-t0)/h;
Sol=zeros(4*2*2*2,7);
u=1;

for pi=1:4
    p=P(pi);
    for b=1:2
        beta=Beta(b);
        for vi=1:2
            v=Vi(vi);
            for y=1:2
                gamma=Gamma(y);
                T0=[s0; i0; r0];
                for i=1:n
                    [T0,V0]=SIRV(p,beta,v,gamma,T0,h);
                    %SIRnew(p,beta,v,gamma,T0,h)
                    i
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
    end
end

ST=string(Sol);
for i=1:numel(ST)
    ST(i)=sprintf('%.4f',ST(i));
end
array2table(str2double(ST),'VariableNames',{'p','beta','v',...
    'gamma','S(tf)','I(t)','R(t)','V(t)'})