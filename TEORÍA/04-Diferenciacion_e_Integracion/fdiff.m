function fdiff(f,x,h,n)
if n==1
    Fd=(f(x+h)-f(x))/h
    Bd=(f(x)-f(x-h))/h
    Cd=(f(x+h)-f(x-h))/(2*h)
elseif n==2
    Cd=(f(x+h)-2*f(x)+f(x-h))/(h^2)
elseif n==3
    Cd=(f(x+2*h)-2*f(x+h)+2*f(x-h)-f(x-2*h))/(2*h^3)    
end
