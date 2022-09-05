function [T0,V0]=SIRVnew(p,beta,v,gamma,T0,h)
syms s1 it1 r1
S=@(s,it,r) -beta*s*it+v*r-p*s;
V=@(s) p*s;
I=@(s,it) beta*s*it-gamma*it;
R=@(it,r) gamma*it-v*r;

S1(s1,it1,r1)=T0(1)+h*S(s1,it1,r1)-s1;
I1(s1,it1,r1)=T0(2)+h*I(s1,it1)-it1;
R1(s1,it1,r1)=T0(3)+h*R(it1,r1)-r1;
fn=[S1; I1; R1];
tol=1e-5;
nit=1e3;
fp=jacobian(fn);
for j=1:nit
    F=double(fn(T0(1),T0(2),T0(3)));
    J=double(fp(T0(1),T0(2),T0(3)));
    y=-J\F;
    if norm(y)<tol
        break
    end
    T0=T0+y;
end
V0=V(T0(1));
