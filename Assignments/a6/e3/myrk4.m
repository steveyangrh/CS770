function [tout,yout] = myrk4(F,tspan,y0,h,varargin)

    t0 = tspan(1);
    tfinal = tspan(2);
    t = t0;
    y = y0(:);

  
    tout = t;
    yout = y.';
    

    while t ~= tfinal

      s1 = F(t, y, varargin{:});

      if 1.1*abs(h) >= abs(tfinal - t)
        h = tfinal - t;
      end

      s2 = F(t+h/2, y+(h/2)*s1, varargin{:});
      s3 = F(t+h/2, y+(h/2)*s2, varargin{:});
      s4 = F(t+h, y+h*s3, varargin{:});

      tnew = t + h;
      ynew = y + h*(s1 + 2*s2 + 2*s3 + s4)/6;

      tout(end+1,1) = tnew; 
      yout(end+1,:) = ynew.';

      t = tnew;
      y = ynew;
    end
