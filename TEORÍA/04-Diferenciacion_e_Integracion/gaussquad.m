function I=gaussquad(f,a,b,n)
F = @(t) f(((b-a)*t + (b+a))/2);
m=((b-a)/2);
if n==2
    w1=1; w2=1;
    x1=1/sqrt(3); x2=-1/sqrt(3);
    I=m*(w1*F(x1) + w2*F(x2));
elseif n==3
    w1=5/9; w2=8/9; w3=5/9;
    x1=sqrt(3/5); x2=0; x3=-sqrt(3/5);
    I=m*(w1*F(x1) + w2*F(x2) + w3*F(x3));
elseif n==4
    w1=0.347854845; w2=0.652145155; w3=0.652145155; w4=0.347854845;
    x1=-0.861136312; x2=-0.339981044; x3=0.339981044; x4=0.861136312;
    I=m*(w1*F(x1) + w2*F(x2) + w3*F(x3) + w4*F(x4));    
end