clear
clc

x = [0 1 2 3 4 5 6 7 8 9 10];
y = sin(x);

coeffs = nSpline(x,y);

coeff_1 = coeffs(5:8);
xx = 0:0.01:1;
yy1 = ncspline(xx,x,y)
yy2 = spline(x,y,xx);
yy1-yy2