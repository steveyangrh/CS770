f = @(t,y) [0 1;-1 0]*y;
solode23 = ode45(f,[0,2*pi],[1;0])
solode23.stats