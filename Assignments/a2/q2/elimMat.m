function [M,L] = elimMat(A,k)
    [i,j]=size(A);   %get the size of A
    L=eye(i);       %make L an identity matrix       
    x_0=A(:,k);     %select the kth column from A
    x_1=x_0/A(k,k);   
    L(:,k)=x_1;     %set kth column in L to be x_1
    L=tril(L);      %eliminate the upper part of L, and set it to L
    M=inv(L);       %M is the inverse of L
end
    
    
