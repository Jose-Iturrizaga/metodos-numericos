function [T0,V0]=SIRV(p,beta,v,gamma,T0,h)

S=@(s,it,r) -beta*s*it+v*r-p*s;
V=@(s) p*s;
I=@(s,it) beta*s*it-gamma*it;
R=@(it,r) gamma*it-v*r;
options = optimoptions('fsolve','Display','off');

F = @(T) [T0(1)+h*S(T(1),T(2),T(3))-T(1);
    T0(2)+h*I(T(1),T(2))-T(2);
    T0(3)+h*R(T(2),T(3))-T(3)];

T0=fsolve(F,T0,options);

V0=V(T0(1));
