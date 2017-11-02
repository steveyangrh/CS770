function [coeffs] = lagrange(X,y)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    n = length(y);
    
    K = [];
    for i = 1:n
        tempK = zeros(1,n);
        for j = 1:n
            tempK(j) = X(i).^(j-1);
        end
        K = [K;tempK];
    end
    coeffs = K\y;
end

