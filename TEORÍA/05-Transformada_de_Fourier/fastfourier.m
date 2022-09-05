function fft=fastfourier(fx)

ln=length(fx);
FFT=ones(ln,ln);

for j=1:ln-1
    for k=1:ln-1
        FFT(j+1,k+1)=exp(-2*j*k*pi*1i/ln);
    end
end
fft=(FFT*fx');
