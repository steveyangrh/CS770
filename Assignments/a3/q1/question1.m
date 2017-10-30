close all
clear
clc

%% q1.1
%f = 'x^2-10*x';
%d = '2*x-10';
%x0 = 11
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%q1.2
%f = 'x*x+10';
%d = '2*x';
%x0 = 5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%q1.3
f = 'x^20-100';
d = '20*x^19';
x0 = 100000000;

[X,e] = newtons(f,d,x0);

plot(e,'ko-');
hold on;
xlabel('# of iterations');
ylabel('error')
title('Error vs Iterations');
