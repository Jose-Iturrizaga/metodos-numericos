function vq = akima(x,v,xq)

assert(isvector(x) && isvector(v) && (numel(x) == numel(v)))
assert(numel(x) > 2)

x = x(:).'; v = v(:).';
h = diff(x);
de = diff(v)./h;
n = numel(de) + 1;

de_0  = 2*de(1)   - de(2);
de_m1 = 2*de_0    - de(1);
de_n  = 2*de(n-1) - de(n-2);
de_n1 = 2*de_n    - de(n-1);
del = [de_m1 de_0 de de_n de_n1];
w = abs(diff(del));
w1 = w(1:n);
w2 = w(3:end);
de1 = del(2:n+1);
de2 = del(3:n+2);

s = (w2./(w1 + w2)) .* de1 + (w1./(w1 + w2)) .* de2;
ind = w1 == 0 & w2 == 0;
s(ind) = (de1(ind) + de2(ind)) / 2;

vq = ppval(pwch(x,v,s,h,de),xq);