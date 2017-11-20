function [C,A] = myDFT_new(f,x,X,a,b)
% discrete Fourier transform
% Output: C,A
% C contains the DFT coefficients
% A contains the DFT approxmiation
% Input: f,X
% f contains the function values
% X contains the X values which are to be approximated

    I = b-a;
    
    n = length(f);
    % n is the number of points
    
    C=zeros(1,n);
    % initialize the coefficients to 0
    
    i = sqrt(-1);
    % initialize i
    
    for k = 0:n-1
        for j = 0:n-1
            C(k+1) = C(k+1)+(1./n)*f(j+1)*exp(-2*(pi./I)*k*(x(j+1)-a)*i);
        end
    end
    % Calculating the DFT coefficients
    
    N = length(X);
    A = zeros(1,N);
    for j = 0:N-1
        for k = 0:n-1
            A(j+1) = A(j+1) + C(k+1)*exp(2*(pi./I)*(k)*i*(X(j+1)-a));            
        end
    end
    % Calculating the DFT approximations
end

