e1 = 'x^3-x';
e1 = inline(e1);

e3 = '(2*(x+1)./2)*(x^2-x)';
e3 = inline(e3);

for i=0:0.01:1
   plot(i,e1(i)-e3(i));
   hold on;
end

