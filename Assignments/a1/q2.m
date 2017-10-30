close all
clear
clc

%% Inexactness of algebraic operations
a = 0.2;
b = 0;
for i = 1:10000
    b = b+a;
end
b == 2000


%% Noncommutativeness of algebraic operations
a = 0.1;
b = 0.1;
c = 10;
(a*b)*c == a*(b*c)

%% Cancellation errors

a = 0.2
a-a == 0
