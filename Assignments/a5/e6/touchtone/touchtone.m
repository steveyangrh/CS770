function touchtone(arg)
% TOUCHTONE  Use FFT to 
% synthesize and analyze telephone dialing
% The dual tone multi-frequency (DTMF) standard specifies that the tone
% generated by a button on 
% a telephone key pad is the sum of two sinusoids,
% with frequencies determined by the button's row and column.
% The dial pad on the upper left 
% allows you to select buttons and generate
% the corresponding tones.
% The signal plotted on the upper right 
% is a recording of the FAX number
% for the MathWorks being dialed.  
% You can replay the entire signal, or
% select individual segments.  
% The power plot is the magnitude of the FFT
% of the signal being played.  
% What is the MathWorks FAX number?

if nargin == 0

   % Initialize

   load touchtone         
   % Dialpad D, recorded signal y.sig, sample rate y.fs
   n = length(y.sig);     
   % Total number of samples
   t = (0:n-1)/y.fs;      
   % Time for entire signal
   y = double(y.sig)/128; 
   % Convert from signed 8 bit integers to doubles

   clf
   shg
   set(gcf,'double','on','name','TouchTone', ...
      'menu','none','numbertitle','off');

   ax.dialpad = axes('pos',[.14 .46 .30 .50]);
   imagesc(D)
   colormap(gray)
   set(ax.dialpad,'tag','dialpad',...
      'userdata',[zeros(1,4) fix(10000*membranetx(1,1))],...
      'xtick',[],'xcolor',[1 1 1],'ytick',[],'ycolor',[1 1 1]);

   ax.signal = axes('pos',[.60 .60 .36 .25]);
   plot(t,y,'k')
   axis([min(t) max(t) -1 1])
   xlabel('t(secs)')
   set(ax.signal,'tag','signal','userdata',[t; y])

   ax.sample = axes('pos',[.10 .16 .36 .25]);
   axis([0 1/64 -5/4 5/4])
   xlabel('t(secs)')

   ax.power = axes('pos',[.60 .16 .36 .25]);
   axis([500 1700 0 600])
   xlabel('f(Hz)')
   title('Power')

   set(gcf,'userdata',ax,'windowbuttonupfcn', ...
      'touchtone(get(gca,''tag''))')

   uicontrol('units','normal','pos',[.72,.88,.12,.06], ...
      'string','play all','callback','touchtone playall');
   uicontrol('units','normal','pos',[.38,.02,.12,.05], ...
      'string','help','callback','helpwin touchtone');
   uicontrol('units','normal','pos',[.52,.02,.12,.05], ...
      'string','close','callback','close(gcf)');

elseif isequal(arg,'dialpad')

   % DTMF, Dual tone multi-frequencies, Hz

   fr = [697 770 852 941];
   fc = [1209 1336 1477 1633];
   
   % Time (seconds)

   Fs = 32768;
   t = 0:1/Fs:0.25;

   % Plot component frequencies

   cp = get(gca,'currentpoint');
   k = min(max(ceil(cp(1,2)/50),1),4);
   j = min(max(ceil(cp(1,1)/50),1),3);
   f = [fr(k) fc(j)];
   p = [1/2 1/2];
   ax = get(gcf,'userdata');
   set(gcf,'currentaxes',ax.power)
   plot([f;f],[0*p;p],'c-',f,p,'b.','markersize',16)
   axis([500 1700 0 1])
   set(gca,'xtick',[fr(k) fc(j)])
   xlabel('f(Hz)')
   title('Power')

   % Superimpose two sinusoidal tones

   y1 = sin(2*pi*fr(k)*t);
   y2 = sin(2*pi*fc(j)*t);
   y = (y1 + y2)/2;

   % Plot generated tone

   set(gcf,'currentaxes',ax.sample)
   plot(t(1:512),y(1:512));
   axis([0 1/64 -5/4 5/4])
   xlabel('t(secs)')

   % Restore signal plot

   set(gcf,'currentaxes',ax.signal)
   ty = get(ax.signal,'userdata');
   plot(ty(1,:),ty(2,:),'k')
   axis([min(ty(1,:)) max(ty(1,:)) -1 1])
   xlabel('t(secs)')
   set(ax.signal,'tag','signal','userdata',ty)

   % Play tone

   sound(y,Fs)

   % Extra

   d = get(ax.dialpad,'userdata');
   d(1:4) = d(2:5);
   if k < 4, d(4) = -3*(k-1)-j; else, d(4) = 2-j; end
   set(ax.dialpad,'userdata',d)
   p = polyval(d,10);
   if p == 7 | p == 2707
      load touchtone
      y = double(z.msg)/128;
      if p > 7, y = fliplr(y); end
      set(gcf,'currentaxes',ax.sample)
      n = length(y);
      t = (0:n-1)/z.fs;
      plot(t,y)
      axis([0 max(t) -1 1])
      set(gcf,'currentaxes',ax.power)
      f = (0:n-1)*z.fs/n;
      plot(f,abs(fft(y-mean(y))),'color',[0 2/3 0])
      axis([0 1000 0 700])
      sound(y,z.fs)
   end

elseif isequal(arg,'playall')

   % Restore plots

   ax = get(gcf,'userdata');
   set(gcf,'currentaxes',ax.signal)
   ty = get(ax.signal,'userdata');
   t = ty(1,:);
   y = ty(2,:);
   Fs = 1/t(2);
   plot(t,y,'b')
   axis([min(t) max(t) -1 1])
   xlabel('t(secs)')
   set(ax.signal,'tag','signal','userdata',ty)
   delete(get(ax.sample,'child'))

   % Plot the power of the entire signal

   set(gcf,'currentaxes',ax.power)
   n = length(y);
   f = (Fs/n)*(0:n-1);
   p = abs(fft(y));
   plot(f,p,'color',[0 2/3 0]);
   axis([500 1700 0 600])
   xlabel('f(Hz)')
   title('Power')

   % Play the entire signal

   sound(y,Fs);
   pause(max(t))

   set(get(ax.signal,'child'),'color','k')

elseif isequal(arg,'signal')

   ax = get(gcf,'userdata');
   set(gcf,'currentaxes',ax.signal)
   ty = get(ax.signal,'userdata');
   t = ty(1,:);
   y = ty(2,:);
   Fs = 1/t(2);
   n = length(y);
   segs = 11;        % Number of equally spaced segments
   nseg = n/segs;    % Number of samples in one segment

   % Highlight segment

   cp = get(gca,'currentpoint');
   k = ceil(cp(1,1)*segs/max(t));
   if k < 1 | k > segs, return, end
   j0 = (k-1)*nseg+1;
   j1 = k*nseg;
   j = j0:j1;
   je = [1:j0 j1:n];
   plot(t(j),y(j),'b-',t(je),y(je),'k-', ...
      [t(j0) t(j0)],[-1 1],'k-',[t(j1) t(j1)],[-1 1],'k-');
   axis([min(t) max(t) -1 1])
   xlabel('t(secs)')
   set(ax.signal,'tag','signal','userdata',[t; y])

   % Zoom in

   set(gcf,'currentaxes',ax.sample)
   jz = j0+round(mean(find(y(j)>.5)));
   tz = round(10*t(jz))/10;
   jk = find(abs(t-tz) == min(abs(t-tz)))+(-64:64);
   plot(t(jk),y(jk))
   axis([min(t(jk)) max(t(jk)) -1 1])
   xlabel('t(secs)')

   % Fourier components

   set(gcf,'currentaxes',ax.power)
   p = abs(fft(y(j)));
   f = (Fs/nseg)*(j-j0);
   plot(f,p,'color',[0 2/3 0])
   axis([500 1700 0 300])
   xlabel('f(Hz)')
   title('Power')

   % Play segment

   sound(y(j))
else
    len = length(arg);
    fr = [697 770 852 941];
    fc = [1209 1336 1477];
    Fs = 32768;
    t = 0:1/Fs:0.25;
    for i = 1:1:len
        c = arg(i);
        if c == '-'
            continue
        else
            switch c
                case '*'
                    k = 4; 
                    j = 1;
                case '0'
                    k = 4; j = 2;
                case '#'
                    k = 4; 
                    j = 3;
                otherwise
                    d = c-'0'; 
                    j = mod(d-1,3)+1; 
                    k = (d-j)/3+1;
            end
            y1 = sin(2*pi*fr(k)*t);
            y2 = sin(2*pi*fc(j)*t);
            y = (y1 + y2)/2;
            sound(y,Fs)
            pause(0.4)
        end
    end
end
