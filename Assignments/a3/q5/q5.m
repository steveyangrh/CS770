clear
close all
clc

%% q1
phi = 'x^2+1';
x0 = -1.1;
[X,e] = fp(phi,x0);
plot(e,'ko-');
hold on;
xlabel('# of iterations');
ylabel('error')
title('Error vs Iterations');
%% q2
phi = '(2+x)^0.5';
%% q3
phi = '-((2+x)^0.5)';
%% q4
phi = '1+2./x';
