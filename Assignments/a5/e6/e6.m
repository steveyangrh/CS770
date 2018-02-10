clear
clc
close all

load touchtone

Fs = y.fs;


k=10


y = double(y.sig)/128;

n = length(y);

y = y(floor(k*n/11)+1:floor((k+1)*n/11));

n = length(y);
t = (0:n-1)/Fs;

p = abs(fft(y));
f = (0:n-1)*(Fs/n);
plot(f,p);
axis([500 1700 0 600]);

sound(y,Fs);
pause(max(t))
