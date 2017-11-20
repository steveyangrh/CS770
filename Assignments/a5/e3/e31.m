syms n t

w0 = pi;To=1;n=1:5

a0 = (1./To)*int(1,t,0,1)

an = (2./To)*int(1*cos(n*w0*t),t,0,1)
bn = (2./To)*int(1*sin(n*w0*t),t,0,1)