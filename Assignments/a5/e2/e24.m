clear
close all
clc

n = 100;

m=100;

f = '((x-0.5)./0.5)';
f = inline(f);
x = linspace(0,1,n+1);
x = x(1:n);
F = f;
f = f(x).^m;



X = 0:0.0001:1;
%X = x;

a0 = plot(X,F(X).^m);
hold on
N = length(X);
A = zeros(1,N);
[C,A] = myDFT(f,X);
A = real(A);
a1 = plot(X(1:end-1),A(1:end-1));

M0 = "Original function";
M1 = "Approximation";
legend([a0,a1], [M0,M1]);