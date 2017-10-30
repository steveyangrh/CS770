function [X,errors] = mySteffensen(f,x0,tol,maxiter)
% This function takes as inputs: a fixed point iteration function, f, 
% and initial guess to the fixed point, p0, and a tolerance, tol.
% The fixed point iteration function is assumed to be input as an
% inline function. 
% This function will calculate and return the fixed point, p, 
% that makes the expression f(x) = p true to within the desired 
% tolerance, tol. 

    switch nargin
        case 2
            tol = 10^-4;
            maxiter = 10000;
        case 3
            tol = 10^-4;
    end
    
    f = inline(f);
    
    X = [];
    X = [X x0];
    errors = [];
    x1 = x0 - (f(x0)*f(x0))./(f(x0+f(x0))-f(x0));
    X = [X x1];
    errors = [errors abs(x1-x0)];
    
    k = 1;
    while errors(k) >= tol && k <= maxiter
    %while (k <= maxiter) && (errors(k) >= tol)
        x0 = X(k+1);
        tempX = x0 - (f(x0)*f(x0))./(f(x0+f(x0))-f(x0));
        %calculate the next value
        errors = [errors abs(tempX - X(end))];
        X = [X tempX];
        k = k+1
    end
    
    
end