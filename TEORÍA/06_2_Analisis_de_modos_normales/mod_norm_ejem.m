%k=m=1
K=[2,-1,0;-1,2,-1;0,-1,2];  %matriz de las constantes
M=[1,0,0;0,1,0;0,0,1];  %matriz de las masas
x0=[1;0;0];     %posición inicial
xp0=[0;0;0];   %velocidad (x prima) inicial
[w] = modos_norm(K,M,x0,xp0)

K=str2sym('[2,-1,0;-1,2,-1;0,-1,2]'); 
M=str2sym('[1,0,0;0,1,0;0,0,1]'); 
x0=str2sym('[1;0;0]'); 
xp0=str2sym('[0;0;0]'); 
[w, x] = modos_norm_sym(K,M,x0,xp0)

%2 particulas
k1=10; k2=0.5; k3=10;
m1=1; m2=1;
K=[(k1+k2),-k2;-k2,(k2+k3)]; %sistema de dos partículas
M=[m1,0;0,m2];
x0=[1;0];
xp0=[0;0];
[w] = modos_norm(K,M,x0,xp0)

syms t k1 k2 k3 m1 m2;
K=[(k1+k2),-k2;-k2,(k2+k3)];
M=[m1,0;0,m2];
K=subs(K,{k1,k2,k3},{30,5,0});
M=subs(M,{m1,m2},{10,1});
x0=str2sym('[1;0]');
xp0=str2sym('[0;0]');
[w, x] = modos_norm_sym(K,M,x0,xp0)

%4 particulas
m=1;k=1;
M=[m,0,0,0;0,m,0,0; 0,0,m,0; 0,0,0,m];
K=[2*k,-k,0,0;-k,2*k,-k,0;0,-k,2*k,-k;0,0,-k,2*k];
x0=[1;0;0;0];
xp0=[0;0;0;0];
[w] = modos_norm(K,M,x0,xp0)

