clear
clc
n = 100;
A = rand(n,1) * rand(1,n);

tic 
[L1,U1] = lu(A);
toc

n = 200;
A = rand(n,1) * rand(1,n);
tic 
[L1,U1] = lu(A);
toc

n = 400;
A = rand(n,1) * rand(1,n);
tic 
[L1,U1] = lu(A);
toc

%{
tic
[L2,U2,P]=LU_pivot(A);
toc
%}