[x,w] = lgwt(6,0,1);
f = '1./(1+x.^2)';
f = inline(f);
y = f(x);
i1=sum(w.*y)


