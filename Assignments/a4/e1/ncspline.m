function yy=ncspline(xx, x,y)
	h=diff(x);
	n=length(x)-1;  
	a(1:n+1)=y(1:n+1);
	A=sparse(2:n,1:n-1,h(1:n-1),n+1,n+1) + ...
	  sparse(2:n,3:n+1,h(2:n),n+1,n+1) + ...
	  sparse(2:n,2:n,2*(h(1:n-1)+h(2:n)),n+1,n+1);
	A(1,1)=1; A(n+1,n+1)=1;
	b=[0,3./h(2:n).*(a(3:n+1)-a(2:n))-3./h(1:n-1).*(a(2:n)-a(1:n-1)),0]';
	c=(A\b)';
	b=(a(2:n+1)-a(1:n))./h-h./3.*(2*c(1:n)+c(2:n+1));
	d=(c(2:n+1)-c(1:n))./(3*h);
	c=c(1:n);
	for i=1:n
		if xx>=x(i) & xx<=x(i+1);
			  yy=a(i)+b(i)*(xx-x(i))+c(i)*(xx-x(i)).^2+d(i)*(xx-x(i)).^3;
			  break;
        end
    end
end