close all
clear
clc

f = 'exp(x)*((x-1)^2)'
d = '2*(x-1)*exp(x)+exp(x)*((x-1)^2)'
x0 = 100;



[X,e] = newtons(f,d,x0);

plot(e,'ko-');
hold on;
xlabel('# of iterations');
ylabel('error')
title('Error vs Iterations');
