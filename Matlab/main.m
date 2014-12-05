%-----------------------Connect to Robot-----------------------------------

path(path,'/afs/inf.ed.ac.uk/user/s08/s0831408/Thirdyear/IVR/Matlab/Webot_interface/tcp_udp_ip');
path(path,'/afs/inf.ed.ac.uk/user/s08/s0831408/Thirdyear/IVR/Matlab/Webot_interface/robot_commands');

%--------------------------------------------------------------------------
%-------------------------Image Capturing----------------------------------

%Use this image to help reduce the effects of shadowing
%blankImage = imageCapture('Blank',0,0,0,1);
%prompt = input('Is the maze in place? Press return to continue.', 's');

cleanimage1 = imageCapture('Maze',1,2,3,4);
%cleanimage1 = abs(cleanimage1 - blankImage);
prompt = input('Are the obstacles in place? Press return to continue.', 's');

cleanimage2 = imageCapture('Scene',1,2,3,4);
prompt = input('Is the robot in place? Press return to continue.', 's');

cleanimage3 = imageCapture('Robot',1,2,3,4);
prompt = input('Good to go? Press return to continue.', 's');

%--------------------------------------------------------------------------
%------------------------Calculate Homography------------------------------

[centroids bigSize] = findCentroids(cleanimage1, 450, 1500, 0, 5);    %Points from image
projections = [43 67; 597 67; 43 413; 597 413];             %Move to points

orderedCentroids = orderCentroids(centroids, projections);

estimation = esthomog(projections,orderedCentroids,4);
rawHomography = homographise(estimation,cleanimage1,6);

%--------------------------------------------------------------------------
%------------------------Calculate Image Rotation--------------------------

[smallCircleCentroids smallSize] = findCentroids(rawHomography, 100, 250, 0, 7);

imsize = size(cleanimage1);
rotateDeg = rotatecheck(smallCircleCentroids,imsize);

mazeHomography = imrotate(rawHomography,rotateDeg);
figure(7)
imshow(mazeHomography);

%--------------------------------------------------------------------------
%--------------------------Detect Free Path--------------------------------

duploHomography = homographise(estimation,cleanimage2,8);
duploHomography = imrotate(duploHomography,rotateDeg);
figure(8)
imshow(duploHomography);

onlyDuplo = abs(duploHomography - mazeHomography);
cleanDuplo = cleanup(onlyDuplo,1,1,9);

[duplo_centroids duploSize] = findCentroids(cleanDuplo, 4000, 7250, 0, 10);

freePath = findFreePath(duplo_centroids,1); %world = 1 (real world khepara)

%--------------------------------------------------------------------------
%-------------------------Find Robot---------------------------------------

roboHomography = homographise(estimation,cleanimage3,11);
roboHomography = imrotate(roboHomography,rotateDeg);
figure(11)
imshow(roboHomography);

onlyRobot = abs(roboHomography - duploHomography);
cleanRobot = cleanup(onlyRobot,1,1,12);

[start_centroid roboSize] = findCentroids(cleanRobot, 6000, 11500, 0, 13);

%--------------------------------------------------------------------------
%--------------------------Plan Route--------------------------------------

%Find starting point

[start finishLoc] = findStartLocation(start_centroid, smallCircleCentroids, 1);


%--------------------------------------------------------------------------
%----------------------------Execute route---------------------------------

doRoute(start, freePath);

%--------------------------------------------------------------------------
%----------------------------Servoing--------------------------------------
servoImage = imageCapture('Servo',19,0,0,14);
servoHomography = homographise(estimation,servoImage,0);
servoHomography = imrotate(servoHomography,rotateDeg);
onlyServoRobot = abs(servoHomography - duploHomography);

%onlyServoRobot = cleanup(onlyServoRobot,1,1,15); %further clean up
figure(15)
imshow(onlyServoRobot);

[roboLoc finishSize] = findCentroids(onlyServoRobot, 5000, 11500, 0, 16);

while (abs(roboLoc(1) - finishLoc(2)) > 4) && (abs(roboLoc(2) - finishLoc(1)) > 4)

    servoImage = imageCapture('Servo',0,0,0,17);
    servoHomography = homographise(estimation,servoImage,0);
    servoHomography = imrotate(servoHomography,rotateDeg);
    onlyServoRobot = abs(servoHomography - duploHomography);
    
    onlyServoRobot = cleanup(onlyServoRobot,1,0,17); %further clean up
    
    [roboLoc finishSize] = findCentroids(onlyServoRobot, 7000, 11500, 0, 18);
    
    prompt = input('Do you want to continue servoing? Press return to continue.', 's');

    visualServo(roboLoc, finishLoc);
end
disp('Visual Servoing Complete')
