tspan = [0 2*pi];
y0 = 0;
%odeset('RelTol',1e-6)
odeset('RelTol', 1e-6, 'AbsTol', 1e-6)
%[t,y] = ode23(@(t,y) -1, tspan, y0)
o = ode45(@(t,y) [0 1;-1 0]*y , tspan, [1;0], pi/50)
o.stats