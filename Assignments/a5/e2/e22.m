clear
close all
clc

n =21;

f = 'exp(cos(2*pi*x))';
f = inline(f);
x = linspace(0,1,n+1);
x = x(1:n);
F = f;
f = f(x);

X = 0:0.001:1;
%X = x;

a0 = plot(X,F(X));
hold on
N = length(X);
A = zeros(1,N);
[C,A] = myDFT(f,X);
A = real(A);
a1 = plot(X(1:end-1),A(1:end-1));

M0 = "Original function";
M1 = "Approximation";
legend([a0,a1], [M0,M1]);