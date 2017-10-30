close all
clc
clear


%% Question 1 (a)
% My chosen function is f(x) = ?x^2+x)sin(x)^2
% f'(x) = (2x+1)sin(x)^2 + (x^2+x)*sin(2x)
% for my chosen point, I select x to be 1
x = 1;
f_x = (x^2+x)*(sin(x)^2);
f_x_d = (2*x+1)*sin(x)^2 + (x^2+x)*sin(2*x);
errors1 = [];

for i = 1:20
    h = 10^(-i);
    f_x_h = ((x+h)^2+(x+h))*(sin(x+h)^2);
    error = (f_x_h-f_x)./h - f_x_d;
    errors1 = [errors1 log10(abs(error))];
end
plot(1:20,errors1);
hold on
%% Question 1 (b)

errors2 = [];
for i = 1:20
    h = 10^(-i);
    f_x_h = ((x+h)^2+(x+h))*(sin(x+h)^2);
    f_x_mh = ((x-h)^2+(x-h))*(sin(x-h)^2);
    error = (f_x_h-2*f_x+f_x_mh)./(h.^2);
    errors2 = [errors2 log10(abs(error))];
end
close all
hold on
plot(1:20,errors2);