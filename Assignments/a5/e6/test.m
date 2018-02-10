phone_number = ['0','5','0','8','6','4','7','7','0','0','1'];


for i = 1:10
    [j,k] = touch(phone_number(i));

    fr = [697 770 852 941];
    fc = [1209 1336 1477];

    Fs = 32768;
    t = 0:1/Fs:0.25;

    y1 = sin(2*pi*fr(k)*t);
    y2 = sin(2*pi*fc(j)*t);
    y = (y1 + y2)/2;
    sound(y,Fs)
    pause(0.4)
end