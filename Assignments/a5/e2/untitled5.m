clc
clear

% Generate data 
x = linspace(0,1,5)'; 
y = x; 
% Use FSERIES to fit 
[a,b,yfit] = Fseries(x,y,4); 
% Evaluate on finer grid 
xfine = linspace(0,1)'; 
yfine = Fseriesval(a,b,xfine); 
% Visualize results 
plot(x,y,'x',x,yfit,'o',xfine,yfine)