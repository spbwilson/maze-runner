function rotateDeg = rotatecheck(sc,num)

    y = num(1)/2;
    x = num(2)/2;

    %Detect the origin of image via start point centroid location
    %And rotate image so that start points are on on the left
    
    if (sc(3) < y) && (sc(4) < y)       %Start points located at top
        rotateDeg = 90;
    
    elseif (sc(1) < x) && (sc(2) < x)   %Start points located on left
        rotateDeg = 0;
    
    elseif (sc(1) > x) && (sc(2) > x)   %Start points located on right
        rotateDeg = 180;
    
    else                                    %Start points located at bottom 
        rotateDeg = 270;
    end
    