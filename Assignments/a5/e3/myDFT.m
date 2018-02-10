function [C,A] = myDFT(f,X)
% discrete Fourier transform
% Output: C,A
% C contains the DFT coefficients
% A contains the DFT approxmiation
% Input: f,X
% f contains the function values
% X contains the X values which are to be approximated
    
    n = length(f);
    % n is the number of points
    
    C=zeros(1,n);
    % initialize the coefficients to 0
    
    i = sqrt(-1);
    % initialize i
    
    for k = 0:n-1
        for j = 0:n-1
            C(k+1) = C(k+1)+(1./n)*f(j+1)*exp(-2*pi*k*(j./n)*i);
        end
    end
    % Calculating the DFT coefficients
    
    N = length(X);
    A = zeros(1,N);
    
    for i = 1:N
        for j = 1:(n-1)./2
            A(i) = A(i) + 2*real(C(j+1))*cos(2*pi*j*X(i))-...
            2*imag(C(j+1))*sin(2*pi*j*X(i));
        end
        A(i) = A(i) + C(1);
    end
    % Calculating the DFT approximations
end
