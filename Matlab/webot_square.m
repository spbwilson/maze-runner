
for r = 1 : 4
    send_command('D,10,10');
    read_command;
    pause(23.8);
    send_command('D,-5,5');
    read_command;
    pause(9.8);
end

send_command('D,0,0');
read_command;