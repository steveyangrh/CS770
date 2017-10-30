close all
clear
clc

f = 'exp(-x)-sin(x)';

x0 =2;
[X,e] = mySteffensen(f,x0);
plot(e,'ko-');
hold on;
xlabel('# of iterations');
ylabel('error')
title('Error vs Iterations');
