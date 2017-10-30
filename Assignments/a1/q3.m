clear
clc
a = 1
b = -100000000
c = 1
x_1 = (-b + sqrt(b.^2-4*a*c))./(2*a);
x_2 = (-b - sqrt(b.^2-4*a*c))./(2*a);
A_1 = [x_1;x_2];
A_2 = roots([a b c]);