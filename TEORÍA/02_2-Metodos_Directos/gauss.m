function x=gauss(A,b)
n=length(b);
x=zeros(n,1);
Aug = [A b]
for j=1:n-1
    for i=j+1:n
        m=Aug(i,j)/Aug(j,j);
        Aug(i,:)=Aug(i,:)-m*Aug(j,:);
    end
end
Aug
x(n) = Aug(n,n+1)/Aug(n,n);
for k=n-1:-1:1
    x(k) = (Aug(k,n+1)-Aug(k,k+1:n)*x(k+1:n))/Aug(k,k);
end