function doRoute(start, path)

deg3 = 0.16487;    %Turn 2.865983 degrees
deg90 = 5.1775;
degpause = 0.5;
a = 5.65;
b = 10.95;
c = 5.57;
d = 12.66;
A = 20.24;
B = 21.29;

if path == 1
    if start == 1               %Path 1 from point 1 to 2
        send_command('D,1,1');
        pause(a);
        send_command('D,0,0');
        pause(degpause);
        send_command('D,1,-1');
        pause(deg90);
        
        send_command('D,1,1');
        pause(A);
        send_command('D,0,0');
        pause(degpause);
        send_command('D,1,-1');
        pause(deg90);
        
        send_command('D,1,1');
        pause(a);
        send_command('D,0,0');
    elseif start == 2                        %Path 1 from point 2 to 1
        send_command('D,1,1');
        pause(a);
        send_command('D,0,0');
        pause(degpause);
        send_command('D,-1,1');
        pause(deg90);
        
        send_command('D,1,1');
        pause(A);
        send_command('D,0,0');
        pause(degpause);
        send_command('D,-1,1');
        pause(deg90);
        
        send_command('D,1,1');
        pause(a);
        send_command('D,0,0');
    end
end

if path == 2
    straight = c;               
elseif path == 3
    straight = c + d;
end

if (start == 1) && (path == 2 || path == 3)
    send_command('D,-1,1');
    pause(deg3);
    send_command('D,1,1');
    pause(b);
    send_command('D,0,0');
    pause(degpause);
    send_command('D,1,-1');
    pause(deg3);
    send_command('D,1,1');
    pause(straight);
    send_command('D,0,0');
    pause(degpause);
    send_command('D,1,-1');
    pause(deg90);
    
    send_command('D,1,1');
    pause(B);
    send_command('D,0,0');
    pause(degpause);
    send_command('D,1,-1');
    pause(deg90);
    
    send_command('D,1,1');
    pause(straight);
    send_command('D,0,0');
    pause(degpause);
    send_command('D,1,-1');
    pause(deg3);
    send_command('D,1,1');
    pause(b);
    send_command('D,0,0');
    pause(degpause);
    send_command('D,-1,1');
    pause(deg3);
    send_command('D,0,0');
elseif (start == 2) && (path == 2 || path == 3)
    send_command('D,1,-1');
    pause(deg3);
    send_command('D,1,1');
    pause(b);
    send_command('D,0,0');
    pause(degpause);
    send_command('D,-1,1');
    pause(deg3);
    send_command('D,1,1');
    pause(straight);
    send_command('D,0,0');
    pause(degpause);
    send_command('D,-1,1');
    pause(deg90);
    
    send_command('D,1,1');
    pause(B);
    send_command('D,0,0');
    pause(degpause);
    send_command('D,-1,1');
    pause(deg90);
    
    send_command('D,1,1');
    pause(straight);
    send_command('D,0,0');
    pause(degpause);
    send_command('D,-1,1');
    pause(deg3);
    send_command('D,1,1');
    pause(b);
    send_command('D,0,0');
    pause(degpause);
    send_command('D,1,-1');
    pause(deg3);
    send_command('D,0,0');
end
end