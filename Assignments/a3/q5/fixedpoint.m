
function [xvect,xdif,fx,nit]=fixedpoint(x0,tol,nmax,fun,phi)
    %FIXPOINT Fixed-point iteration
    % [XVECT,XDIF,FX,NIT]=FIXPOINT(X0,TOL,NMAX,FUN,PHI) tries to find a zero % of the continuous function FUN using the fixed-point iteration X=PHI(X), starting % from the initial guess X0. XVECT is the vector of iterates, XDIF the vector of the % differences between consecutive iterates, FX the residual. TOL specifies the
    % tolerance of the method.
    err=tol+1; nit=0;
    xvect=x0; x=x0; fx=eval(fun); xdif=[];
    while nit<nmax & err>tol
        nit=nit+1;
        x=xvect(nit);
        xn=eval(phi);
        err=abs(xn-x);
        xdif=[xdif; err];
        x=xn; xvect=[xvect;x]; fx=[fx;eval(fun)];
    end
return

