function [coeffs] = nSpline(X,y)
%This function returns the coefficients of the natural cubic spline
%X and y are the input points where f(X(i)) = y(i)
%Each spline function on each interval has degree 3

%Si = ax^3+bx^2+cx+d
%We have n such Si's, where is n = length(X)-1
%coeffs should be [a1;b1;c1;d1;a2;b2;.....;an;bn;cn;dn]
    
    numP = length(X);
    %numP is the number of points
    n =numP - 1;
    %n is the number of spline functions
    
    
    
    
    
end

