close all
clear 
clc

X_equil = -1:0.2:1;
y1_e = sin(pi*X_equil);


X_cheby = [];
for k = 1:11
    X_cheby = [0.5*(-1+1)+0.5*(1+1)*cos(pi*(2*k-1)./(2*11)) X_cheby];
end
y1_c = sin(pi*X_cheby);

p_equil = polyfit(X_equil,y1_e,10);
p_cheby = polyfit(X_cheby,y1_c,10);


X = -1:0.001:1
y0 = sin(pi*X);
y1 = polyval(p_equil,X);
y2 = polyval(p_cheby,X);
a0 = plot(X, y0);
hold on;
a1 = plot(X, y1);
hold on;
a2 = plot(X, y2);
M0 = "Original function";
M1 = "Polynomial - equil distance";
M2 = "Polynomial - chebv distance";
legend([a0,a1,a2], [M0,M1,M2]);


figure
X = -1:0.001:1;
y0 = sin(pi*X);
y1 = spline(X_equil,y1_e,X);
y2 = spline(X_cheby,y1_c,X);
a0 = plot(X, y0);
hold on;
a1 = plot(X, y1);
hold on;
a2 = plot(X, y2);
M0 = "Original function";
M1 = "CSpline - equil distance";
M2 = "CSpline - chebv distance";
legend([a0,a1,a2], [M0,M1,M2]);