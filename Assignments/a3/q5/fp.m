function [X,errors] = fp(phi,x0,tol,maxiter)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    switch nargin
        case 2
            tol = 10^-4;
            maxiter = 10000;
        case 3
            tol = 10^-4;
    end
    % the default tollerence is set to be 10^-4
    % the default maximum iteration is set to be 10000
    
    phi = inline(phi);
    %change the text version of the function and derrivative
    %to numerical version
    
    X = [];
    X = [X x0];
    errors = [];
    x1 = phi(x0);
    X = [X x1];
    errors = [errors abs(x1-x0)];
    
    k = 1;
    while errors(k) >= tol && k <= maxiter
    %while (k <= maxiter) && (errors(k) >= tol)
        x0 = X(k+1);
        tempX = phi(x0);
        %calculate the next value
        errors = [errors abs(tempX - X(end))];
        X = [X tempX];
        k = k+1;
    end

end

