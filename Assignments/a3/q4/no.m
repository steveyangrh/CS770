for i = 500:-0.005:0
    plot(i,(i^2+1)./(i+1),'o');
    plot(i,i,'+');
    hold on;
end