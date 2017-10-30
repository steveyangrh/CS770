close all
clear
clc


f = 'exp(x)*((x-1)^2)';
d = '2*(x-1)*exp(x)+exp(x)*((x-1)^2)';
d2 = '2*(x-1)*exp(x)+exp(x)*((x-1)^2)+exp(x)*2*(x-1)+exp(x)*2';

x0 =2;
[X,e] = nf(f,d,d2,x0);
plot(e,'ko-');
hold on;
xlabel('# of iterations');
ylabel('error')
title('Error vs Iterations');
