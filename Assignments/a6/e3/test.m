clear
clc
tspan = [0 2*pi];
y0 = [1 0]';
F = '[0 1; -1 0]*y';

[tout,yout]=myrk4(F,tspan,y0,pi/2)