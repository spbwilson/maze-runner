function string=read_command()
% depending on the status of the global variable ROBOT 
% and whether the appropriate connection is established
% reads a line from the serial port or to the tcpip connection
global ROBOT
global FID
global S

if ROBOT > 0
    string = fscanf(S)
elseif ROBOT < 0
    string = pnet(FID,'readline')
else 
    disp('Cannot read command - Not connected to anything')
end
