A = [6 4 3;4 3 2;3 4 2];
[cond(A,1) cond(A,inf) cond(A,'fro')]

A = [1 1/2 1/3 1/4;1/2 1/3 1/4 1/5;1/3 1/4 1/5 1/6;1/4 1/5 1/6 1/7];
[cond(A,1) cond(A,inf) cond(A,'fro')]

%Perturbación en b
A = [1 2;2 4.0001];
b = [-1; -2.0002];
x=A\b;
db = [0; 0.0001];
bp = b+db;
xp=A\bp;
U_Lim = cond(A)*norm(db)/norm(b)
nrm_err = norm(x-xp)/norm(x)

%Perturbación en A
dA = [0 -0.01;0.01 0];
Ap = A+ dA;
xp=Ap\b;
U_Lim = cond(A)*norm(dA)/norm(A)
nrm_err = norm(x-xp)/norm(x)


n = 6, format long
a = hilb(n); b = ones(n,1);
xc = a\b;
x = invhilb(n)*b;
nrm_err = norm(xc-x)/norm(x)
r = b-a*xc;
L_Lim = (1/cond(a))*norm(r)/norm(b)
U_Lim = cond(a)*norm(r)/norm(b)