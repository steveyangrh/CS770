clear

x = 0:0.1:1;

f = cos(8*pi*x).^4;

F = 1./4*sin(16*pi*x)+sin(32*pi*x);

f-F



