function webotRoute(start, freePath)

a = 10;
b = 17.5;
A = 22.5;

rot = 10;


if(freePath == 1)
    if(start == 1)
        send_command('D,20,20')
        pause(a)
        send_command('D,10,-10')
        pause(rot)
        send_command('D,20,20')
        pause(A)
        send_command('D,10,-10')
        pause(rot)
        send_command('D,20,20')
        pause(a)
        send_command('D,0,0')
    elseif(start == 2)
        send_command('D,20,20')
        pause(a)
        send_command('D,-10,10')
        pause(rot)
        send_command('D,20,20')
        pause(A)
        send_command('D,-10,10')
        pause(rot)
        send_command('D,20,20')
        pause(a)
        send_command('D,0,0')
    end
end

if freePath == 2
    longLen = a+b;
elseif freePath == 3
    longLen = a+(b*2);
end

if(start == 1) && (freePath == 2 || freePath == 3)
        send_command('D,20,20')
        pause(a+b)
        send_command('D,10,-10')
        pause(rot)
        send_command('D,20,20')
        pause(A)
        send_command('D,10,-10')
        pause(rot)
        send_command('D,20,20')
        pause(longLen)
        send_command('D,0,0')
elseif(start == 2) && (freePath == 2 || freePath == 3)
        send_command('D,20,20')
        pause(longLen)
        send_command('D,-10,10')
        pause(rot)
        send_command('D,20,20')
        pause(A)
        send_command('D,-10,10')
        pause(rot)
        send_command('D,20,20')
        pause(longLen)
        send_command('D,0,0')
end
end