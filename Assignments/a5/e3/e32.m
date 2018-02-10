clc
clear
close all

n = 1001;

x = linspace(0,1,n+1);
x = x(1:n);

f = x;

[C,A] = myDFT(f,x);

C = -2*imag(C(1:(n+1)./2));

C = C(2:end)

Y = -1./(pi*(1:(n-1)./2))

error = abs(C-Y);

plot(1:length(C),error);

ylabel('difference')
xlabel('k')

