function [to,yo] = myrk42_jennie(F,tspan,y0,h,varargin)

%   Example    
%      tspan = [0 2*pi];
%      y0 = [1 0]';
%      F = @(t,y) [0 1; -1 0]*y;
%      ode23tx(F,tspan,y0);

% Starting variables
%h = pi./50;
plotfun = @odeplot;

t0 = tspan(1);
tfinal = tspan(2);
tdir = sign(tfinal - t0);
plotit = (nargout == 0);

t = t0;
y = y0(:);
 
% for the output
if plotit
   plotfun(tspan,y,'init');
else
   to = t;
   yo = y.';
end
 
% Compute initial step size.
 s1 = F(t, y, varargin{:});
 
% create a counter & main loop
c = 0;
while t ~= tfinal
    c = c+1;
   
   % if t close tfinal
    if 1.1*abs(h) >= abs(tfinal - t)
      h = tfinal - t;
   end
   
   % step
   s2 = F(t+h/2, y+h/2*s1, varargin{:});
   s3 = F(t+h/2, y+h/2*s2, varargin{:});
   s4 = F(t+h, y+h*s3, varargin{:});
   tnew = t + h;
   ynew = y + h*(s1 + 2*s2 + 2*s3+s4)/6;
   
      
   % error estimate
   e = h*(-5*s1 + 6*s2 + 8*s3 - 9*s4)/72;
   e_estimate= norm(e./max(max(abs(y),abs(ynew)),h),inf) + realmin;
 
   if e_estimate <= h
      t = tnew;
      y = ynew;
      if plotit
         if plotfun(t,y,'');
            break
         end
      else
         to(end+1,1) = t;
         yo(end+1,:) = y.';
      end
      s1 = s4;    
   end

end

% plot 
if plotit
   plotfun([],[],'done');
end

%print values
c
e_estimate
y0
y