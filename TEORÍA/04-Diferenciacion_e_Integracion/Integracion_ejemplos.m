%Integracion Numérica
f=@(x)(x^2)/(1+x^3)

I = Trap(f,0,3,10)

I = Simpson(f,0,3,10)

I=gaussquad(f,0,3,2)
 
I=gaussquad(f,0,3,3)
 
I=gaussquad(f,0,3,4)
 
