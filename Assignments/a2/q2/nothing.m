A = [10 -7 0;
    -3 4 6;
    7 -2 5];

[L,U,P]=LU_pivot(A);
L
U
P
L*U
P*A
