function [C,A] = myDFT(f,x,X)
% discrete Fourier transform
% Output: C,A
% C contains the DFT coefficients
% A contains the DFT approxmiation
% Input: f,x,X
% f contains the function values
% x contain the x values
% X contains the X values which are to be approximated
    
    n = length(x);
    % n is the number of points
    
    C=zeros(1,n);
    % initialize the coefficients to 0
    
    i = sqrt(-1);
    % initialize i
    
    for k = 0:n-1
        for j = 0:n-1
            C(k+1) = C(k+1)+(1./n)*f(j+1)*exp(2*pi*k*(j./n)*i);
        end
    end
    % Calculating the DFT coefficients
    
    N = length(X);
    A = zeros(1,N);
    for i = 0:N-1
        for k = 0:n-1
            A(i+1) = A(i+1) + C(k+1)*exp(2*pi*(k./n)*i*X(i+1)); 
        end
    end
    % Calculating the DFT approximations
    A = fliplr( A );
    
end
