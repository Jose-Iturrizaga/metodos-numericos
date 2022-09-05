function ifft=invfastfourier(Fx)

ln=length(Fx);
IFFT=ones(ln,ln);

for j=1:ln-1
    for k=1:ln-1
        IFFT(j+1,k+1)=exp(2*j*k*pi*1i/ln);
    end   
end

IFFT=1/ln*IFFT;
ifft=IFFT*(FX);