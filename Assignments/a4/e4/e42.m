close all
clear 
clc

X_equil = -1:0.2:1;
y1_e = sin(pi*X_equil);
y2_e = 1./(1+25*(X_equil.^2));
y3_e = abs(X_equil);

X_cheby = [];
for k = 1:11
    X_cheby = [0.5*(-1+1)+0.5*(1+1)*cos(pi*(2*k-1)./(2*11)) X_cheby];
end
y1_c = sin(pi*X_cheby);
y2_c = 1./(1+25*(X_cheby.^2));
y3_c = abs(X_cheby);


X = -1:0.01:1;

%%function1
y = sin(pi*X);
yy1 = spline(X_equil,y1_e,X);
yy2 = spline(X_cheby,y1_c,X);
subplot(1,3,1);

plot(X,yy1);
%hold on;
%plot(X,yy2);
title('Original function');
hold on;

subplot(1,3,2)
title('Equil distance');
hold on;
coeffs = nSpline(X_equil,y1_e);
for i = 1:10
    coeff = coeffs((i-1)*4+1:i*4);
    x = -1+(i-1)*0.2:0.01:-1+i*0.2;
    y_my_e = coeff(1)+coeff(2)*x+coeff(3)*x.^2+coeff(4)*x.^3;
    plot(x,y_my_e);
    hold on;
end


subplot(1,3,3);
title('Cheb points');
coeffs = nSpline(X_cheby,y1_c);
for x = -1:0.01:1;
    if x < X_cheby(1) || x > X_cheby(11)
        hold on
        continue
    end
    if x >= X_cheby(1) && x <= X_cheby(2)
        coeff = coeffs(1:4);
    end
    if x >= X_cheby(2) && x <= X_cheby(3)
        coeff = coeffs(5:8);
    end
    if x >= X_cheby(3) && x <= X_cheby(4)
        coeff = coeffs(9:12);
    end
    if x >= X_cheby(4) && x <= X_cheby(5)
        coeff = coeffs(13:16);
    end
    if x >= X_cheby(5) && x <= X_cheby(6)
        coeff = coeffs(17:20);
    end
    if x >= X_cheby(6) && x <= X_cheby(7)
        coeff = coeffs(21:24);
    end
    if x >= X_cheby(7) && x <= X_cheby(8)
        coeff = coeffs(25:28);
    end
    if x >= X_cheby(8) && x <= X_cheby(9)
        coeff = coeffs(29:32);
    end
    if x >= X_cheby(9) && x <= X_cheby(10)
        coeff = coeffs(33:36);
    end
    if x >= X_cheby(10) && x <= X_cheby(11)
        coeff = coeffs(37:40);
    end
    y_my_e = coeff(1)+coeff(2)*x+coeff(3)*x.^2+coeff(4)*x.^3;

    plot(x,y_my_e,'o');
    hold on;
end