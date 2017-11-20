function [j,k] = touch(s)
    switch s
        case '*'
            k = 4; 
            j = 1;
        case '0'
            k = 4; j = 2;
        case '#'
            k = 4; 
            j = 3;
        otherwise
            d = s-'0'; 
            j = mod(d-1,3)+1; 
            k = (d-j)/3+1;
    end
end