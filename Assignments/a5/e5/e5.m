range = 1:2:101
mses = zeros(1,length(range));


for i = 1:length(range)
    
    
    n = range(i);
    f = 'x.^(0.5+2)';
    f = inline(f);
    x = linspace(0,1,n+1);
    x = x(1:n);
    F = f;
    f = f(x);

    X = 0:0.0001:1;
    [C,A] = myDFT(f,X);
    mse = sqrt(mean(mean((F(X) - A).^2)));
    mses(i) = mse;
end

plot(range,mses)
xlabel('n')
ylabel('error')