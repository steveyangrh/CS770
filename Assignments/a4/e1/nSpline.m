function [coeffs] = nSpline(X,y)
%This function returns the coefficients of the natural cubic spline
%X and y are the input points where f(X(i)) = y(i)
%Each spline function on each interval has degree 3

%Si = a+bx+cx^2+dx^3
%We have n such Si's, where is n = length(X)-1
%coeffs should be [a1;b1;c1;d1;a2;b2;.....;an;bn;cn;dn]
%coeffs is a 4n by 1 vector
    
    numP = length(X);
    %numP is the number of points
    n =numP - 1;
    %n is the number of spline functions
    
    K = [];
    %initialize the matrix to be empty
    A = [];
    %A contains all the known values
    %K*coeffs = A
    
    %we construct the matrix using for loop
    for i = 1:numP
        a = (i-1)*4+1;
        b = a+1;
        c = b+1;
        d = c+1;
        %a,b,c,d are indices for the convinience of calculation
        
        if i==1
            tempK = zeros(1,4*n);
            tempK(1,c) = 2;
            tempK(1,d) = 6*X(i);
            K = [K;tempK];
            A = [A;0];
            tempK = zeros(1,4*n);
            tempK(1,a) = 1;
            tempK(1,b) = X(i);
            tempK(1,c) = X(i)^2;
            tempK(1,d) = X(i)^3;
            K = [K;tempK];
            A = [A;y(i)];
        end
        
        
        if i==numP
            tempK = zeros(1,4*n);
            tempK(1,c-4) = 2;
            tempK(1,d-4) = 6*X(i);
            K = [K;tempK];
            A = [A;0];
            tempK = zeros(1,4*n);
            tempK(1,a-4) = 1;
            tempK(1,b-4) = X(i);
            tempK(1,c-4) = X(i)^2;
            tempK(1,d-4) = X(i)^3;
            K = [K;tempK];
            A = [A;y(i)];
        end
        %these the special end points contraints for natural cubic constraint
        
        if i>1 && i<numP
            tempK = zeros(1,4*n);
            tempK(1,c-4) = 2;
            tempK(1,d-4) = 6*X(i);
            K = [K;tempK];
            A = [A;0];
            tempK = zeros(1,4*n);
            tempK(1,a-4) = 1;
            tempK(1,b-4) = X(i);
            tempK(1,c-4) = X(i)^2;
            tempK(1,d-4) = X(i)^3;
            K = [K;tempK];
            A = [A;y(i)];
        end
        %this is the constraint for S(xi) = yi
        
        if i>1 && i<numP
            tempK = zeros(1,4*n);
            tempK(1,b-4) = 1;
            tempK(1,c-4) = 2*X(i);
            tempK(1,d-4) = 3*X(i)^2;
            tempK(1,b) = -1;
            tempK(1,c) = -2*X(i);
            tempK(1,d) = -3*X(i)^2;
            K = [K;tempK];
            A = [A;0];
            %this is the constraint for Si'(xi) = Si+1'(xi)
            
            tempK = zeros(1,4*n);
            tempK(1,c-4) = 2;
            tempK(1,d-4) = 6*X(i);
            tempK(1,c) = -2;
            tempK(1,d) = -6*X(i);
            K = [K;tempK];
            A = [A;0];
            %this is the constraint for Si''(xi) = Si+1''(xi)
        end
    end
    
    coeffs = K\A;
    
end

