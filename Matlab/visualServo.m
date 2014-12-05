function visualServo(roboC, finishC)

    lineTime = 0.089175;        %Time to move one pixel
    rotTime = 0.16487;          %Time to rotate one deg

    %roboC(x,y) and finishC(y,x)
    
    x = roboC(1) - finishC(2);
    if x < 0                  %Robot has travelled further than destination
        x = abs(x);
        goingBack = 1;       
    else
        goingBack = 0;
    end
    
    y = finishC(1) - roboC(2);
    if y < 0                    %Robot is lower than destination
        y = abs(y);
        goingUp = 1;         
    else
        goingUp = 0;
    end
    
    distance = sqrt(x^2 + y^2);
    radangle = asin(y / distance);
    
    angle = radangle*(180/pi);
    
    pauseRot = rotTime * angle;
    pauseLine = lineTime * distance;
    
    %Rotate required amount
    if goingUp == 1;
        if goingBack == 1;
            send_command('D,-1,1'); %Left
            pause(pauseRot);
            send_command('D,-1,-1'); %Reverse
            pause(pauseLine);
            send_command('D,0,0');
            send_command('D,1,-1'); %Face front
            pause(pauseRot);
        elseif goingBack == 0;
            send_command('D,1,-1'); %Right
            pause(pauseRot);
            send_command('D,1,1'); %Forward
            pause(pauseLine);
            send_command('D,0,0');
            send_command('D,-1,1'); %Face front
            pause(pauseRot);
        end
    end
    send_command('D,0,0');
    
    if goingUp == 0;
        if goingBack == 1;
            send_command('D,1,-1'); %Right
            pause(pauseRot);
            send_command('D,-1,-1'); %Reverse
            pause(pauseLine);
            send_command('D,0,0');
            send_command('D,-1,1'); %Face front
            pause(pauseRot);
        elseif goingBack == 0;
            send_command('D,-1,1'); %Left
            pause(pauseRot);
            send_command('D,1,1'); %Forward
            pause(pauseLine);
            send_command('D,0,0');
            send_command('D,1,-1'); %Face front
            pause(pauseRot);
        end
    end
    send_command('D,0,0');