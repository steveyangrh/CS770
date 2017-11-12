[x,w] = lgwt(6,0,1);

f = '4./(1+x.^2)';
f = inline(f);
y = f(x);
i1=sum(w.*y)

f = '4./(1+x.^2)';
i2 = Trapezoidal(0,1,5,f)