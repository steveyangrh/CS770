function [L,U] = myLU(A)
    [a,b]=size(A);
    U=A;                    %initialize U
    L=eye(a);               %make L an identity atrix
    k=1;                    %set k to 1
    while k>=1&k<a          %a while loop
        [m,l]=elimMat(U,k);  
        U=m*U;
        L=L*l;
        k=k+1;
    end
end
    