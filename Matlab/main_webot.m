%-----------------------Connect to Robot-----------------------------------

path(path,'/afs/inf.ed.ac.uk/user/s08/s0831408/Thirdyear/IVR/Matlab/Webot_interface/tcp_udp_ip');
path(path,'/afs/inf.ed.ac.uk/user/s08/s0831408/Thirdyear/IVR/Matlab/Webot_interface/robot_commands');
path(path,'/tmp/');

%--------------------------------------------------------------------------
%-------------------------Image Capturing----------------------------------

snapEmpty = webotsCapture('snapshot',1,2,3,4);

prompt = input('Snapped Maze!', 's');

snapElements = webotsCapture('snapshot',4,5,6,7);

prompt = input('Snapped Elements!', 's');

%--------------------------------------------------------------------------
%------------------------Calculate Homography------------------------------

[centroids bigSize] = findCentroids(snapElements, 50, 120, 0, 8);  %Points from image
projections = [21 33; 299 33; 21 207; 299 207];                     %Move to points

orderedCentroids = orderCentroids(centroids, projections);

estimation = esthomog(projections,orderedCentroids,4);
rawHomography = homographise(estimation,snapEmpty,10);
homoSnap = homographise(estimation,snapEmpty,11);

%--------------------------------------------------------------------------
%------------------------Calculate Image Rotation--------------------------

[smallCircleCentroids smallSize] = findCentroids(homoSnap, 10, 75, 0, 12);

imsize = size(snapEmpty);
rotateDeg = rotatecheck(smallCircleCentroids,imsize);

mazeHomoSnap = imrotate(homoSnap,rotateDeg);
figure(13)
imshow(mazeHomoSnap);

%--------------------------------------------------------------------------
%--------------------------Detect Free Path--------------------------------

elementsHomoSnap = homographise(estimation,snapElements,0);
elementsHomoSnap = imrotate(elementsHomoSnap,rotateDeg);
figure(14)
imshow(elementsHomoSnap);

onlyElements = abs(elementsHomoSnap - mazeHomoSnap);
figure(15)
imshow(onlyElements);

[block_centroids blocksSize] = findCentroids(onlyElements, 100, 1000, 0, 16);

freePath = findFreePath(block_centroids,2); %world=2 (webots)

%--------------------------------------------------------------------------
%-------------------------Find Robot---------------------------------------

[botCentroid botSize] = findCentroids(onlyElements, 10, 50, 0, 17);

%--------------------------------------------------------------------------
%--------------------------Plan Route--------------------------------------

[start finishLoc] = findStartLocation(botCentroid, smallCircleCentroids, 2);

%--------------------------------------------------------------------------
%----------------------------Execute route---------------------------------


webotRoute(start, freePath);