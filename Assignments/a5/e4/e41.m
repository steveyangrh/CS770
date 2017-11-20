clear
close all
clc

n = 1000;

f = 'x-5';
f = inline(f);
x = linspace(5,10,n+1);
x = x(1:n);
F = f;
f = f(x);
f = f;


step = 0.001
%X = 5:step:10-step;
%X = [0 1/4 1/2 3/4];
X = x;



a0 = plot(X,F(X));
hold on
N = length(X);
A = zeros(1,N);
[C,A] = myDFT_new(f,x,X,5,10);
A = real(A);
a1 = plot(X,A);

M0 = "Original function";
M1 = "Approximation";
legend([a0,a1], [M0,M1]);
