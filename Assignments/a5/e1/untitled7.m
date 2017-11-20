f = 'cos(2*pi*x)';
%f = 'abs(x-0.5)';
%f = 'x-0.5';
f = inline(f);

x = [0 1./4 2./4 3./4];
f = [1 1 1 1];
X = x;

[C,A] = myDFT(f,x,X)