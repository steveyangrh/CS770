X = 0:0.25:0.75;
f = X;

[C1,~] = myDFT(f,X,X);
C2 = fft(f);

4*C1-C2 == 0