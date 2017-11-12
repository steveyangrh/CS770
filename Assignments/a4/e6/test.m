n = 10000;

f = '4./(1+x.^2)';
i1 = Trapezoidal(0,1,n,f);
i2 = Trapezoidal(0,1,2*n,f);
i4 = Trapezoidal(0,1,4*n,f);

(i1-i2)./(i2-i4)