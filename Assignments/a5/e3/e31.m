clear

n = 11;

x = linspace(0,1,n+1);
x = x(1:n);

f = cos(8*pi*x).^4;

[C,A] = myDFT(f,x);

C







