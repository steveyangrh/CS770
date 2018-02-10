clear
close all
clc

n = 101;

%f = 'cos(pi/4*(x-0.4))';
%f = 'cos(2*pi*x)'
f = 'x'
f = inline(f);
a = 2;
b = 9;

x = linspace(a,b,n+1);
x = x(1:n);
F = f;
f = f(x);



step = 0.001;
X = a:step:b;
%X = [0 1/4 1/2 3/4];
%X = x;



a0 = plot(X,F(X));
hold on
N = length(X);
A = zeros(1,N);
[C,A] = myDFT_new(f,x,X,a,b);
A = real(A);
a1 = plot(X,A);

M0 = "Original function";
M1 = "Approximation";
legend([a0,a1], [M0,M1]);
