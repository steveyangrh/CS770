function [X,errors] = nf(f,d,d2,x0,tol,maxiter)
% f is the input function, in our implementation, it's a string
% d is the input derrivative, in our implementation, it's a string
% x0 is the initial guess of the root
% tol is the error tollerance
% maxiter is the maximum iteration

    switch nargin
        case 4
            tol = 10^-4;
            maxiter = 10000;
        case 5
            tol = 10^-4;
    end
    % the default tollerence is set to be 10^-4
    % the default maximum iteration is set to be 10000
    
    f = inline(f);
    d = inline(d);
    d2 = inline(d2);
    %change the text version of the function and derrivative
    %to numerical version
    
    X = [];
    X = [X x0];
    errors = [];
    x1 = x0 - (f(x0).*d(x0))./(d(x0).^2-f(x0).*d2(x0));
    X = [X x1];
    errors = [errors abs(x1-x0)];
    
    k = 1;
    while errors(k) >= tol && k <= maxiter
    %while (k <= maxiter) && (errors(k) >= tol)
        x0 = X(k+1);
        tempX = x0- (f(x0).*d(x0))./(d(x0).^2-f(x0).*d2(x0));
        %calculate the next value
        errors = [errors abs(tempX - X(end))];
        X = [X tempX];
        k = k+1
    end
        
end